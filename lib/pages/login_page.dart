import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:term_project/pages/onBoarding.dart';
import 'package:term_project/pages/search_page.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatelessWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(40, 100, 0, 0),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
              ),
              color: Color.fromRGBO(53, 83, 88, 1)),
          child: Padding(
            padding: const EdgeInsets.only(left: 70.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text('Hello Again',
                      style: GoogleFonts.bebasNeue(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 70,
                        ),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text('E-mail',
                      style: GoogleFonts.ubuntu(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  width: 280,
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter E-Mail',
                    ),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: Text('Password',
                      style: GoogleFonts.ubuntu(color: Colors.white)),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 280,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: Color.fromARGB(255, 255, 205, 55)),
                    child: TextButton(
                      onPressed: () => signIn(),
                      child: Text('Log In',
                          style: GoogleFonts.ubuntu(
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text(
                      "Not a member?",
                      style:
                          GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                    ),
                    InkWell(
                      onTap: (() {
                        Navigator.of(context).pushNamed(SignInPage.routeName);
                      }),
                      child: Text(
                        " SIGN IN",
                        style: GoogleFonts.ubuntu(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
