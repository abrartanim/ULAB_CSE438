import 'package:flutter/material.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
import 'package:woodify/screens/seller/inventory_page.dart';

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
                    image_url: "https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2F2.bp.blogspot.com%2F-0rLFh_JbOzQ%2FVVTtjHV98DI%2FAAAAAAAAB6M%2FcOJ84R_cUpk%2Fs1600%2Fwhatsappimages%252Bfunny%252Bdp%252B(9).jpg&f=1&nofb=1&ipt=777c67f8d14cdccb1f891acf7d06e4b97f795c763c917880efb7238846ddc909&ipo=images",
                  ),
                ),

                SizedBox(height: 80),
                Container(
                  child: CustomButton(
                    text: "Edit Profile",
                    onPressed: () {
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => ));
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
                    onPressed: () {},
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
