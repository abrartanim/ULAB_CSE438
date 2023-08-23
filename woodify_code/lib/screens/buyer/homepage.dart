import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:woodify/const.dart';
import 'package:woodify/reuse_widgets/widgets.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {int _selectedIndex = 0;
PageController _pageController = PageController();

List<Map<String, dynamic>> _dataList = [{}];


Future<void> fetchData()  async {
  var db = await mongo.Db.create(MONGO_URL);
  await db.open();

  final collection = db.collection('products');

  final cursor = collection.find(); // Fetch all documents

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
}

// final List<Widget> _pages = [
//   IndoorPage(),
//   OutdoorPage(),
// ];


final TextEditingController _search = TextEditingController();
@override
Widget build(BuildContext context) {
  if (_dataList.isEmpty) {
    return CircularProgressIndicator(); // Show a loading indicator
  }
  return Scaffold(
    appBar: AppBar(
      backgroundColor: boxcolor,
      title: Text("Homepage"),
    ),
    drawer: Custom_AppDrawer(),

    backgroundColor: Color.fromRGBO(255, 248, 222, 1),
    body: Center(
      child: Column(
        children: <Widget>[
          SizedBox(height: 40),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text("Let's find you a plant", style: TextStyle(
                  fontSize: 20,

                )
                )
            ),

          ),


          SizedBox(height: 10),
          Container(
            child: CustomSearchBar(
              controller: _search,
              hintText: "Search",
              //onSubmitted: ("SOMETHING"){},
              onSearchButtonPressed: (){},
            ),
          ),
          SizedBox(height: 10),

          Expanded(
            child: _pages[_selectedIndex](_dataList),
            // child: PageView(
            //   controller: _pageController,
            //   children: <Widget>[
            //     Center(child: Text('Page 1 Content')),
            //     Center(child: Text('Page 2 Content')),
            //     Center(child: Text("WADDAP NIGORS")),
            //   ],
            //   onPageChanged: (index) {
            //     setState(() {
            //       _selectedIndex = index;
            //     });
            //   },
            // ),
          ),
        ],

      ),

    ),
    bottomNavigationBar:  BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index)
      {
        setState(() {
          _selectedIndex = index;
        });
      },
      backgroundColor: boxcolor,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(

          icon: Icon(Icons.nature),
          label: 'Indoor',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.forest),
          label: 'Outdoor',
        ),
      ],
      selectedItemColor: Colors.blue,

    ),
  );
}
List<Widget Function(List<Map<String, dynamic>>)> _pages = [
      (List<Map<String, dynamic>> dataList) => ListView.builder(
    itemCount: dataList.length,
    itemBuilder: (context, index) {
      return Column(
        children: [
          SizedBox(height: 20),
          Container(
            child: Items(itemname: '${dataList[index]['p_name']}', price: '${dataList[index]['price']}',),
          ),
          SizedBox(height: 5),
        ],
      );
    },
  ),
      (List<Map<String, dynamic>> dataList) => ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) {
      return ListTile(title: Text('Page 2 Item $index'));
    },
  ),
];

}



