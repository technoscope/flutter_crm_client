import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Create_Lead.dart';
import 'Database/db_provider.dart';
import 'LeadsDashboardScreen.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:http/http.dart'as http;
import 'leads_model.dart';
class MyLeadsView extends StatefulWidget {
  MyLeadsView({Key key}) : super(key: key);
  @override
  _MyLeadsViewState createState() => _MyLeadsViewState();
}
class URLS {
  static const String BASE_URL = 'https://crm.botsolutions.tech';
}

class _MyLeadsViewState extends State<MyLeadsView> {
  var isLoading = false;
  final databaseReference = FirebaseDatabase.instance;
  String uuid;
  String id;
  bool flag=false;
  var ref;

  @override
  void initState() {
    _initfirebase();
  }

  _initfirebase() {
    flag = true;
    uuid = FirebaseAuth.instance.currentUser.uid.toString();
    ref = databaseReference.reference().child('Staff');
    _getID();
  }
  _getID() async {
    await ref.child(uuid).once().then((DataSnapshot snapshot) {
    id=snapshot.value["AssignedLead"];
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
            title:Text("LeadsView")),
        body:isLoading
            ? Center(
          child: CircularProgressIndicator(),
        ):_buildLeadsListView(),
        //floating buttons section
        floatingActionButton:Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          FloatingActionButton(
            elevation: 4.0,
            backgroundColor: Colors.blue,
            child: Icon(Icons.sync),
            onPressed: () async {
              await _loadFromApi();
            },
          ),
          SizedBox(
            height: 10,
          ),
          FloatingActionButton(
            elevation: 4.0,
            backgroundColor: Colors.blue,
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => create_Lead()),
              );
            },
            heroTag: null,
          )
        ]));
  }
    Future<List<LeadsModel>> getLeads(String id) async {
      setState(() {
        isLoading = true;
      });
      http.Response response =
      await http.get(Uri.parse('${URLS.BASE_URL}/api/leads/$id'), headers: {
        'authtoken':
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiRmx1dHRlckNSTSIsIm5hbWUiOiJBaG1hZCBSZWhtYW4iLCJwYXNzd29yZCI6bnVsbCwiQVBJX1RJTUUiOjE2Mjg1OTQwOTh9.-NHttd3B7ejKI1SrqkZpAGonz6clpF9EBnmcU22_2HE',
      });
      var leadsdata = List<LeadsModel>();
      if (response.statusCode == 200){
        var LeadsJson = json.decode(response.body);
        print(LeadsJson);
        DBProvider.db.addnewLead(LeadsModel.fromJson(LeadsJson));
        for(var leadsjson in LeadsJson){
        //  DBProvider.db.addnewLead(LeadsModel.fromJson(leadsjson));
          leadsdata.add(LeadsModel.fromJson(leadsjson));
        }
        return leadsdata;
      }
      await Future.delayed(const Duration(seconds: 1));

      setState(() {
        isLoading = false;
      });
    }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    await getLeads(id);
    setState(() {
      isLoading = false;
    });
    _buildLeadsListView();
  }


  _buildLeadsListView() {
    return FutureBuilder(
        future: DBProvider.db.getAllLeads(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LeadsDashboardScreen(
                                lead: snapshot.data[index]),
                          ),
                        );
                      },
                      leading: CircleAvatar(
                        radius: 22.5,
                        backgroundColor: Colors.blue,
                        child: new CircleAvatar(
                          radius: 21,
                          backgroundColor: Colors.white,
                          child: Text(
                            "${snapshot.data[index].id}",
                            style:
                            TextStyle(fontSize: 15.0, color: Colors.pink),
                          ),
                        ),
                      ),
                      title: Text("${snapshot.data[index].name}"),
                      subtitle: Text('${snapshot.data[index].company}'),
                      trailing: IconButton(
                          icon: Icon(Icons.phone),
                          color: Colors.blue,
                          onPressed: () {
                            //  _launchPhoneURL();
                            UrlLauncher.launch(
                                "tel:  ${snapshot.data[index].phonenumber}");
                          })));
            },
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
          );
        });
  }
}
