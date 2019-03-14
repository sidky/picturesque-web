import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/model.dart';

@Component(
  selector: 'feed-list-item',
  styleUrls: ['feed_list_item_component.css'],
  templateUrl: 'feed_list_item_component.html'
)
class FeedListItemComponent {

  @Input()
  Feed feed;

  String get caption => feed.title;

  String get imageUrl {
    if (feed.images == null || feed.images.isEmpty) {
      print(feed.title);
    }
    return feed.images.first.url;
  }
}