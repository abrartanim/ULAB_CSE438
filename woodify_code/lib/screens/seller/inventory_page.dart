import 'package:flutter/material.dart';
import 'package:woodify/reuse_widgets/widgets.dart';
//import 'package:project1/screens/seller/add_pro.dart';
import 'package:woodify/screens/seller/current_product.dart';

import 'add_pro.dart';

class Inventory_s extends StatefulWidget {
  const Inventory_s({super.key});

  @override
  State<Inventory_s> createState() => _Inventory_sState();
}

class _Inventory_sState extends State<Inventory_s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBG,
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: AppBar(
                backgroundColor:Color.fromRGBO(193, 208, 181, 1),
                title: Text("Inventory"),
                leading: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back),),

              ),
            ),

            SizedBox(height: 40),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Rectangle35(text: "Total Products",),

                  ),

                  Container(
                    child: Rectangle35(text:"Sold"),
                  ),
                ],
              ),
            ),

            SizedBox(height: 70),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("Current Products"),
                  ),
                  Container(
                    child: IconButton(onPressed: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Current_pro_s()));
                    }, icon: Icon(Icons.arrow_forward),),
                  )
                ],
              ),
              width: 292,
              height: 74,
              decoration: ShapeDecoration(
                color: boxcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),


            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Text("Total Income"),
                  ),
                  Container(
                    child: Text("DBVALUE"),
                  )
                ],
              ),
              width: 292,
              height: 74,
              decoration: ShapeDecoration(
                color: boxcolor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),


            SizedBox(height: 70),
            Container(
              child: CustomButton
                (
                color: boxcolor,
                textColor: Colors.black,
                text: "Add new product",
                onPressed: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => Add_Pro_s()));
                },

              ),
            )
          ],
        ),
      ),

    );
  }
}
