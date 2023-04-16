import 'dart:async';
 
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  clientId:
      '828079920761-fhbijpkmcpbm93enafrfhghh5jnar8ov.apps.googleusercontent.com',
  scopes: <String>[
    'email',
    
  ],
);

  
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    // update username
   
  }
  
  void setState(Null Function() param0) {
  }

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
 
           
         
          
        
 