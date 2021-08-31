import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/Attendance.dart';
import 'package:flutter_crm_client/MapScreen.dart';
import 'package:flutter_crm_client/ProfileView.dart';
import 'AssignTaskView.dart';
import 'leads/MyLeadsView.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Attendance',
      style: optionStyle,
    ),
    Text(
      'Index 2: My Tasks',
      style: optionStyle,
    ),
    Text(
      'Index 3: Maps',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex==0){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DashboardScreen(),
            ));
      }else if(_selectedIndex==1){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Attendance(),
            ));
      }else if(_selectedIndex==3){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MapScreen(),
            ));
      }else if(_selectedIndex==2){
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AssignTaskView(),
            ));
      }
    });
  }
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(child: Scaffold(
      drawer: Container(
          width: 250,
          child: Drawer(
            elevation: 5.0,
            child: ListView(
              padding: EdgeInsets.zero,
              children: ListTile.divideTiles(context: context, tiles: [
                DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/crm_logo_white.png"),
                        width: 200,
                        height: 200,
                      )
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_pin,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (
                        context) => ProfileView()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    "My Leads",
                    style: TextStyle(color: Colors.black),
                  ),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyLeadsView()));
                  },
                ),
                // ListTile(
                //   leading: Icon(
                //     Icons.fact_check_outlined,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "PROPOSALS",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.receipt,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "INVOICES",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => InvoicesList()));
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.payment_outlined,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "PAYMENTS",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.group,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "CUSTOMERS",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Customers_view()));
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.support_agent,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "SUPPORT",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                // ListTile(
                //   leading: Icon(
                //     Icons.logout,
                //     size: 20,
                //     color: Colors.black,
                //   ),
                //   title: Text(
                //     "LOGOUT",
                //     style: TextStyle(color: Colors.black),
                //   ),
                //   onTap: () {
                //     Navigator.pop(context);
                //   },
                // ),
                SizedBox(
                  height: 300,
                ),
                Text("Powered By BOT Solutions", textAlign: TextAlign.center,),
                Text("Copyright 2021", textAlign: TextAlign.center,)
              ]).toList(),
            ),
          )),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Dashboard"),
      ),
      body:
      Container(
        height: height,
        alignment: Alignment.center,
        child: Text("Welcome To Dashboard")
        ,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon( AssetImage("assets/attendance.png"),),
            label: 'Attendance',
            backgroundColor: Colors.green,
          ),
          BottomNavigationBarItem(
            icon: ImageIcon( AssetImage("assets/task.png"),),
            label: 'My Tasks',
            backgroundColor: Colors.purple,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on),
            label: 'Tracking',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    ));
  }
}
