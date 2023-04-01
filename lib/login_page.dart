import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex_exe/home_page.dart';
import 'package:pokedex_exe/main.dart';
import 'package:pokedex_exe/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  String? name;
  String? pass;
  bool _passwordVisible = false;
  final passcon = TextEditingController();
  final namecon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(children: <Widget>[

                  //Assets
                  Container(
                    margin: const EdgeInsets.only(
                        top: 70, bottom: 10, left: 25, right: 25),
                    child: Image.asset(
                      'assets/images/pokemon.png',
                      height: 150,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 10, bottom: 5, left: 5, right: 5),
                    child: const Text(
                      "Let's get started.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 219, 5),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                        top: 15, bottom: 40, left: 10, right: 10),
                    child: const Text(
                      "There's No Sense In Going Out Of\nYour Way To Get Somebody To Like You",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 159, 158, 159),
                      ),
                    ),
                  ),

                  //Name Form
                  Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Name",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 33, 150, 243)),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 0, right: 20, left: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            prefixIcon: const Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your Name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            name = value;
                          },
                        ),
                      ],
                    ),
                  ),

                  //PassForm
                  Container(
                      margin: EdgeInsets.only(top: 15, left: 20),
                      child: Row(
                        children: [
                          const Text(
                            "Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 33, 150, 243)),
                          ),
                        ],
                      )),
                  Container(
                    margin: EdgeInsets.only(top: 0, right: 20, left: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            else if(value.length<6){
                              return 'Password must be at least 6 characters';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            pass = value;
                          },
                          obscureText: !_passwordVisible,
                          decoration: InputDecoration(
                            hintText: 'Enter your Password',
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  //Signin Button
                  Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Column(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 255, 219, 5),
                              onPrimary: Colors.white,
                              fixedSize: Size(350, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35))),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(
                                      name: name,
                                    ),
                                  ));
                            }
                            setState(() {});
                          },
                        )
                      ],
                    ),
                  ),

                  //SignUp Tap
                  Container(
                    margin: EdgeInsets.only(top: 15, left: 85),
                    child: Row(
                      children: [
                        Text.rich(TextSpan(
                            text: "Don't have an account? ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 186, 185, 187)),
                            children: [
                              TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 246, 201, 27),
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => RegisterPage(),)
                                    );
                                }
                              )
                            ]))
                      ],
                    ),
                  )
                ]),
              ),
            )));
  }
}
