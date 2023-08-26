import 'package:flutter/material.dart';
import 'package:woodify/const.dart';

import '../../mongodb.dart';
import '../../reuse_widgets/widgets.dart';

class EditProfile_b extends StatefulWidget {
  @override
  _EditProfile_bState createState() => _EditProfile_bState();
}

class _EditProfile_bState extends State<EditProfile_b> {
  final _formKey = GlobalKey<FormState>();
  String firstName = '';
  String lastName = '';
  String email = '';
  String address = '';
  String password = '';

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Perform form submission logic here
      MongoDatabase.updateUserData(userDoc['_id'] , firstName, lastName, password, address);
    }
  }

  @override
  Widget build(BuildContext context) {
    backgroundColor: primaryBG;
    return Scaffold(

        backgroundColor: primaryBG,
        appBar: AppBar(
          backgroundColor: boxcolor,
          title: Text("Edit Profile"),
        ),
        drawer: Custom_AppDrawer(),

        body:SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(

                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'First Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Last Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Email'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          email = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Address'),
                      onChanged: (value) {
                        setState(() {
                          address = value;
                        });
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(labelText: 'Password'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        setState(() {
                          password = value;
                        });
                      },
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          text: "Save Changes",
                          onPressed: () {
                            _submitForm();
                            _formKey.currentState?.reset();
                            Navigator.pop(context);



                          },
                          color: boxcolor,
                          textColor: Colors.black,
                        ),

                        CustomButton(
                          text: "Go Back",
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: boxcolor,
                          textColor: Colors.black,
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            )

        ));
  }
}
