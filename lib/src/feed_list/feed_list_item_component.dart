import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/feed_store.dart';
import 'package:picturesque_web/src/data/model.dart';
import 'package:picturesque_web/src/service/feed_service.dart';

@Component(
  selector: 'feed-list-item',
  styleUrls: ['feed_list_item_component.css'],
  templateUrl: 'feed_list_item_component.html',
  directives: const [ NgStyle ]
)
class FeedListItemComponent {

  FeedService _service;

  FeedListItemComponent(this._service);

  @Input()
  Feed feed;

  String get caption => feed.title;

  String get imageUrl {
    if (feed.images == null || feed.images.isEmpty) {
      print(feed.title);
    }
    return feed.images.first.url;
  }

  String get feedIcon => _service.feedIcon(feed.feedName);

  Map<String, String> get backgroundStyle {
    var backgroundStyle = {
      'background-color': _service.iconBackground(feed.feedName).rgbString
    };

    return backgroundStyle;
  }
}