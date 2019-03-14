import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/feed_aggregate.dart';
import 'package:picturesque_web/src/data/feed_store.dart';
import 'package:picturesque_web/src/data/photo_feed.dart';

@Injectable()
class FeedService {
  static const _feedNames = ["bigpicture", "infocus", "inpicture"];

  final FeedStore _store;
  final FeedAggregate _aggregate;

  FeedService(this._store) : _aggregate = FeedAggregate() {
    _feedNames.forEach((f) {
      var pf = PhotoFeed(f, this._store);
      _aggregate.add(pf);
      pf.initialize();
    });
  }

  FeedAggregate get aggregate => _aggregate;
}