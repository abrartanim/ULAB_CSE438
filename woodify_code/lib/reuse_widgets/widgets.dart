import 'package:flutter/material.dart';




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

const Color primaryBG = Color.fromRGBO(255, 248, 222, 1);
const Color boxcolor =  Color.fromRGBO(214, 232, 219, 1);

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
              'App Drawer',
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Handle navigation to the home page
              Navigator.pop(context); // Close the drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.groups),
            title: Text('Query'),
            onTap: () {
              // Handle navigation to the settings page
              Navigator.pop(context); // Close the drawer
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
              Navigator.pop(context); // Close the drawer
            },
          ),
          // Add more list tiles for other menu items
        ],
      ),
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
