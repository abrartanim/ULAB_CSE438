import 'package:flutter/material.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class Current_pro_s extends StatefulWidget {
  const Current_pro_s({super.key});

  @override
  State<Current_pro_s> createState() => _Current_pro_sState();
}

class _Current_pro_sState extends State<Current_pro_s> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryBG,
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
              child: AppBar(
                backgroundColor:Color.fromRGBO(193, 208, 181, 1),
                title: Text("Current Products"),
                leading: IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back),),

              ),
            ),

            SizedBox(height: 50),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Curr_Pro_rect(

                    ),
                  )
                ],
              ),

            )
          ],
        ),
    ),
    );
  }
}
