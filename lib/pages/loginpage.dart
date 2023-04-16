import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

import '../util/authentication_service.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '828079920761-fhbijpkmcpbm93enafrfhghh5jnar8ov.apps.googleusercontent.com',
  scopes: <String>[
    'email',
  ],
);

class Login_page extends StatefulWidget {
  const Login_page({
    super.key,
  });

  @override
  State createState() => Login_pageState();
}

class Login_pageState extends State<Login_page> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  Future<void> _handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    final GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      print(user);
      return ListTile(
          leading: GoogleUserCircleAvatar(
            identity: user,
          ),
          title: Text(user.displayName ?? ''),
          subtitle: Text(user.email),
          trailing: ElevatedButton(
            onPressed: _handleSignOut,
            child: const Text('SIGN OUT'),
          ));

      Text(user.email);
    } else {
      return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text('You are not currently signed in.'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _handleSignIn,
          child: const Text('SIGN IN'),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<AuthenticationService>().signOut();
          },
          child: const Text('Sign out'),
        ),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints.expand(),
      child: _buildBody(),
    );
  }
}
