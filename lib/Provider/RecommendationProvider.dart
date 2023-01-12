import 'dart:math';

import 'package:flutter/cupertino.dart';

class RecommendationProvider with ChangeNotifier {
  List<String> _recommendations = [];

  List<String> get recommendations => _recommendations;

  void setRecommendations(List<String> recommendations) {
    _recommendations = recommendations;
    notifyListeners();
  }

  void addList(String book) {
    _recommendations.add(book);
    notifyListeners();
  }

  bool isExist(String book) {
    final isExist = _recommendations.contains(book);
    return isExist;
  }

  void removeList(String book) {
    _recommendations.remove(book);
    notifyListeners();
  }
}
