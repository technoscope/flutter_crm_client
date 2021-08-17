import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Database/db_provider.dart';
import 'leads_NotesView.dart';
import 'leads_TasksView.dart';
import 'leads_model.dart';
import 'leads_reminderView.dart';
class Lead_related extends StatefulWidget {
  LeadsModel lead = new LeadsModel();
  Lead_related({key, this.lead}) : super(key: key);
  @override
  _Lead_relatedState createState() => _Lead_relatedState(lead);
}
// ignore: camel_case_types
class _Lead_relatedState extends State<Lead_related> {
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController subject_controller = TextEditingController();
  TextEditingController hourlyrate_controller = TextEditingController();
  TextEditingController startdateController = TextEditingController();
  TextEditingController duedateController = TextEditingController();
  TextEditingController priorityController = TextEditingController();
  LeadsModel lead = new LeadsModel();
  _Lead_relatedState(LeadsModel lead) {
    this.lead = lead;
  }
  double width = 0;
  double height = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Container(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              color: Colors.blue,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(10.0, 30.0, 20.0, 20.0),
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white,
                          child: Image(
                            image: AssetImage("assets/logo_blue.png"),
                            width: 55.0,
                            height: 55.0,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  lead.name.toString(),
                                  maxLines: 2,
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                  overflow: TextOverflow.ellipsis,
                                  textDirection: TextDirection.rtl,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(lead.company.toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    textDirection: TextDirection.rtl),
                              ],
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                  size: 12,
                                ),
                                Text(
                                  lead.phonenumber.toString(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Status: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.statusName.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Source: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.sourceName.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Last Contact: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.lastcontact.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Last Status Change: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.lastStatusChange.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Last Lead Status: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.lastLeadStatus.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              "Staff Name: ",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white54,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 8.0, bottom: 5.0),
                            child: Text(
                              lead.assigned.toString(),
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => leads_NotesView(
                                    notes: lead,
                                  )));
                    },
                    child: InkWell(
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.orangeAccent,
                            child: Icon(
                              Icons.place,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          title: Text(
                            "Notes",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _showNotesDialog();
                            },
                          ),
                        ),
                      ),
                      splashColor: Colors.orangeAccent,
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => leads_TasksView(
                                      tasks: lead,
                                    )));
                      },
                      child: InkWell(
                        child: Card(
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 16,
                              backgroundColor: Colors.pinkAccent,
                              child: Icon(
                                Icons.lock,
                                color: Colors.white,
                                size: 25,
                              ),
                            ),
                            title: Text(
                              "Tasks",
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () {
                                _showTaskDialog();
                              },
                            ),
                          ),
                        ),
                        splashColor: Colors.pinkAccent,
                      )),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 5.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => leads_reminderView(
                                    reminder: lead,
                                  )));
                    },
                    child: InkWell(
                      child: Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.greenAccent,
                            child: Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                          title: Text(
                            "Reminder",
                            style: TextStyle(color: Colors.black),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              _showReminderDialog();
                            },
                          ),
                        ),
                      ),
                      splashColor: Colors.greenAccent,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  _showReminderDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              content: Container(
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("New Reminder"),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Date'),
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              dateController.text =
                                  date.toString().substring(0, 10);
                            },
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Description'),
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: 320.0,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                DBProvider.db.insertReminder(Reminders(
                                    id: lead.id,
                                    dateCreated: dateController.text,
                                    content: descriptionController.text));
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg: "New Reminder is Created");
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                  )));
        });
  }

  _showNotesDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              content: Container(
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Add New Note"),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Description'),
                            maxLines: 2,
                          ),
                          TextField(
                            controller: dateController,
                            decoration: InputDecoration(
                                border: InputBorder.none, hintText: 'Date'),
                            onTap: () async {
                              var date = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2100));
                              dateController.text =
                                  date.toString().substring(0, 10);
                            },
                          ),
                          SizedBox(
                            width: 320.0,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                DBProvider.db.insertLeadNotes(NotesList(
                                    id: lead.id,
                                    dateCreated: dateController.text,
                                    content: descriptionController.text));
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg: "New Note is Created");
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                  )));
        });
  }

  _showTaskDialog() async {
    await showDialog<String>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)),
              content: Container(
                  height: 300,
                  width: 300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:SingleChildScrollView(child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Add New Task"),
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(Icons.close))
                            ],
                          ),
                          TextField(
                            controller: subject_controller,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                labelText: 'Subject',
                                hintText: "Enter Subject"),
                            autofocus: true,
                          ),

                        TextField(
                          controller: hourlyrate_controller,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Hourly Rate',
                              hintText: "Enter Hourly Rate"),
                          keyboardType: TextInputType.number,
                          autofocus: true,

                        ),
                     TextField(
                          controller: startdateController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'START DATE'),

                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          startdateController.text =
                              date.toString().substring(0, 10);
                        },
                      ),
                      TextField(
                          controller: duedateController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'END DATE'),

                        onTap: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          duedateController.text =
                              date.toString().substring(0, 10);
                        },
                      ),
                        TextField(
                          controller: priorityController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: 'Priority',
                              hintText: "Enter Priority"),
                          autofocus: true,

                        ),
                        TextField(
                          controller: descriptionController,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Description'),
                          maxLines: 2,
                        ),
                          SizedBox(
                            width: 320.0,
                            child: RaisedButton(
                              color: Colors.blue,
                              onPressed: () {
                                DBProvider.db.addLeadTask(TasksModel(
                                    id: lead.id,
                                    subject: subject_controller.text,
                                    hourlyRate: hourlyrate_controller.text ,
                                    startDate: startdateController.text,
                                    dueDate: duedateController.text,
                                    priority: priorityController.text,
                                    dateCreated: dateController.text,
                                    description: descriptionController.text));
                                Navigator.pop(context);
                                Fluttertoast.showToast(
                                    msg: "New Task is Added");
                              },
                              child: Text(
                                "Save",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ]),
                  ))));
        });
  }
