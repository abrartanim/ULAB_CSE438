import 'package:flutter/material.dart';
import 'package:woodify/const.dart';
import 'package:woodify/screens/buyer/homepage.dart';
import 'package:woodify/screens/seller/homepage.dart';

import '../../mongodb.dart';
import '../../reuse_widgets/widgets.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String password = '';

  void _submitForm0() {
    if (_formKey.currentState!.validate()) {
      MongoDatabase.userInsert(firstName, lastName, email, password, address,  0);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage(), // SecondScreen is the new screen
        ),
      );
    }
  }

  void _submitForm1()
  {
    if (_formKey.currentState!.validate()) {
      MongoDatabase.userInsert(firstName, lastName, email, password, address,  1);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Homepage_s(), // SecondScreen is the new screen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(193, 208, 181, 1);
    return Scaffold(

        backgroundColor:backgroundColor,


        body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(

                      height: 218,
                      width: 218,
                      child: Image.asset('assets/images/woodify_logo.png'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Address'),
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Row(

                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                      children: <Widget>[
                        SizedBox(height: 20),
                        Container(
                          child: ElevatedButton(onPressed: (){
                            _submitForm1();
                          },
                            child: const Text('Sign up as a seller'), style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black, backgroundColor: boxcolor,
                              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50), // Border radius of the button
                              ),
                            ),),
                        ),

                        //SizedBox(height: 30),
                        Container(
                          child: ElevatedButton(onPressed: (){
                            _submitForm0();

                          }, child: const Text('Sign up as a buyer'), style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black, backgroundColor: boxcolor,
                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50), // Border radius of the button
                            ),
                          ),),),


                      ],
                    )

                  ],
                ),
              ),
            )

        ));
  }
}
