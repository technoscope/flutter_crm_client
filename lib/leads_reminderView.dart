
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database/db_provider.dart';
import 'leads_model.dart';

class leads_reminderView extends StatefulWidget {
  LeadsModel reminder;
leads_reminderView({key, this.reminder}) : super(key: key);
  @override
  _leads_reminderViewState createState() => _leads_reminderViewState(reminder);
}

class _leads_reminderViewState extends State<leads_reminderView> {
  LeadsModel reminder;
  _leads_reminderViewState(LeadsModel reminder) {
    this.reminder = reminder;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Reminder View"),
        ),
        body: FutureBuilder<List<Reminders>>(
            future: DBProvider.db.getReminders(reminder),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Reminders Available"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                        title: Text("Staff Name: "+reminder.title.toString(),
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18.0)),
                        subtitle: Column(
                          children: <Widget>[
                            Row(
                              children: [
                                Text(snapshot.data[index].content),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                    snapshot.data[index].dateCreated.toString(),style: TextStyle(fontSize: 12,color: Colors.blue),)
                              ],
                            ),
                          ],
                        ),
                        trailing: Column(
                          children: <Widget>[
                            Text(
                              "Is Notified",
                              style: TextStyle(color: Colors.blue),
                            ),
                            Container(
                              height: 30.0,
                              width: 30.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text("NO"),
                              ),
                            )
                          ],
                        ),
                      ));
                    });
              }
            }));
  }

}

class Reminders {
  Reminders({this.assigned, this.id, this.dateCreated, this.content});

  String assigned;
  String id;
  String dateCreated;
  String content;
  static const String TABLENAME = "Reminders";

  Map<String, dynamic> toMap() {
    return {
      'assigned': assigned,
      'id': id,
      'dateCreated': dateCreated,
      'content': content
    };
  }
}
