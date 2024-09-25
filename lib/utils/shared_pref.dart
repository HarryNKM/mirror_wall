import 'package:shared_preferences/shared_preferences.dart';

Future<void> setBookMark(List<String> listData) async {
  SharedPreferences bookMarkList = await SharedPreferences.getInstance();
  await bookMarkList.setStringList('bookMark', listData);
}

Future<List<String>?> getBookMark() async {
  List<String>? book = [];
  SharedPreferences bookMarkList = await SharedPreferences.getInstance();
  book = bookMarkList.getStringList('bookMark');
  return book;
}