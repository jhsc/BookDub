import 'package:book_dub/models/book.dart';
import 'package:book_dub/models/group.dart';
import 'package:book_dub/services/database.dart';
import 'package:flutter/material.dart';

class CurrentGroup extends ChangeNotifier {
  OurGroup _currentGroup = OurGroup();
  OurBook _currentBook = OurBook();

  OurGroup get getCurrentGroup => _currentGroup;
  OurBook get getCurrentBook => _currentBook;

  void updateStateFromDatabase(String groupId) async {
    try {
      //get the group info
      _currentGroup = await OurDatabase().getGroupInfo(groupId);
      _currentBook = await OurDatabase()
          .getCurrentBook(groupId, _currentGroup.currentBookId);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
