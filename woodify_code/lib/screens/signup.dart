import 'package:flutter/material.dart';
import 'package:woodify/mongodb.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/buyer/homepage.dart';



class Signup extends StatefulWidget {
  _Signup createState() => _Signup();
}
class _Signup extends State<Signup>{

  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(193, 208, 181, 1);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  height: 218,
                  width: 218,
                  child: Image.asset('assets/images/woodify_logo.png'),

                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CustomTextField(
                      controller: _firstname,
                      hint: "First name",
                      hide : false,
                    ),
                  ),

                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CustomTextField(
                      controller: _lastname,
                      hint: "Last name",
                      hide: false,
                    ),
                  ),

                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CustomTextField(
                      controller: _email,
                      hint: "Email",
                      hide: false,
                    ),
                  ),

                ),

                Container(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CustomTextField(
                      controller: _password,
                      hint: "Enter Password",
                      hide: true,
                    ),
                  ),

                ),

                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,


                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                      child: ElevatedButton(onPressed: (){
                        MongoDatabase.userInsert(_firstname.text, _lastname.text, _email.text, _password.text, 1);
                      },
                        child: const Text('Sign up as a seller'), style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black, backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50), // Border radius of the button
                          ),
                        ),),
                    ),

                    //SizedBox(height: 30),
                    Container(
                      child: ElevatedButton(onPressed: (){

                        MongoDatabase.userInsert(_firstname.text, _lastname.text, _email.text, _password.text, 0);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Homepage(), // SecondScreen is the new screen
                          ),
                        );
                      }, child: const Text('Sign up as a buyer'), style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black, backgroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // Border radius of the button
                        ),
                      ),),),


                  ],
                )
              ],


            )



        ));
  }
}

