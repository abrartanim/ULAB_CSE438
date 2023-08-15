import 'package:flutter/material.dart';
import 'package:woodify/reuse_widgets/widgets.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {int _selectedIndex = 0;
PageController _pageController = PageController();

void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    _pageController.animateToPage(index, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
  });
}

  final List<Widget> _pages = [
    IndoorPage(),
    OutdoorPage(),
  ];

  final TextEditingController _search = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  Center(child: Text('Page 1 Content')),
                  Center(child: Text('Page 2 Content')),
                ],
                onPageChanged: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ],

        ),

      ),
      bottomNavigationBar:  BottomNavigationBar(
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
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class IndoorPage extends StatelessWidget {
  const IndoorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("List of Indoor Plants"),
    );
  }
}

class OutdoorPage extends StatelessWidget {
  const OutdoorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlue,
      child: Text("List of Outdoor Plants"),
    );
  }
}


