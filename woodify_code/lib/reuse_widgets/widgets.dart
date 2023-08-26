import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:woodify/const.dart';
import 'package:woodify/query.dart';
import 'package:woodify/screens/buyer/cart.dart';
import 'package:woodify/screens/buyer/homepage.dart';
import '../screens/buyer/editpro.dart';
import '../screens/buyer/mypro.dart';




class CustomTextField extends StatelessWidget {
  // final TextEditingController controller;
  // final Color borderColor;
  // final BorderRadius borderRadius;
  // final String placeholder;
  //
  //
  // CustomeTextField(
  //     this.controller, this.borderColor = Colors.black , this.borderRadius, this.placeholder);


  final TextEditingController controller;
  final String hint;
  final bool hide;

  CustomTextField({
    required this.controller,
    required this.hint,
    required this.hide,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 279,
      height: 53,

      child: TextField(
        controller: controller,
        obscureText: hide,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50.0)),
          hintText: hint,
        ),
      ),


    );

  }
}

class CustomAppBar extends StatelessWidget {

  final String title;

  CustomAppBar(
  {
    required this.title,
}
      );
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor:Color.fromRGBO(193, 208, 181, 1),
        title: Text(title),

      );


  }
}




class CustomAlertDialog extends StatelessWidget {
  final String message;

  CustomAlertDialog({required this.message});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Alert'),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context); // Close the dialog
          },
          child: Text('OK'),
        ),
      ],
    );
  }
}

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onSubmitted;
  final void Function()? onSearchButtonPressed;

  CustomSearchBar({
    required this.controller,
    required this.hintText,
    this.onSubmitted,
    this.onSearchButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: TextField(
      controller: controller,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(Icons.search),
        suffixIcon: IconButton(
          icon: Icon(Icons.send),
          onPressed: onSearchButtonPressed,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),

      ),);
  }
}

class Profile_image extends StatelessWidget {
  final String image_url;
  final double size;

  Profile_image({required this.image_url, this.size = 153});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(image_url),
        )
      ),
    );
  }
}


class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color color;
  final Color textColor;
  final double borderRadius;
  final double width;
  final double height;

  CustomButton({
    required this.text,
    required this.onPressed,
    this.color = Colors.blue,
    this.textColor = Colors.white,
    this.borderRadius = 8.0,
    this.width = 150.0,
    this.height = 50.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Text(text),
      ),
    );
  }
}

// -------------------------------------------------------------

const Color primaryBG = Color.fromRGBO(255, 248, 222, 1);
const Color boxcolor =  Color.fromRGBO(214, 232, 219, 1);

//----------------------------------------------------------------

class Rectangle35 extends StatelessWidget {
  @override
  final text;

  const Rectangle35({super.key, required this.text});
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Container(
              child: Text(text),
            ),
              Container(
                child: Text("DBVALUE"),
              )
            ],
          ),
          width: 121,
          height: 135,
          decoration: ShapeDecoration(
            color: boxcolor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),

            ),
          ),
        ),
      ],
    );
  }
}

class Curr_Pro_rect extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                child: Profile_image(
                  image_url: "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwww.hill-interiors.com%2Fimages%2Fgiant%2F20132.jpg&f=1&nofb=1&ipt=978e289292f1202d5f9280644d66e477bd36d55efd7c503733780ddc8ebf8833&ipo=images",
                  size: 53,
                ),

              ),

              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Text("Prodcut Name"),
                    ),

                    Container(
                      child: Text("Stock"),
                    ),

                    Container(
                      child: Text("Price"),
                    ),
                  ],

                ),
              )
            ],
          )
          ,
          width: 312,
          height: 87,
          decoration: ShapeDecoration(
            color: Color(0xFFD6E8DB),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}


class Custom_AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: boxcolor,
            ),
            child: Text(
              'Woodify',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle navigation to the home page
              Navigator.push(context,MaterialPageRoute(builder: (context) => Homepage())); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text('Query'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.push(context,MaterialPageRoute(builder: (context) => Query())); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Help Center'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.chat),
            title: Text('Chat'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Cart'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.push(context,MaterialPageRoute(builder: (context) => Cart()));; // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Profile'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.push(context,MaterialPageRoute(builder: (context) => MyProfile_b())); // Close the drawer
            },
          ),
          // Add more list tiles for other menu items
        ],
      ),
    );
  }
}

