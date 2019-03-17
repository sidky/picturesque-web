import 'dart:html';

import 'package:angular/angular.dart';

@Directive(
  selector: '[focus]'
)
class FocusDirective implements AfterViewChecked {

  HtmlElement _element;

  FocusDirective(this._element);

  @override
  void ngAfterViewChecked() {
    print("AfterViewCheckec");
    this._element.focus();
  }
}