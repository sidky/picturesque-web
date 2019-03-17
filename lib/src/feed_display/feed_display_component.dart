import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/model.dart';
import 'package:intl/intl.dart';

@Component(
  selector: 'feed-display',
  styleUrls: ['feed_display_component.css'],
  templateUrl: 'feed_display_component.html',
  directives: [coreDirectives]
)
class FeedDisplayComponent {

  final StreamController<FeedImageSelection> _onOpenSlideShow = StreamController.broadcast(sync: true);

  Feed _feed;

  Element _element;

  FeedDisplayComponent(this._element);

  @Input()
  set feed(Feed feed) {
    print("scroll top");
    this._feed = feed;
  }

  @Output()
  Stream<FeedImageSelection> get onOpenSlideShow => _onOpenSlideShow.stream;

  String get title => _feed != null ? _feed.title : "";

  String get subHeader=> _feed != null ? _feed.subHeader : "";

  String get url => _feed != null ? _feed.url : "";

  String get updatedAt {
    if (_feed == null) {
      return null;
    } else {
      print(_feed.updatedAt);
      var format = DateFormat("EEEE, MMMMd, y").add_jm();
      return format.format(_feed.updatedAt);
    }
  }

  List<FeedImage> get images => (_feed != null && _feed.images != null) ? _feed.images : List();

  openSlideShow(int index) {
//    print("Open slideshow: " + index.toString());
//    _onOpenSlideShow.add(FeedImageSelection(_feed, index));
  }
}