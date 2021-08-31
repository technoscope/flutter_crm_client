import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Database/db_provider.dart';
import 'leads_model.dart';

class leads_NotesView extends StatefulWidget {
  LeadsModel notes;
  leads_NotesView({key, this.notes}) : super(key: key);
  @override
  _leads_NotesViewState createState() => _leads_NotesViewState(notes);
}

class _leads_NotesViewState extends State<leads_NotesView> {
  LeadsModel notes;
  _leads_NotesViewState(LeadsModel notes) {
    this.notes = notes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Notes"),
        ),
        body: FutureBuilder<List<NotesList>>(
            future: DBProvider.db.getLeadNotes(notes),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text("No Notes Available"),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                          child: ListTile(
                            title: Text("Staff Name: "+notes.title.toString(),
                                style:
                                TextStyle(color: Colors.blue, fontSize: 18.0)),
                            subtitle: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(snapshot.data[index].content,maxLines: 3,),
                                  ],
                                ),
                              ],
                            ),
                            trailing:Text(
                              snapshot.data[index].dateCreated.toString(),style: TextStyle(fontSize: 12,color: Colors.blue),)
                            ,
                          ));
                    });
              }
            }));
  }

}

class NotesList {
  NotesList({this.assigned, this.id, this.dateCreated, this.content});

  String assigned;
  String id;
  String dateCreated;
  String content;
  static const String TABLENAME = "LeadsNotes";

  Map<String, dynamic> toMap() {
    return {
      'assigned': assigned,
      'id': id,
      'dateCreated': dateCreated,
      'content': content
    };
  }
}