// _showTaskDialog() async {
// width = MediaQuery.of(context).size.width;
// height = MediaQuery.of(context).size.height;
//   await showDialog<String>(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0)),
//             content: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text("Add New Task"),
//                             IconButton(
//                                 onPressed: () {
//                                   Navigator.of(context).pop();
//                                 },
//                                 icon: Icon(Icons.close))
//                           ],
//                         ),
//                         TextField(
//                           controller: subject_controller,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               labelText: 'Subject',
//                               hintText: "Enter Subject"),
//                           autofocus: true,
//
//                         ),
//                         TextField(
//                           controller: Hourlyrate_controller,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               labelText: 'Hourly Rate',
//                               hintText: "Enter Hourly Rate"),
//                           autofocus: true,
//
//                         ),
//                         Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: <Widget>[
//                       TextButton(
//                         child: TextField(
//                           controller: startdateController,
//                           decoration: InputDecoration(
//                               border: InputBorder.none, hintText: 'START DATE'),),
//
//                         onPressed: () async {
//                           var date = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime(2100));
//                           startdateController.text =
//                               date.toString().substring(0, 10);
//                         },
//                       ),
//
//                       TextButton(
//                         child: TextField(
//                           controller: duedateController,
//                           decoration: InputDecoration(
//                               border: InputBorder.none, hintText: 'END DATE'),),
//
//                         onPressed: () async {
//                           var date = await showDatePicker(
//                               context: context,
//                               initialDate: DateTime.now(),
//                               firstDate: DateTime(1900),
//                               lastDate: DateTime(2100));
//                           duedateController.text =
//                               date.toString().substring(0, 10);
//                         },
//                       ),
//
//                     ],
//                   ),
//                         TextField(
//                           controller: Hourlyrate_controller,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               labelText: 'Priority',
//                               hintText: "Enter Hourly Rate"),
//                           autofocus: true,
//
//                         ),
//                         TextField(
//                           controller: descriptionController,
//                           decoration: InputDecoration(
//                               border: InputBorder.none,
//                               hintText: 'Description'),
//                           maxLines: 2,
//                         ),
//                         SizedBox(
//                           width: 200.0,
//                           child: RaisedButton(
//                             onPressed: () {
//                               DBProvider.db.insertReminder(Reminders(
//                                   id: lead.id,
//                                   dateCreated: dateController.text,
//                                   content: descriptionController.text));
//                               Navigator.pop(context);
//                               Fluttertoast.showToast(
//                                   msg: "New Reminder is Created");
//                             },
//                             child: Text(
//                               "Save",
//                               style: TextStyle(color: Colors.white),
//                             ),
//                             color: const Color(0xFF1BC0C5),
//                           ),
//                         )
//                       ]),
//                 )));
//       });
// }
}
