import 'package:flutter/material.dart';
import 'package:woodify/const.dart';
import 'package:woodify/mongodb.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/buyer/homepage.dart';
import 'package:woodify/screens/seller/homepage.dart';
import 'package:woodify/screens/signup.dart';

class Login extends StatefulWidget {
  _Login createState() => _Login();
}


class _Login extends State<Login>{

  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(193, 208, 181, 1);
    return Scaffold(
        backgroundColor: backgroundColor,
        body:SingleChildScrollView(

          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget> [
                  Container(
                    height: 218,
                    width: 218,
                    child: Image.asset('assets/images/woodify_logo.png'),

                  ),

                  Container(
                    width: 279,
                    height: 53,

                    child: CustomTextField(
                      controller: _email,
                      hint: "Enter Email",
                      hide: false,
                    ),
                  ),
                  SizedBox(height: 50),
                  Container(
                    width: 279,
                    height: 53,

                    child: CustomTextField(
                      controller: _password,
                      hint: "Enter Password",
                      hide: true,
                    ),

                  ),

                  SizedBox(height: 10),
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

                        final allDocuments = await getAllDocuments();
                        print(allDocuments);

                      bool isLogin = await verifyLogin(_email.text, _password.text);

                      if (isLogin)
                        {
                          // print("OJ");
                          //print(userDoc);
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

                      },
                      child: Text('Submit'),
                    ),

                  ),

                  Row(
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


            ],
          ),
        ));

  }
}
