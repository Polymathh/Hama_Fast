import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hama Fast',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Create your account.\n\nYour Quest to Home \nOwnership Starts Here',
                    style: TextStyle(fontWeight: FontWeight.bold, color:Colors.purple, fontSize: 18.0),
                  ),
                ),
              ),


              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child:SizedBox(
                    width: 300, // Set the desired width
                    height: 50, // Set the desired height
                    child: TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ) 
              ),



              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child:SizedBox(
                    width:300, // Set the desired width
                    height: 50, // Set the desired height
                    child: TextFormField(
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                    ),
                  ),
                ) 
              ),

              SizedBox(height:20),

              ElevatedButton(
                onPressed: () async{
                  if(_formKey.currentState!.validate()){
                    try{
                       await _auth.createUserWithEmailAndPassword(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                      Navigator.pushReplacementNamed(context, '/dashboard');
                    }on FirebaseAuthException catch(e) {
                      String errorMessage;
                      if(e.code == 'weak-password') {
                        errorMessage = 'The password provided is too weak';
                      }else if(e.code == 'email-already-in-use') {
                        errorMessage = 'Email is already in use';
                      }else {
                        errorMessage = 'Error!! please try again later';
                      }
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text('Login'),
            ),
            

              SizedBox (height:10),

              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal
                ),
                child: Text('Don\'t have an account? Register Here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
