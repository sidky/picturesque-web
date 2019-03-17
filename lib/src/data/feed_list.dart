import 'package:angular_components/utils/color/color.dart';

class FeedInfo {
  final Color background;
  final String icon;
  final String name;
  final String rss;
  final String home;

  FeedInfo(this.background, this.icon, this.name, this.rss, this.home);

  factory FeedInfo.fromMap(Map value) {
    var background = Color.parse(value['background']);
    var icon = value['icon'];
    var name = value['name'];
    var rss = value['rss'];
    var url = value['url'];

    return FeedInfo(background, icon, name, rss, url);
  }
}

class FeedList {
  final Map<String, FeedInfo> feedList;

  FeedList(this.feedList);

  factory FeedList.fromMap(Map allFeeds) {
    Map<String, FeedInfo> feeds = Map();

    allFeeds.forEach((key, value) {
      var info = FeedInfo.fromMap(value);
      feeds[key] = info;
    });

    return FeedList(feeds);
  }

  List<String> get allFeedNames => feedList.keys.toList(growable: false);
}