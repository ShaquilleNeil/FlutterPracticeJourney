import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formGlobalKey1 = GlobalKey<FormState>();
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  String _email = '';
  String password = '';

@override
void initState() {
  super.initState();
  _tapGestureRecognizer.onTap = () {
    Navigator.pop(context);
  };
}

// Don't forget to dispose
@override
void dispose() {
  _tapGestureRecognizer.dispose();
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios_new),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Text('Sign Up'),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formGlobalKey1,
                child: Column(
                  children: [
                     Text('Sign Up',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        SizedBox(height: 20),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                         validator: (value) {
                            if(value == null || value.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            _email = value!;
                          },
                      ),
                    ),

                     SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        obscuringCharacter: '*',
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                         validator: (value) {
                            if(value == null || value.isEmpty || value.length < 8) {
                              return 'Please enter a valid password';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            password = value!;
                          },
                      ),
                    ),

                     SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formGlobalKey1.currentState!.validate()) {
                          _formGlobalKey1.currentState!.save();
                          print('Email: $_email, Password: $password');
                          Navigator.pop(context);

                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                       child: Text('Sign Up',
                       style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),

                     SizedBox(height: 20),

                    RichText(
                      text: TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                           TextSpan(
                            text: 'Sign In',
                            style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 16, fontWeight: FontWeight.bold),
                              recognizer: _tapGestureRecognizer,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
            ),
        ),
      ),
    );
  }
}