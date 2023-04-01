import 'package:flutter/material.dart';
import 'package:pokedex_exe/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroPage(),
    );
  }
}

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 30, bottom: 30),
              child: const Text(
                "Pokedex.",
                style: TextStyle(
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 255, 219, 5),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20, bottom: 20),
              child: const Text(
                "Welcome to Pokedex. \n You can find your favorite pokemon here",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 159, 158, 159),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 130, bottom: 150),
              child: Image.asset(
                'assets/images/pokeball.png',
                height: 150,
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const LoginPage(),)
                );
              },
              backgroundColor: Color.fromARGB(255, 255, 219, 5),
              child: const Icon(Icons.arrow_forward),
            )
          ],
        ),
      ),
    );
  }
}
