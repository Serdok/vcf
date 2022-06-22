import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:vet_carni_food/models/user.dart';

import 'ProfileScreen.dart';
import 'UserInfoScreen.dart';
import 'authentication.dart';


class RegistrationScreen extends StatefulWidget{
  const RegistrationScreen ({Key? key}) : super (key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();

}
class _RegistrationScreenState extends State<RegistrationScreen>{

  @override
  Widget build(BuildContext context){
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController passwordConfirmationController = TextEditingController();
    bool isVisible = true;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            const Text(
              " Inscription",
              style: TextStyle(
                color: Colors.blue,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,

              ),
            ),
            const Text("  Veuillez renseigner mail et mot de passe s'il vous plaît"),
            const SizedBox(
              height: 44.0,
            ),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const  InputDecoration(
                hintText: "Email",
                prefixIcon: Icon(Icons.mail, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller:  passwordController,
              obscureText: true,
              decoration:  const InputDecoration(
                hintText: "Mot de passe",
                prefixIcon: Icon(Icons.password, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 26.0,
            ),
            TextField(
              controller:  passwordConfirmationController,
              obscureText: true,
              decoration:  const InputDecoration(
                hintText: "Confirmation mot de passe",
                prefixIcon: Icon(Icons.password, color: Colors.blue),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            /*Visibility(
              visible: !isVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child: const Text("Les 2 mdp saisies ne correspondent pas !",
                style: TextStyle(
                  color: Colors.red,)
                ,),
            ),*/
            const SizedBox(
              height: 60.0,
            ),
            SizedBox(
              width : double.infinity,
              child : RawMaterialButton(

                  elevation: 0.0,
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                  onPressed: () async {
                    if(passwordController.text == passwordConfirmationController.text){
                      isVisible = true;
                      /* On enregistre le nouveau user pour en suite se connecter */
                      await  Authentication.registerWithEmailAndPassword(email: emailController.text,password: passwordController.text, context: context);
                      User? user = await  Authentication.LoginUsingEmailPassword(email: emailController.text,password: passwordController.text, context: context);
                      print(user);
                      if(user!=null){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const ProfileScreen() ));
                      }
                    } else {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text('Erreur'),
                          content: const Text("Les 2 mots de passes saisies sont différents"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('Cancel'),
                            ),

                          ],
                        ),
                      );
                    }
                  },
                  fillColor:  Colors.blue,
                  child: const Text("Enregistrer", style: TextStyle(color:Colors.white, fontSize: 18.0))
                ),
              ),
            ],
         ),
      ),
    );
  }
}



