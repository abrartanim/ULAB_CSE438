import 'package:flutter/material.dart';
import 'package:woodify/const.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/buyer/editpro.dart';

import '../login.dart';

class MyProfile_b extends StatefulWidget {
  const MyProfile_b({super.key});

  @override
  State<MyProfile_b> createState() => _MyProfile_bState();
}

class _MyProfile_bState extends State<MyProfile_b> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBG,
      appBar: AppBar(
        backgroundColor: boxcolor,
        title: Text("My Profile"),
      ),
      drawer: Custom_AppDrawer(),
      body: Center(
        child: Column(
          //mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            SizedBox(height: 50),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Profile_image(
                    image_url: img,
                  ),
                ),

                SizedBox(height: 80),
                Container(
                  child: CustomButton(
                    text: "Edit Profile",
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => EditProfile_b()));
                    },
                    color: boxcolor,
                    textColor: Colors.black,
                  ),
                ),


                SizedBox(height: 30),
                Container(
                  child: CustomButton(
                    text: "Logout",
                    onPressed: () {

                      Navigator.push(context,MaterialPageRoute(builder: (context) => Login()));
                      userDoc.clear();
                    },
                    color: boxcolor,
                    textColor: Colors.black,
                  ),
                ),

              ],
            )
          ],
        ),
      ),

    );
  }
}
