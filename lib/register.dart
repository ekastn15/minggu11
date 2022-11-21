import 'package:fireauth/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fireAuth = FirebaseAuth.instance;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  register() async {
    try {
      await fireAuth.createUserWithEmailAndPassword(
          email: email.text, password: password.text);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Akun berhasil Didaftarkan')));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 80),
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            padding: EdgeInsets.all(20),
            child: Column(children: [
              Text(
                'register',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(height: 40),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan Email',
                  label: Text('Email'),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Masukkan password',
                  label: Text('Password'),
                ),
              ),
              SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.blue,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: register,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(18),
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  color: Colors.grey,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => Login()));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(18),
                      child: Text(
                        'Login disini',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
