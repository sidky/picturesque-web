import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import 'package:picturesque_web/src/secret.dart';

@Injectable()
class FeedStore {
  static FeedStore _instance;

  FeedStore._internal() {
    var app = initializeApp(
      apiKey: googleAPIKey,
      ap
    );
  }
}