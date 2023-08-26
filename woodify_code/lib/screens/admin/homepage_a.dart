import 'package:flutter/material.dart';
import 'package:woodify/const.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/admin/itemorder.dart';
import 'package:woodify/screens/admin/seller_list.dart';
import 'package:woodify/screens/buyer/homepage.dart';
import 'package:woodify/screens/login.dart';
import 'package:woodify/screens/seller/inventory_page.dart';

class Homepage_a extends StatefulWidget {
  const Homepage_a({super.key});

  @override
  State<Homepage_a> createState() => _Homepage_aState();
}

class _Homepage_aState extends State<Homepage_a> {
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
                    text: "Seller List",
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => SellerList_a()));
                    },
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                ),

                //SizedBox(height: 30),
                // Container(
                //   child: CustomButton(
                //     text: "Query Report",
                //     onPressed: () {
                //       //Navigator.push(context,MaterialPageRoute(builder: (context) => Inventory_s()));
                //     },
                //     color: Colors.white,
                //     textColor: Colors.black,
                //   ),
                // ),

                SizedBox(height: 30),
                Container(
                  child: CustomButton(
                    text: "Items Ordered",
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => ItemOrder()));
                    },
                    color: Colors.white,
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
                      cart.clear();
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
