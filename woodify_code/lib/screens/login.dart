import 'package:flutter/material.dart';
import 'package:woodify/const.dart';
import 'package:woodify/screens/admin/homepage_a.dart';
import 'package:woodify/screens/seller/homepage.dart';
import 'package:woodify/screens/signup.dart';

import '../../mongodb.dart';
import '../../reuse_widgets/widgets.dart';
import 'buyer/homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {

      if (email == "admin" && password == "admin")
        {
          Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage_a()));
        }
else
  {
    final allDocuments = await getAllDocuments();
    print(allDocuments);

    bool isLogin = await verifyLogin(email, password);

    if (isLogin)
    {

      if(userDoc['catagory'] == 1)
        Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage_s()));
      else
        Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage()));



    }

    else
    {

      print("NOT OK");
      CustomAlertDialog(
        message: "Incorrect Information !!!",
      );
    }
  }

    }
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(193, 208, 181, 1);
    return Scaffold(

        backgroundColor: backgroundColor,

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
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email';
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
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
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
                    Container(
                      child: TextButton(
                        style: ButtonStyle(
                          overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                  (Set<MaterialState> states) {
                                if (states.contains(MaterialState.focused))
                                  return Colors.red;
                                return null; // Defer to the widget's default.
                              }
                          ),
                        ),
                        onPressed: () async {

                            _submitForm();

                        },
                        child: Text('Submit'),
                      ),

                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Text("Don't have an account?"),
                        ),

                        Container(
                          child: TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateProperty.resolveWith<Color?>(
                                      (Set<MaterialState> states) {
                                    if (states.contains(MaterialState.focused))
                                      return Colors.red;
                                    return null; // Defer to the widget's default.
                                  }
                              ),
                            ),
                            onPressed: () {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(), // SecondScreen is the new screen
                              ),
                            ); },
                            child: Text('Create Account'),
                          ),

                        )
                      ],
                    )

                  ],
                ),
              ),
            )

        ));
  }
}
