import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:woodify/const.dart';
import 'package:woodify/mongodb.dart';
//import 'package:image_picker/image_picker.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class Add_Pro_s extends StatefulWidget {
  //const Add_Pro_s({super.key});

  @override
  State<Add_Pro_s> createState() => _Add_Pro_sState();
}

class _Add_Pro_sState extends State<Add_Pro_s> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? selectedImage = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _imageFile = selectedImage;
    });
  }
  TextEditingController _addpro = TextEditingController();
  TextEditingController _aboutpro = TextEditingController();
  TextEditingController _stock = TextEditingController();
  TextEditingController _price = TextEditingController();




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
                  _imageFile == null
                      ? Text('No image selected')
                      : ClipOval(
                       child: Image.file(
                        File(_imageFile!.path),
                        width: 153,
                        height: 153,
                        fit: BoxFit.cover,
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
                _pickImage();
              }, textColor: Colors.black, color: boxcolor),
            ),
            SizedBox(height: 20),
            Container(
              child: CustomButton(text: 'Submit', onPressed: () {
                MongoDatabase.productInsert(_addpro.text, _aboutpro.text, _stock.text, _price.text, 0);
                final snackBar = SnackBar(content: Text("Product Successfully Added"),
                  action: SnackBarAction(
                    label: 'Go Back',
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, textColor: Colors.black, color: boxcolor,),
            ),
          ],
        ),
      ),
    );
  }
}
