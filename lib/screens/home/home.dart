import 'package:book_dub/screens/no_group/no_group.dart';
import 'package:book_dub/screens/root/root.dart';
import 'package:book_dub/states/currentGroup.dart';
import 'package:book_dub/states/currentUser.dart';
import 'package:book_dub/widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    CurrentGroup _currentGroup =
        Provider.of<CurrentGroup>(context, listen: false);
    _currentGroup.updateStateFromDatabase(_currentUser.getCurrentUser.groupId);
  }

  void _goToNoGroup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OurNoGroup(),
      ),
    );
  }

  void _signOut(BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _ret = await _currentUser.signOut();
    if (_ret == "success") {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => OurRoot(),
          ),
          (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: OurContainer(
            child: Consumer<CurrentGroup>(
              builder: (BuildContext context, value, Widget child) {
                String dueDate = "loading..";
                if (value.getCurrentGroup.currentBookDue != null) {
                  dueDate = value.getCurrentGroup.currentBookDue
                      .toDate()
                      .toLocal()
                      .toString();
                }
                return Column(
                  children: <Widget>[
                    Text(
                      value.getCurrentBook.name ?? "loading..",
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.grey[600],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Due in:",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.grey[600],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              dueDate,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text(
                        "Finished Book",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: OurContainer(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Next Book Revealed In:",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.grey[600],
                    ),
                  ),
                  Text(
                    "22 Hours",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 20.0,
          ),
          child: RaisedButton(
            child: Text(
              "Book Club History",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => _goToNoGroup(context),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: RaisedButton(
            child: Text("Sign Out"),
            onPressed: () => _signOut(context),
            color: Theme.of(context).canvasColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
              side: BorderSide(
                color: Theme.of(context).secondaryHeaderColor,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
