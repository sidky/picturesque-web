import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:picturesque_web/src/data/model.dart';
import 'package:picturesque_web/src/feed_list/feed_list_item_component.dart';
import 'package:picturesque_web/src/service/feed_service.dart';

@Component(
  selector: 'feed-list',
  styleUrls: ['feed_list_component.css'],
  templateUrl: 'feed_list_component.html',
  directives: const [
    FeedListItemComponent,
    NgModel,
    coreDirectives,
  ]
)
class FeedListComponent implements OnInit {

  final _onSelectFeed = StreamController<Feed>.broadcast(sync: true);

  @Output()
  Stream<Feed> get onSelectFeed => _onSelectFeed.stream;


  List<Feed> feeds;

  final FeedService _service;

  FeedListComponent(this._service);

  @override
  void ngOnInit() {
    this._service.aggregate.onUpdated.listen((updated) {
      this.feeds = updated;
    });
  }

  selectFeed(Feed feed) {
    print("selected");
    _onSelectFeed.add(feed);
  }
}