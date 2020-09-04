import 'package:book_dub/screens/root/root.dart';
import 'package:book_dub/screens/signup/signup.dart';
import 'package:book_dub/states/currentUser.dart';
import 'package:book_dub/widgets/our_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum LoginType {
  email,
  google,
}

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _loginUser(
      {@required LoginType type,
      BuildContext context,
      String email,
      password}) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      String _ret;

      switch (type) {
        case LoginType.email:
          _ret = await _currentUser.loginUserWithEmail(email, password);
          break;
        case LoginType.google:
          _ret = await _currentUser.loginUserWithGoogle();
          break;
        default:
      }

      if (_ret == "success") {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => OurRoot(),
            ),
            (route) => false);
      } else {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(_ret),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Widget _googleButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        _loginUser(
          type: LoginType.google,
          context: context,
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: AssetImage("assets/google_logo.png"),
              height: 25.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Sign in with Google",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            child: Text(
              "Log In",
              style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            controller: _passwordController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock_outline),
              hintText: "Password",
            ),
            obscureText: true,
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 100),
              child: Text(
                "Log In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            onPressed: () {
              _loginUser(
                type: LoginType.email,
                context: context,
                email: _emailController.text,
                password: _passwordController.text,
              );
            },
          ),
          FlatButton(
            child: Text("Don't have an account? Sign up here"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => OurSignup(),
                ),
              );
            },
          ),
          _googleButton(),
        ],
      ),
    );
  }
}
