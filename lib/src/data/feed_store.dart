import 'package:angular/angular.dart';
import 'package:firebase/firebase.dart';

import 'package:picturesque_web/src/secret.dart';

@Injectable()
class FeedStore {

  static FeedStore _instance;

  final Database _db;

  FeedStore._internal() : this._db = database(_initializeApp());

  factory FeedStore() {
    if (_instance == null) {
      _instance = FeedStore._internal();
    }
    return _instance;
  }

  static App _initializeApp() => initializeApp(
      apiKey: googleAPIKey,
      authDomain: googleAuthDomain,
      databaseURL: firebaseDatabaseURL,
      projectId: firebaseProjectId,
      storageBucket: googleStorageBucket,
      messagingSenderId: googleMessagingSenderId
  );

  feed(String feedName) => this._db.ref(feedName);
}