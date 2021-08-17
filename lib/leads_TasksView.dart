import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Database/db_provider.dart';
import 'leads_model.dart';

class leads_TasksView extends StatefulWidget {
  LeadsModel tasks;

  leads_TasksView({key, this.tasks}) : super(key: key);

  @override
  _leads_TasksViewState createState() => _leads_TasksViewState(tasks);
}

class _leads_TasksViewState extends State<leads_TasksView> {
  LeadsModel tasks;

  _leads_TasksViewState(LeadsModel tasks) {
    this.tasks = tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Tasks"),
        ),
        body: FutureBuilder<List<TasksModel>>(
            future: DBProvider.db.getLeadTasks(tasks),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Tasks Available"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                        title: Text(snapshot.data[index].subject.toString(),
                            style:
                                TextStyle(color: Colors.blue, fontSize: 18.0)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              snapshot.data[index].dateCreated.toString(),
                              style: TextStyle(color: Colors.blue),
                            ),
                            Row(
                              children: [
                                Text("Start Date: " +
                                    snapshot.data[index].startDate.toString()),
                                SizedBox(
                                  width: 20,
                                ),
                                Text("Due Date: " +
                                    snapshot.data[index].dueDate.toString()),
                              ],
                            ),
                            Text(snapshot.data[index].description.toString(),),
                          ],
                        ),
                        trailing: Text(
                          "Priority: \n" +
                              snapshot.data[index].priority.toString(),
                          style: TextStyle(color: Colors.blue),
                        ),
                      ));
                    });
              }
            }));
  }
}

class TasksModel {
  TasksModel(
      {this.assigned,
      this.id,
      this.startDate,
      this.dueDate,
      this.subject,
        this.hourlyRate,
      this.dateCreated,
      this.description,
      this.priority});

  String assigned;
  String id;
  String startDate;
  String dueDate;
  String subject;
  String hourlyRate;
  String dateCreated;
  String description;
  String priority;
  static const String TABLENAME = "LeadTasks";

  Map<String, dynamic> toMap() {
    return {
      'assigned': assigned,
      'id': id,
      'startDate': startDate,
      'dueDate': dueDate,
      'subject': subject,
      'hourlyRate': hourlyRate,
      'dateCreated': dateCreated,
      'description': description,
      'priority': priority
    };
  }
}
