import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

import '../../../utils/shared_pref.dart';

class HomeProvider with ChangeNotifier {
  String searchEngine = "google";
  double? progress;
  List<String> bookMark = [];
  Connectivity connectivity = Connectivity();
  bool isInternetOn = false;

  void check(double value) {
    progress = value;
    notifyListeners();
  }

  void changeSearchEngine(value) {
    searchEngine = value;
    notifyListeners();
  }

  Future<void> addBookMark(String bookmarkData) async {
    List<String>? data = await getBookMark();
    if (data != null) {
      data.add(bookmarkData);
      setBookMark(data);
    } else {
      setBookMark([bookmarkData]);
    }
    getBookMarkData();
    notifyListeners();
  }

  Future<void> getBookMarkData() async {
    var list = await getBookMark();
    if (list != null) {
      bookMark = list;
      notifyListeners();
    }
  }
  void deleteBookMark(int index) {
    bookMark.removeAt(index);
    setBookMark(bookMark);
    notifyListeners();
  }


  void checkInternet() async {
    connectivity.onConnectivityChanged.listen(
          (event) {
        if (event.contains(ConnectivityResult.none)) {

          isInternetOn = false;
        } else {

          isInternetOn = true;
        }
        notifyListeners();
      },
    );
  }
}
