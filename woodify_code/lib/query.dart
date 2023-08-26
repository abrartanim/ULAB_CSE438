import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:woodify/const.dart';
import 'package:woodify/mongodb.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class Query extends StatefulWidget {
  const Query({super.key});

  @override
  State<Query> createState() => _QueryState();
}

class _QueryState extends State<Query> {


  TextEditingController _query = TextEditingController();


  List<Map<String, dynamic>> _dataList = [{}];


  Future<void> fetchData() async {
    var db = await mongo.Db.create(MONGO_URL);
    await db.open();

    final collection = db.collection('query');

    final cursor = collection.find(); // Fetch all documents

    final documents = await cursor.toList();

    //_dataList = documents;

    await db.close();

    setState(() {
      _dataList = documents;
    });

    //bool temp = await TempverifyLogin("testb", "456");
  }

  @override
  void initState() {
    super.initState();
    fetchData(); // Call the asynchronous function in initState
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: boxcolor,
            title: Text("Ask a question"),
          ),
          drawer: Custom_AppDrawer(),

          backgroundColor: Color.fromRGBO(255, 248, 222, 1),
          body:Center(
              child: Column(
              children: [
                SizedBox(height: 50),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: [

                      Container(
                        child: Profile_image(
                          image_url: 'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi0.wp.com%2Fvssmn.org%2Fwp-content%2Fuploads%2F2018%2F12%2F146-1468479_my-profile-icon-blank-profile-picture-circle-hd.png%3Ffit%3D860%252C681%26ssl%3D1&f=1&nofb=1&ipt=15100fcc5064c58f38fa2f03e750427f6af5bfa2ee9ddb09b021d491217fb47e&ipo=images',
                          size: 51,),
                      ),
                      SizedBox(width: 20),
                      Container(
                        child: CustomTextField(controller: _query,
                          hint: 'Ask a question...',
                          hide: false,),
                      ),
                      Container(
                        child: IconButton(
                          icon: Icon(Icons.post_add),
                          onPressed: () {
                            //print(userDoc);
                            MongoDatabase.UploadUserQues(userDoc['_id'],_query.text,userDoc['fistname'],
                                userDoc['lastname'],
                                 DateTime.now());
                            const snackBar = SnackBar(
                              content: Text('Query Posted Successfully'),
                            );
                            _query.clear();
                            ScaffoldMessenger.of(context).showSnackBar(
                                snackBar);
                          },
                        ),
                      ),
                    ],
                  ),

                ),

                SizedBox(height: 20),
                Expanded(

                  child:ListView.builder(
                    itemCount: _dataList.length,
                    itemBuilder: (context, index) {
                      print("I am here");

                      final data = _dataList[index];
                      print(data);
                      return Column(
                        children: [
                          Container(
                            child: QueryPost(username: "${_dataList[index]['name']}",query: "${_dataList[index]['ques']}", time: "${_dataList[index]['timestamp']}"),
                          )
                        ],
                      );
                      //   ListTile(
                      //   title: Text("${_dataList[index]['u_id']}"),
                      //  // subtitle: Text('Age: ${data['ques']}'),
                      // );
                    },
                  ),

                )
              ],
            )),
          );








    }

  // List<Widget Function(List<Map<String, dynamic>>)> _pages = [
  //       (List<Map<String, dynamic>> dataList) => ListView.builder(
  //     itemCount: dataList.length,
  //     itemBuilder: (context, index) {
  //       return Column(
  //         children: [
  //           SizedBox(height: 20),
  //           Container(
  //             child: QueryPost(username: '${dataList[index]['u_id']}', query: '${dataList[index]['ques']}',  time: '${dataList[index]['timestamp']}'),
  //           ),
  //           SizedBox(height: 5),
  //         ],
  //       );
  //     },
  //   ),
  //
  // ];
  }

