import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'ProfileScreen.dart';
import 'authentication.dart';
import 'main.dart';


class LoginScreen extends StatefulWidget{
  const LoginScreen ({Key? key}) : super (key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen>{



  @override
  Widget build(BuildContext context){
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    return Scaffold(

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              "VCF",

              style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,

              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text("Un monde dans lequel les propriétaires de carnivores domestiques seraient éclairés sur le choix de l’alimentation pour leurs animaux. !", textAlign: TextAlign.center,),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const  InputDecoration(
                hintText: "User Email",
                prefixIcon: Icon(Icons.mail, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller:  _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "User Password",
                prefixIcon: Icon(Icons.password, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text("mot de pass oublié!",
              style: TextStyle(
                color: Colors.blue,)
              ,),
            const SizedBox(
              height: 60.0,
            ),
            SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blue,
                elevation: 0.0,
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                onPressed: () async {
                  User? user = await Authentication.LoginUsingEmailPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const MyHomePage(title:'')));
                  }

                },
                child: const Text("Login", style: TextStyle(color:Colors.white, fontSize: 18.0)),
              ),
            ),



          ],

        ),


      ),

    );
  }
}



