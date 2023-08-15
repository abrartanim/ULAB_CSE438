import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class Add_Pro_s extends StatefulWidget {
  //const Add_Pro_s({super.key});

  @override
  State<Add_Pro_s> createState() => _Add_Pro_sState();
}

class _Add_Pro_sState extends State<Add_Pro_s> {
  File? image;
  TextEditingController _addpro = TextEditingController();
  TextEditingController _aboutpro = TextEditingController();
  TextEditingController _stock = TextEditingController();
  TextEditingController _price = TextEditingController();

  // Future pickImage() async
  // {
  //
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null)
  //         return;
  //
  //     final imageTemporary = File(image.path);
  //     setState(() {
  //       this.image = imageTemporary;
  //     });
  //   } on PlatformException catch (f) {
  //     print("Failed");
  //   }
  //
  //
  //
  // }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: primaryBG,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget> [
            Container(
              child: AppBar(
                backgroundColor:Color.fromRGBO(193, 208, 181, 1),
                title: Text("Inventory"),
                leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),),

              ),
            ),

            SizedBox(height: 50),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 153,
                    height: 153,

                    decoration: BoxDecoration(
                      color: boxcolor,
                      shape: BoxShape.circle,
                    ),

                    child: Icon(
                      Icons.add,
                      size: 100,
                      color: primaryBG,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CustomTextField(
                      controller: _addpro,
                      hint: "Enter Product name",
                      hide: false,

                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CustomTextField(
                      controller: _aboutpro,
                      hint: "About",
                      hide: false,

                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CustomTextField(
                      controller: _stock,
                      hint: "Stock",
                      hide: false,

                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    child: CustomTextField(
                      controller: _price,
                      hint: "Price",
                      hide: false,

                    ),
                  ),
                ],
              ),

            ),
            SizedBox(height: 20),
            Container(
              child: CustomButton(text: 'Add Image', onPressed: () {
                //pickImage();
                if(image!=null)
                  {
                      Container(
                        child: SnackBar(
                          content: Row(
                          children: [
                            Icon(Icons.add_a_photo),
                            SizedBox(width: 20),
                            Expanded(child: Text("Photo Successfully Uploaded"))
                          ],
                        ),
                          
                        ),
                      );
                  }
              }, textColor: Colors.black, color: boxcolor),
            ),
            SizedBox(height: 20),
            Container(
              child: CustomButton(text: 'Submit', onPressed: () { }, textColor: Colors.black, color: boxcolor,),
            ),
          ],
        ),
      ),
    );
  }
}
