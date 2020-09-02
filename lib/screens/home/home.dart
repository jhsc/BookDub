import 'package:book_dub/screens/root/root.dart';
import 'package:book_dub/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("This is Home"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Sign Out"),
          onPressed: () async {
            CurrentUser _currentUser =
                Provider.of<CurrentUser>(context, listen: false);
            String _ret = await _currentUser.signOut();
            if (_ret == "success") {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OurRoot(),
                  ),
                  (route) => false);
            }
          },
        ),
      ),
    );
  }
}
