import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:term_project/pages/ProfilePage.dart';
import 'package:term_project/pages/SignIn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:term_project/widgets/firebase_services.dart';
import 'package:email_validator/email_validator.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/logIn-page';
  const LoginPage({
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
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim());
    } catch (e) {
      print(e);
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.toString()),
            );
          });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: this.context,
          builder: (context) {
            return const AlertDialog(
              content: Text(
                  "Password reset link sent! Check your spam email folder please!"),
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: this.context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: Color.fromRGBO(53, 83, 88, 1)),
          padding: const EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                    height: 100,
                    width: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30.0),
                    child: Text('BOOKBUD',
                        style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontSize: 70,
                          ),
                        )),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: TextFormField(
                    validator: (value) => EmailValidator.validate(value!)
                        ? null
                        : "Please enter a valid email",
                    controller: _emailController,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                      hintText: 'E-Mail',
                    ),
                  ),
                ),
              ),
              Container(
                height: 20,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
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
                          icon: const Icon(Icons.lock_outline),
                          border: InputBorder.none,
                          hintText: 'Password',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          height: 700,
                          color: const Color.fromARGB(255, 188, 75, 81),
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    'Enter the e-mail address where the password reset link will be sent:',
                                    style: GoogleFonts.ubuntu(
                                      textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white),
                                        child: TextField(
                                          controller: _emailController,
                                          decoration: const InputDecoration(
                                            icon: Icon(Icons.email_outlined),
                                            border: InputBorder.none,
                                            hintText: 'E-Mail',
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: ElevatedButton.icon(
                                          onPressed: () {
                                            passwordReset();
                                          },
                                          icon: const Icon(Icons.send_rounded),
                                          label: const Text("Send")),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Text("Forgot Password?",
                      style: GoogleFonts.ubuntu(
                        textStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      )),
                )
              ]),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: const Color.fromARGB(255, 255, 205, 55)),
                        child: TextButton(
                          onPressed: () => signIn(),
                          child: Text('Log in',
                              style: GoogleFonts.ubuntu(
                                textStyle: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: Colors.white),
                        child: TextButton(
                          onPressed: () async {
                            await FirebaseServices().signInWithGoogle();
                          },
                          child: Row(
                            children: [
                              Image.asset(
                                "assets/images/google_logo.png",
                                height: 30,
                                width: 30,
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('Sign in',
                                  style: GoogleFonts.ubuntu(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 188, 75, 81),
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
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
                      " SIGN UP",
                      style: GoogleFonts.ubuntu(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
