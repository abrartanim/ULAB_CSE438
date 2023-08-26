import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:woodify/reuse_widgets/widgets.dart';
import '../../const.dart';

class ItemOrder extends StatefulWidget {
  const ItemOrder({super.key});

  @override
  State<ItemOrder> createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {


  List<Map<String, dynamic>> _dataList = [{}];


  Future<void> fetchData()  async {
    var db = await mongo.Db.create(MONGO_URL);
    await db.open();

    final collection = db.collection('order_list');

    //final query = mongo.where.eq('catagory', 1);

    final cursor = await collection.find();


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
        title: Text("Products"),
      ),
      //drawer: Custom_AppDrawer(),

      backgroundColor: primaryBG,
      body: ListView.builder(
          itemCount: _dataList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(

                leading: const Icon(Icons.list),
                trailing: Text(
                  "${_dataList[index]['timestamp']}",
                  style: TextStyle(color: Colors.green, fontSize: 12),
                ),
                title: Text("Name: ${_dataList[index]['itemname']} ${_dataList[index]['price']} \n ${_dataList[index]['address']}"));
          }),
    );
  }
}
