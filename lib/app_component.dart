import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/feed_store.dart';
import 'package:picturesque_web/src/data/model.dart';
import 'package:picturesque_web/src/feed_display/feed_display_component.dart';
import 'package:picturesque_web/src/feed_list/feed_list_component.dart';
import 'package:picturesque_web/src/feed_slideshow/feed_slideshow_component.dart';
import 'package:picturesque_web/src/service/feed_service.dart';

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [FeedListComponent, FeedDisplayComponent, FeedSlideShowComponent, NgIf],
  providers: const [
    ClassProvider(FeedStore),
    ClassProvider(FeedService),
  ]
)
class AppComponent extends OnInit {
  Feed selectedFeed;
  bool _userSelected = false;

  FeedService _service;

  bool showSlideShow = false;

  AppComponent(this._service);

  FeedImageSelection slideShowSelection;

  onFeedSelected(Feed feed) {
    _userSelected = true;
    selectedFeed = feed;
  }

  @override
  void ngOnInit() {
    _service.aggregate.onUpdated.listen((feed) {
      if (feed.isNotEmpty && _userSelected == false) {
        selectedFeed = feed.first;
      }
    });
  }

  openSlideShow(FeedImageSelection selection) {
    slideShowSelection = selection;
    showSlideShow = true;
  }

  closeSlideShow() {
    showSlideShow = false;
  }
}
