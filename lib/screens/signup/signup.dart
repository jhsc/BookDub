import 'package:book_dub/screens/signup/localwidgets/signup_form.dart';
import 'package:flutter/material.dart';

class OurSignup extends StatelessWidget {
  const OurSignup({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BackButton(),
                  ],
                ),
                SizedBox(height: 40.0),
                OurSignupForm(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
