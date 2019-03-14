import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/model.dart';

@Component(
  selector: 'feed-display',
  styleUrls: ['feed_display_component.css'],
  templateUrl: 'feed_display_component.html',
  directives: [coreDirectives]
)
class FeedDisplayComponent {

  @Input()
  Feed feed;

  String get title => feed != null ? feed.title : "";

  String get subHeader=> feed != null ? feed.subHeader : "";

  List<FeedImage> get images => (feed != null && feed.images != null) ? feed.images : List();
}