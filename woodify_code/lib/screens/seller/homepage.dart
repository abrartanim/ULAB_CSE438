import 'package:flutter/material.dart';
import 'package:woodify/query.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/buyer/editpro.dart';
import 'package:woodify/screens/seller/inventory_page.dart';

import '../../const.dart';

class Homepage_s extends StatefulWidget {
  const Homepage_s({super.key});

  @override
  State<Homepage_s> createState() => _Homepage_sState();
}

class _Homepage_sState extends State<Homepage_s> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = Color.fromRGBO(255, 248, 222, 1);
    return Scaffold(
      backgroundColor: backgroundColor,

      body: Center(
        child: Column(
          //mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: CustomAppBar(
                title: "Home",

              ),
            ),
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
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ),

                SizedBox(height: 30),
                Container(
                  child: CustomButton(
                    text: "Inventory",
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Inventory_s()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ),

                SizedBox(height: 30),
                Container(
                  child: CustomButton(
                    text: "Query Section",

                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Query()));
                    },
                    color: Colors.white,
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