class Items extends StatelessWidget {
  final itemname;
  final price;
  final index;

  const Items({super.key, required this.itemname, required this.price, this.index});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 319,
          height: 80,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 319,
                  height: 80,
                  decoration: ShapeDecoration(
                    color: Color(0xFFC1D0B5),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                ),
              ),
              Positioned(
                left: 12,
                top: 19,
                child: Container(
                  width: 74,
                  height: 40,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.RRRa8QV1S_NTlFn2U0Y0jwHaHa%26pid%3DApi&f=1&ipt=27898192db44b958bfa7dc937ae472f4ef8cef656165bc7845f2307a4d6ecd21&ipo=images"),
                      fit: BoxFit.contain,
                    ),
                    shape: CircleBorder() //RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                ),
              ),
              Positioned(
                left: 86,
                top: 29,
                child: Container(
                  width: 113.93,
                  height: 41.44,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: SizedBox(
                          width: 113.93,
                          height: 12.79,
                          child: Text(
                            '$itemname',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontFamily: 'Roboto',
                              //fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 30,
                        child: SizedBox(
                          width: 59.24,
                          height: 11.44,
                          child: Text(
                            '$price',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 8,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 241,
                top: 38,
                child: Container(
                  width: 26,
                  height: 26,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        //top: 10,
                        bottom: 15,
                        child: Container(
                          width: 26,
                          height: 26,
                          child : IconButton(
                            icon: Icon(Icons.add, color: Colors.white),
                            onPressed: () {
                              var itemno = index;
                              var temp = [];
                              temp.add(itemname);
                              temp.add(price);
                              cart.add(temp);
                              const snackBar = SnackBar(
                                content: Text('Item Successfully Added'),
                              );


                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                              // Handle button press
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 281,
                top: 45,
                child: Container(
                  width: 13,
                  height: 13,
                  child: Stack(children: [

                      ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}



class QueryPost extends StatelessWidget {
  const QueryPost({super.key, this.username, this.query, this.time});

  final username;
  final query;
  final time;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 20),

        SizedBox(height: 20),
        Column(
          children: [
            Row(
              children: [
                Container(
                  child: Profile_image(image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi0.wp.com%2Fvssmn.org%2Fwp-content%2Fuploads%2F2018%2F12%2F146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png%3Ffit%3D860%252C681%26ssl%3D1&f=1&nofb=1&ipt=15100fcc5064c58f38fa2f03e750427f6af5bfa2ee9ddb09b021d491217fb47e&ipo=images', size: 51,),
                ),
                SizedBox(width: 10),
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(

                        child: Text("$username",
                          style: TextStyle(
                            color: Color(0xFF898989),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),),

                      ),
                      Container(
                        child: Text("$time",
                          style: TextStyle(
                            color: Color(0xFF898989),
                            fontSize: 13,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                          ),),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Text("$query",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                ),),

            ),
            Container(
              //child: Comments(),
            )
          ],
        ),



      ],
    );
  }
}


class SellerInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 102,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 360,
                  height: 102,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                ),
              ),
              Positioned(
                left: 22,
                top: 15,
                child: Container(
                  width: 73,
                  height: 73,
                  decoration: ShapeDecoration(
                    color: Color(0xFF292626),
                    shape: OvalBorder(),
                  ),
                ),
              ),
              Positioned(
                left: 102,
                top: 16,
                child: SizedBox(
                  width: 190,
                  height: 72,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Anwar Hossain\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Verified\nJoined on 12/06/23',
                          style: TextStyle(
                            color: Color(0xFF797979),
                            fontSize: 15,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





// Move Navigator.push(context,MaterialPageRoute(builder: (context) => PageNAME));



// ElevatedButton(onPressed: (){}, child: const Text('Sign up as a buyer'), style: ElevatedButton.styleFrom(
// foregroundColor: Colors.black, backgroundColor: Colors.white,
// padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8), // Border radius of the button
// ),
// ),),
