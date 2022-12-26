import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'onBoarding.dart';

class SignInPage extends StatefulWidget {
  static const routeName = '/signin-page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  String _password = "";
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future signUp() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color.fromRGBO(53, 83, 88, 1)),
        child: Padding(
          padding: const EdgeInsets.only(left: 70.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0),
                child: Text('sign Up Here!',
                    style: GoogleFonts.bebasNeue(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 70,
                      ),
                    )),
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
                    icon: Icon(Icons.email_outlined),
                    border: InputBorder.none,
                    hintText: 'E-Mail',
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                width: 280,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: TextFormField(
                  validator: (value) =>
                      value!.length < 6 ? "Password too short" : null,
                  onSaved: (value) => _password = value.toString(),
                  obscureText: _obscureText,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          _toggle();
                        },
                        icon: Icon(
                          !_obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.grey,
                        )),
                    icon: Icon(Icons.lock_outline),
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Container(
                  width: 280,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      color: Color.fromARGB(255, 255, 205, 55)),
                  child: TextButton(
                    onPressed: () {
                      signUp()
                          .then((value) => Navigator.of(context)
                              .pushNamed(OnBoarding.routeName))
                          .onError((error, stackTrace) =>
                              print('Error ${error.toString()}'));
                    },
                    child: Text('Sign up',
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
                    "Already account?",
                    style:
                        GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
                  ),
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Text(
                      " LOG IN",
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
    );
  }
}
