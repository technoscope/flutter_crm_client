import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/ProfileView.dart';
import 'MyLeadsView.dart';
class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key key}) : super(key: key);
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}
class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    Firebase.initializeApp();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
                    color: Colors.blue,
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileView()));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.group_sharp,
                    size: 20,
                    color: Colors.black,
                  ),
                  title: Text(
                    "My LEADS",
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
                Text("Powered By BOT Solutions",textAlign: TextAlign.center,),
                Text("Copyright 2021",textAlign: TextAlign.center,)
              ]).toList(),
            ),
          )),
      appBar: AppBar(
        title: Text("Dashboard"),
      ),
      body: Container(
        height: height,
        alignment: Alignment.center,
        child: Text("Welcome To Dashboard"),
      ),
    ));
  }
}
