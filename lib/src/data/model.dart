class FeedImage {
  final String url;
  final String caption;

  const FeedImage(this.url, this.caption);

  factory FeedImage.fromMap(Map values) {
    var caption = values['caption'];
    var url = values['image'];

    return FeedImage(url, caption);
  }
}

class Feed {
  final String feedName;
  final String id;
  final String title;
  final String subHeader;
  final String url;
  final DateTime updatedAt;
  final List<FeedImage> images;

  const Feed(this.feedName, this.id, this.title, this.subHeader, this.url, this.updatedAt, this.images);

  factory Feed.fromMap(String id, String feedName, Map values) {
    var title = values['title'];
    var subHeader = values['subHeader'];
    var updated = DateTime.fromMillisecondsSinceEpoch(values['updated']);
    var url = values['url'];

    List<dynamic> images = values['images'];
    var feedImages = images.map((img) => FeedImage.fromMap(img));

    return Feed(feedName, id, title, subHeader, url, updated, feedImages);
  }
}