import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pokedex_exe/home_page.dart';
import 'package:pokedex_exe/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  bool _passwordVisible2 = false;
  final passcon = TextEditingController();
  final namecon = TextEditingController();
  String? name;
  String? email;
  String? pass;
  String? repass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                //backbutton
                Padding(
                  padding: EdgeInsets.only(top: 70, right: 300),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ));
                    },
                    child: const Icon(Icons.arrow_back),
                    backgroundColor: Color.fromARGB(255, 255, 219, 5),
                  ),
                ),

                //rounded image
                Container(
                  margin: EdgeInsets.only(top: 0, right: 7),
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black12, width: 1)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/pokemon_pikachu.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                //register text
                Container(
                  margin: const EdgeInsets.only(top: 40, bottom: 30),
                  child: const Text(
                    "Register",
                    style: TextStyle(
                      fontSize: 34.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 219, 5),
                    ),
                  ),
                ),

                //name form
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
                          prefixIcon: const Icon(Icons.email),
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

                //email Form
                Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Email",
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
                          hintText: 'Enter your Email',
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your Email';
                          } else if (!value.contains("@")) {
                            return 'Invalid format email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          email = value;
                        },
                      ),
                    ],
                  ),
                ),

                //PassForm
                Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children:  [
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
                        controller: passcon,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your password';
                          } else if (value.length < 6) {
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

                //RE-PassForm
                Container(
                    margin: EdgeInsets.only(top: 15, left: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Re-Password",
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
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else if (value != passcon.text) {
                            return 'password must be the same';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          repass = value;
                        },
                        obscureText: !_passwordVisible2,
                        decoration: InputDecoration(
                          hintText: 'Re-Enter your Password',
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _passwordVisible2
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible2 = !_passwordVisible2;
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
                  margin: EdgeInsets.only(top: 30),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
