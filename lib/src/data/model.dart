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
    var subHeader = values['subheader'];
    var updated = DateTime.fromMillisecondsSinceEpoch(values['updated'] * 1000);
    var url = values['url'];

    var feedImages = List<FeedImage>();

    if (values.containsKey('images')) {
      List images = values['images'];
      images.forEach((value) {
        var img = FeedImage.fromMap(value);
        feedImages.add(img);
      });
    }

    return Feed(feedName, id, title, subHeader, url, updated, feedImages);
  }
}

class FeedImageSelection {
  final Feed feed;
  final int index;

  FeedImageSelection(this.feed, this.index);
}