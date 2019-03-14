import 'dart:async';

import 'package:picturesque_web/src/data/model.dart';
import 'package:picturesque_web/src/data/photo_feed.dart';

class FeedAggregate {
  final List<PhotoFeed> _feeds = List();
  final List<StreamSubscription<PhotoFeedUpdate>> _subscriptions = List();

  List<Feed> _aggregatedFeed = List();

  final StreamController<List<Feed>> _onUpdated = StreamController.broadcast();

  Stream<List<Feed>> get onUpdated => _onUpdated.stream;

  void add(PhotoFeed feed) {
    _feeds.add(feed);
    _subscriptions.add(feed.onChanged.listen((update) => _buildFeed()));
  }

  void _buildFeed() {
    List<Feed> newFeed = List();

    _feeds.forEach((f) => newFeed.addAll(f.feed));
    newFeed.sort((f1, f2) => f2.updatedAt.compareTo(f1.updatedAt));

    feeds = newFeed;
  }

  void finalize() {
    _subscriptions.forEach((f) => f.cancel());
  }

  List<Feed> get feeds => _aggregatedFeed;

  set feeds(List<Feed> f) {
    _aggregatedFeed = f;
    _onUpdated.add(f);
  }

}