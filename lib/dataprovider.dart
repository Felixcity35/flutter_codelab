import 'package:english_words/english_words.dart';
import 'package:flutter/widgets.dart';

class DataProvider extends ChangeNotifier {
  var wordRan = WordPair.random();

  void getNext() {
    wordRan = WordPair.random();
    notifyListeners();
  }

  var favourite = <WordPair>[];

  void toggleFavourite() {
    if (favourite.contains(wordRan)) {
      favourite.remove(wordRan);
    } else {
      favourite.add(wordRan);
    }
    notifyListeners();
  }
}
