import 'package:book_dub/screens/create_group/create_group.dart';
import 'package:book_dub/screens/join_group/join_group.dart';
import 'package:flutter/material.dart';

class OurNoGroup extends StatelessWidget {
  const OurNoGroup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void _goToJoin(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurJoinGroup(),
        ),
      );
    }

    void _goToCreate(BuildContext context) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OurCreateGroup(),
        ),
      );
    }

    return Scaffold(
      body: Column(
        children: <Widget>[
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset("assets/logo.png"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "Welcome To BookDub",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40.0, color: Colors.grey[600]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Since you're not in a book club, you can select either to join a clb or create a club.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20.0, color: Colors.grey[600]),
            ),
          ),
          Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  child: Text("Create"),
                  onPressed: () => _goToCreate(context),
                  color: Theme.of(context).canvasColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: BorderSide(
                      color: Theme.of(context).secondaryHeaderColor,
                      width: 2,
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text(
                    "Join",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () => _goToJoin(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
