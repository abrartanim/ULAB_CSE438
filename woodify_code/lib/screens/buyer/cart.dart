import 'package:flutter/material.dart';
import 'package:woodify/mongodb.dart';

import '../../const.dart';
import '../../reuse_widgets/widgets.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  var current;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: boxcolor,
        title: Text("My Cart"),
      ),
      drawer: Custom_AppDrawer(),

      backgroundColor: primaryBG,

      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            SizedBox(height: 20),
            Container(
              child: Text("My cart"),
            ),
            Expanded(

              child:ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  print("I am here");

                  final data = cart[index];
                  //print(data);
                  return Column(
                    children: [
                      SizedBox(height: 20),
                      Container(
                        child: Items(itemname: '${cart[index][0]}', price: '${cart[index][1]}',),
                      )
                    ],
                  );
                  //   ListTile(
                  //   title: Text("${_dataList[index]['u_id']}"),
                  //  // subtitle: Text('Age: ${data['ques']}'),
                  // );
                },
              ),

            ),
            SizedBox(height: 20),
            Container(
              child: CustomButton(text: 'Tap to order', onPressed: () {
              for(var temp in cart)
                {
                  MongoDatabase.itemorder(userDoc['_id'], temp[0], temp[1], DateTime.now(), userDoc['address']);
                }
              const snackBar = SnackBar(
                content: Text('Order Successfully Completed'),
              );

                ScaffoldMessenger.of(context).showSnackBar(snackBar);

                cart.clear();
              }, ),


            ),


          ],
        ),
      ),
    );
  }
}
