import 'package:book_dub/widgets/our_container.dart';
import 'package:flutter/material.dart';

class OurLoginForm extends StatelessWidget {
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
            // controller: _emailController,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.alternate_email),
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          TextFormField(
            // controller: _passwordController,
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
              print("Login pressed");
            },
          ),
          FlatButton(
            child: Text("Don't have an account? Sign up here"),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            onPressed: () {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => Signup(),
              //   ),
              // );
            },
          ),
        ],
      ),
    );
  }
}
