import 'package:angular/angular.dart';
import 'package:angular_components/utils/color/color.dart';
import 'package:picturesque_web/src/data/feed_aggregate.dart';
import 'package:picturesque_web/src/data/feed_list.dart';
import 'package:picturesque_web/src/data/feed_store.dart';
import 'package:picturesque_web/src/data/photo_feed.dart';

@Injectable()
class FeedService {
  final FeedStore _store;
  final FeedAggregate _aggregate;

  FeedList _feedList;

  FeedService(this._store) : _aggregate = FeedAggregate() {

    _store.getAllFeeds().then((fl) {
      this._feedList = fl;

      this._feedList.allFeedNames.forEach((feed) {
        var pf = PhotoFeed(feed, this._store);
        _aggregate.add(pf);
        pf.initialize();
      });
    });
  }


  FeedAggregate get aggregate => _aggregate;

  String feedIcon(String feedName) => _feedList.feedList[feedName]?.icon;

  Color iconBackground(String feedName) => _feedList.feedList[feedName]?.background;
}