import 'package:book_dub/screens/add_book/add_book.dart';
import 'package:book_dub/widgets/our_container.dart';
import 'package:flutter/material.dart';

class OurCreateGroup extends StatefulWidget {
  OurCreateGroup({Key key}) : super(key: key);

  @override
  _OurCreateGroupState createState() => _OurCreateGroupState();
}

class _OurCreateGroupState extends State<OurCreateGroup> {
  TextEditingController _groupNameController = TextEditingController();

  void _goToAddBook(BuildContext context, String groupName) async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OurAddBook(
          onGroupCreation: true,
          groupName: groupName,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[BackButton()],
            ),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: OurContainer(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _groupNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.group),
                      hintText: "Group Name",
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  RaisedButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 100),
                      child: Text(
                        "Add Book",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    onPressed: () =>
                        _goToAddBook(context, _groupNameController.text),
                  ),
                ],
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
