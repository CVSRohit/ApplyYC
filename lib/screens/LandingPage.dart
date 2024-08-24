import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LandingPage extends StatelessWidget {
  LandingPage({
    super.key,
  });

  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        // Signed in successfully
        print('User signed in: ${account.email}');
        // Navigate to the next page or perform further actions here
      } else {
        // User cancelled the sign-in process
        _showSnackbar(context, 'Sign-in cancelled');
      }
    } catch (error) {
      print('Sign-in error: $error');
      _showSnackbar(context, 'Sign-in failed: $error');
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Applying to YC?',
              style: TextStyle(
                  color: Colors.white, fontFamily: 'Righteous', fontSize: 42),
            ),
            Text(
              'Improve your answers to get that \$500k!',
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
            SizedBox(
              height: 10,
            ),
            Column(
              children: [
                Text(
                  "Let's Freaking Go!",
                  style: TextStyle(
                    color: Colors.red,
                    fontFamily: 'Righteous',
                  ),
                ),
                Icon(
                  Icons.arrow_downward,
                  size: 40,
                  color: Colors.white,
                )
              ],
            ),
            GestureDetector(
                onTap: () {
                  // Handle sign-in
                  _handleSignIn(context);
                },
                child: Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.red,
                      ),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(vertical: 13, horizontal: 33),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign-up with Google!",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Righteous',
                                fontSize: 24),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      margin: EdgeInsets.all(10),
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Sign-up with Google!",
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Righteous',
                                fontSize: 24),
                          ),
                        ],
                      ),
                    )
                    // Icon(
                    //   Icons.rocket,
                    //   color: Colors.red,
                    //   size: 40,
                    // ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
