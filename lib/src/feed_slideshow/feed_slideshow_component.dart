import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:picturesque_web/src/data/model.dart';
import 'package:picturesque_web/src/service/focus_directive.dart';

@Component(
  selector: 'feed-slide-show',
  styleUrls: ['feed_slideshow_component.css'],
  templateUrl: 'feed_slideshow_component.html',
  directives: [coreDirectives]
)
class FeedSlideShowComponent extends AfterViewChecked {

  StreamController<bool> _onClose = StreamController.broadcast(sync: true);

  HtmlElement _element;

  List<FeedImage> _images;
  int _index;

  @Input()
  set selection(FeedImageSelection sel) {
    _images = (sel != null) ? sel.feed.images : List();
    _index = (sel != null) ? sel.index : null;
  }

  @Output()
  Stream<bool> get onClose => _onClose.stream;

  FeedSlideShowComponent(this._element);

  FeedImage get _image {
    if (_index == null) {
      return null;
    } else if (_index >= _images.length) {
      return _images.last;
    } else {
      return _images[_index];
    }
  }

  String get url {
    var img = _image;
    if (img != null) {
      return img.url;
    } else {
      return null;
    }
  }

  String get caption {
    var img = _image;
    if (img != null) {
      return img.caption;
    } else {
      return null;
    }
  }

  onEscape(KeyboardEvent event) {
    _onClose.add(true);
  }

  onKeyPress(KeyboardEvent event) {
    print(event);
  }

  @override
  void ngAfterViewChecked() {
    print("after view checked");
    _element.focus();
    // TODO: implement ngAfterViewChecked
  }

  previous() {
    if (_index != null && _index > 0) {
      _index--;
    }
  }

  next() {
    if (_index != null && _index + 1 < _images.length) {
      _index++;
    }
  }

  doubleClick() {
    print("Double click");
    _onClose.add(true);
  }
}