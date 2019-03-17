import 'dart:async';

import 'package:firebase/firebase.dart';
import 'package:picturesque_web/src/data/feed_list.dart';
import 'package:picturesque_web/src/data/feed_store.dart';
import 'package:picturesque_web/src/data/model.dart';

enum PhotoFeedUpdate {
  ADDED, REMOVED, CHANGED
}

class PhotoFeed {
  final String _feedName;
  final FeedStore _store;

  final List<Feed> _feed = List();
  final List<StreamSubscription<QueryEvent>> _subscriptions = List();

  final StreamController<PhotoFeedUpdate> _onChanged = StreamController.broadcast();

  Stream<PhotoFeedUpdate> get onChanged => _onChanged.stream;

  List<Feed> get feed => _feed;

  PhotoFeed(this._feedName, this._store);

  void initialize() {
    var ref = _store.feed(this._feedName);

    var subscriptionAdd = ref.onChildAdded.listen((e) {
      String key = e.snapshot.key;
      Map values = e.snapshot.val();
      _feed.add(Feed.fromMap(key, this._feedName, values));
      _onChanged.add(PhotoFeedUpdate.ADDED);
    });
    _subscriptions.add(subscriptionAdd);

    var subscriptionRemoved = ref.onChildRemoved.listen((e) {
      String key = e.snapshot.key;
      _feed.removeWhere((f) => f.id == key);
      _onChanged.add(PhotoFeedUpdate.ADDED);
    });
    _subscriptions.add(subscriptionRemoved);

    var subscriptionChanged = ref.onChildChanged.listen((e) {
      String key = e.snapshot.key;
      Map values = e.snapshot.val();
      var updated = Feed.fromMap(key, this._feedName, values);
      int index = _feed.indexWhere((f) => f.id == key);
      if (index >= 0) {
        this._feed[index] = updated;
      } else {
        this._feed.add(updated);
      }
      _onChanged.add(PhotoFeedUpdate.CHANGED);
    });
    _subscriptions.add(subscriptionChanged);
  }

  void finalize() {
    _subscriptions.forEach((s) => s.cancel());
  }
}