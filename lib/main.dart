import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vet_carni_food/RegistrationScreen.dart';

import 'LoginScreen.dart';
import 'UserInfoScreen.dart';
import 'firebase_options.dart';
import 'home.dart';

void main() async {
  // Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VetCarniFood',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'VetCarniFood Accueil'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController pageController = PageController();
  LoginScreen loginScreen = const LoginScreen();
  bool userConnected = FirebaseAuth.instance.currentUser != null;

  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      setState(() {
        userConnected = (user != null);
        print('connected? $userConnected');
      });
    });

    List screens = [];

    if (userConnected) {
      User user = FirebaseAuth.instance.currentUser!;
      print('build main: $user');
      screens = [
        UserInfoScreen(user: user),
        const Home(userIsConnected: true,),
        UserInfoScreen(user: user)
      ];
    } else {
      screens = [const LoginScreen(), const Home(userIsConnected: false), const RegistrationScreen()];
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: const Text('VetCarniFood Accueil')),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'account',
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'history',
              backgroundColor: Colors.indigo)
        ],
        selectedItemColor: const Color(0xFFB0F2B6),
        unselectedItemColor: Colors.grey,
      ),
    ));
  }
}
