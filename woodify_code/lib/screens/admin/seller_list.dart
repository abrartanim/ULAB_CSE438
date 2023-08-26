

import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:woodify/const.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class SellerList_a extends StatefulWidget {
  const SellerList_a({super.key});

  @override
  State<SellerList_a> createState() => _SellerList_aState();



}

class _SellerList_aState extends State<SellerList_a> {

  List<Map<String, dynamic>> _dataList = [{}];


  Future<void> fetchData()  async {
    var db = await mongo.Db.create(MONGO_URL);
    await db.open();

    final collection = db.collection('users');

    final query = mongo.where.eq('catagory', 1);

    final cursor = await collection.find(query);


    final documents = await cursor.toList();

    //_dataList = documents;

    await db.close();

    setState(() {
      _dataList = documents;
    });



    //to create var final allDocuments = await getAllDocuments();
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the asynchronous function in initState

    print(_dataList);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: boxcolor,
        title: Text("Seller List"),
      ),
      //drawer: Custom_AppDrawer(),

      backgroundColor: primaryBG,
      body: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(

                leading: const Icon(Icons.list),
                trailing: const Text(
                  "Verified",
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("Name: ${_dataList[index]['fistname']} ${_dataList[index]['lastname']} \n ${_dataList[index]['email']}"));
          }),
    );
  }
}



class SellerData {
  final String fname;
  final String lname;
  final String email;

  SellerData(this.fname, this.lname, this.email);
}

Future<List<SellerData>> getAllSellersWithCategory1() async {
  final db = mongo.Db(MONGO_URL);
  await db.open();

  final collection = db.collection('users');

  final query = mongo.where.eq('category', 1);

  final cursor = await collection.find(query);

  final sellerList = await cursor.toList();

  final sellerDataList = sellerList.map((json) {
    return SellerData(json['firstname'], json['lastname'], json['email']);
  }).toList();

  await db.close();

  return sellerDataList;
}