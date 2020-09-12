import 'package:book_dub/models/book.dart';
import 'package:book_dub/models/group.dart';
import 'package:book_dub/services/database.dart';
import 'package:flutter/material.dart';

class CurrentGroup extends ChangeNotifier {
  OurGroup _currentGroup = OurGroup();
  OurBook _currentBook = OurBook();
  bool _doneWithCurrentBook = false;

  OurGroup get getCurrentGroup => _currentGroup;
  OurBook get getCurrentBook => _currentBook;
  bool get getDoneWithCurrentBook => _doneWithCurrentBook;

  void updateStateFromDatabase(String groupId, uid) async {
    try {
      //get the group info
      _currentGroup = await OurDatabase().getGroupInfo(groupId);
      _currentBook = await OurDatabase()
          .getCurrentBook(groupId, _currentGroup.currentBookId);
      _doneWithCurrentBook = await OurDatabase()
          .isUserDoneWithBook(groupId, _currentGroup.currentBookId, uid);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void finishedBook(String userUid, rating, review) async {
    try {
      await OurDatabase().finishedBook(_currentBook.id,
          _currentGroup.currentBookId, userUid, rating, review);
      _doneWithCurrentBook = true;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
