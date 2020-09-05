import 'package:book_dub/screens/home/home.dart';
import 'package:book_dub/screens/login/login.dart';
import 'package:book_dub/screens/no_group/no_group.dart';
import 'package:book_dub/screens/splash_screen/splash.dart';
import 'package:book_dub/states/currentGroup.dart';
import 'package:book_dub/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum AuthStatus {
  unknown,
  notLoggedIn,
  notInGroup,
  inGroup,
}

class OurRoot extends StatefulWidget {
  OurRoot({Key key}) : super(key: key);

  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //get the state, check currentuser, set auth status
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _retString = await _currentUser.onStartUp();
    if (_retString == "success") {
      if (_currentUser.getCurrentUser.groupId != null) {
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget retVal;

    switch (_authStatus) {
      case AuthStatus.unknown:
        retVal = OurSplash();
        break;
      case AuthStatus.notLoggedIn:
        retVal = OurLogin();
        break;
      case AuthStatus.notInGroup:
        retVal = OurNoGroup();
        break;
      case AuthStatus.inGroup:
        retVal = ChangeNotifierProvider(
            create: (context) => CurrentGroup(), child: HomeScreen());
        break;
      default:
    }
    return retVal;
  }
}
