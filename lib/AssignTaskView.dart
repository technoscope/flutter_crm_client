import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crm_client/TaskDetails.dart';
import 'package:flutter_crm_client/leads/leads_TasksView.dart';
import 'AssignTaskModel.dart';
import 'StaffModel.dart';
class AssignTaskView extends StatefulWidget {
   AssignTaskView({Key, key}) : super(key: key);
  @override
  _AssignTaskViewState createState() => _AssignTaskViewState();
}
class _AssignTaskViewState extends State<AssignTaskView> {
  var ref;
  final databaseReference = FirebaseDatabase.instance;

  List<String> keys=new List();
  Future<List<AssignTaskModel>> lists;
  bool flag=false;
  StaffModel model=new StaffModel();
  String uuid=" ";
  @override
  void initState() {
    ref = databaseReference.reference().child('Staff');
    uuid=FirebaseAuth.instance.currentUser.uid;
    lists=gettasks(uuid);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Assign Task View"
        ),
        backgroundColor: Colors.black,
      ),
      body:flag?_buildAssignListView():Center(
        child: CircularProgressIndicator()),
    );
  }
  _buildAssignListView() {
    return FutureBuilder(
        future: lists,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                  child: ListTile(
                    title:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${snapshot.data[index].taskName}",
                          style: TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.bold,color: Colors.black)),
                        SizedBox(height: 5,),
                        Text("${snapshot.data[index].taskDescription}",
                          style:TextStyle(fontStyle: FontStyle.normal,fontWeight: FontWeight.w400,color: Colors.black45))
                      ],
                    ),
                    trailing: Column(
                      children: [
                        Text("${snapshot.data[index].taskDate}"),
                        SizedBox(height: 10),
                        Text("${snapshot.data[index].taskStatus}"),
                      ],
                    ),
                    onTap: ()=>{
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>TaskDetails(taskModel: snapshot.data[index],)))
                    },
                  )
              );
            },
            itemCount: snapshot.data == null ? 0 : snapshot.data.length,
            addAutomaticKeepAlives: false,
          );
        });
  }
  Future<List<AssignTaskModel>> gettasks(String uuid) async {
    await ref
        .child(uuid)
        .child('Task').once()
        .then((DataSnapshot snapshot) {
          print(snapshot.value);
          snapshot.value.forEach((key,values)=>keys.add(key));
    });
    await Future.delayed(const Duration(seconds: 1));
    return gettask(uuid);
  }
  Future<List<AssignTaskModel>> gettask(String uid) async {
    List<AssignTaskModel> list = new List();
    for(int i=0;i<keys.length;i++) {
      await ref
          .child(uid).
      child('Task').child(keys[i])
          .once()
          .then((DataSnapshot snapshot) {
        list.add(AssignTaskModel.fromSnapshot(snapshot));
      }
      );
    }
    setState(() {
        flag = true;
      });
    return list;
  }
}