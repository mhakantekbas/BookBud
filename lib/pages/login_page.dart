import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscureText = true;
  String _password = "";
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

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
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color.fromRGBO(53, 83, 88, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
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
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
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
                        !_obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Colors.grey,
                      )),
                  icon: Icon(Icons.lock_outline),
                  border: InputBorder.none,
                  hintText: 'Password',
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              ElevatedButton.icon(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 188, 75, 81))),
                  onPressed: (() {}),
                  icon: Icon(Icons.lock_reset),
                  label: Text("Forgot Password?")),
              SizedBox(
                width: 80,
              )
            ]),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Container(
                width: 280,
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Color.fromARGB(255, 255, 205, 55)),
                child: TextButton(
                  onPressed: () => signIn(),
                  child: Text('Log in',
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: GoogleFonts.ubuntu(color: Colors.white, fontSize: 15),
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
    );
  }
}
