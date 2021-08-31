import 'dart:math';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Database/db_provider.dart';
import 'MyLeadsView.dart';
import '../StaffModel.dart';
import 'leads_model.dart';
class Update_lead extends StatefulWidget {
  LeadsModel lead = new LeadsModel();
  Update_lead({key, this.lead}) : super(key: key);
  @override
  _Update_leadState createState() => _Update_leadState(lead);
}
//ignore: camel_case_types
class _Update_leadState extends State<Update_lead> {
  final _formKey = GlobalKey<FormState>();
  double width = 0;
  double height = 0;
  String _myActivity;
  String _selectedStaff;
  String _status;
  bool _isPublic = false;
  String _language;
  String source;
  LeadsModel lead = new LeadsModel();
  _Update_leadState(LeadsModel lead) {
    this.lead = lead;
  }
  TextEditingController name_controller = TextEditingController();
  TextEditingController title_controller = TextEditingController();
  TextEditingController company_controller = TextEditingController();
  TextEditingController email_controller = TextEditingController();
  TextEditingController phonenumber_controller = TextEditingController();
  TextEditingController address_controller = TextEditingController();
  TextEditingController city_controller = TextEditingController();
  TextEditingController state_controller = TextEditingController();
  TextEditingController tags_controller = TextEditingController();
  TextEditingController language_controller = TextEditingController();
  TextEditingController description_controller = TextEditingController();
  TextEditingController zipcode_controller = TextEditingController();
  TextEditingController assigned_controller = TextEditingController();
  TextEditingController status_controller = TextEditingController();
  TextEditingController source_controller = TextEditingController();
  TextEditingController customContactDate_controller = TextEditingController();
  TextEditingController datetoday_controller = TextEditingController();
  TextEditingController website_controller = TextEditingController();
  TextEditingController isPublic_controller = TextEditingController();
  DBProvider _databaseHelper;
  int count;
  List<DropdownMenuItem<String>> list;
  List<StaffModel> stafflist;
  int staffidindex;
  String staffid;
  @override
  void initState() {
    stafflist=new List();
    _myActivity = "";
    _selectedStaff = assigned_controller.text;
    _language = "";
    _status = "";
    source = "";
    name_controller.text = lead.name.toString();
    title_controller.text = lead.title.toString();
    company_controller.text = lead.company.toString();
    email_controller.text = lead.email.toString();
    phonenumber_controller.text = lead.phonenumber.toString();
    address_controller.text = lead.address.toString();
    city_controller.text = lead.city.toString();
    state_controller.text = lead.state.toString();
    // language_controller.text = lead.defaultLanguage.toString();
    description_controller.text = lead.description.toString();
    zipcode_controller.text = lead.zip.toString();
    // assigned_controller.text = lead.assigned.toString();
    // status_controller.text = lead.status.toString();
    source_controller.text = lead.source.toString();
    website_controller.text = lead.website.toString();
    isPublic_controller.text=lead.isPublic.toString();
    setState(() {
      _myActivity = tags_controller.text;
      _selectedStaff = assigned_controller.text;
      _status = status_controller.text;
      _language = language_controller.text;
      source = source_controller.text;
      _databaseHelper = DBProvider.db;
      list = [];
      DBProvider.getStaffData().then((listmap) {
        listmap.map((map) {
          return getDropdownWidget(map);
        }).forEach((dropdownitem) {
          list.add(dropdownitem);
        });
      });
    });
    getstaff();
    super.initState();
  }
  DropdownMenuItem<String> getDropdownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['full_name'],
      child: Text(map["full_name"]),
    );
  }

  getstaff() async {
    stafflist=await DBProvider.db.getAllStaffs();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Lead"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onSubmit(lead.id);
        },
        child: Icon(Icons.sync),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _form(),
          ],
        ),
      ),
    );
  }

  _form() => Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: name_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.person), labelText: 'Name'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ), //name
            TextFormField(
              controller: title_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.title), labelText: 'Title'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ), //title
            TextFormField(
              controller: company_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.business), labelText: 'Company Name'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ), //company
            TextFormField(
              controller: email_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
            ), //email
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 16,
              controller: phonenumber_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.phone), labelText: 'Phone Number'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ), //phone
            TextFormField(
              controller: address_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.home), labelText: 'Address'),
            ), //address
            TextFormField(
              controller: website_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.web), labelText: 'Website'),
            ), //website
            TextFormField(
              controller: city_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.apartment), labelText: 'City'),
            ), //city
            TextFormField(
              controller: state_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.place), labelText: 'State Name'),
            ), //state
            TextFormField(
              controller: zipcode_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.my_location), labelText: 'Zip Code'),
            ),
            TextFormField(
              controller: source_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.add_chart), labelText: 'Source'),
            ),
            DropDownFormField(
              titleText: 'Status',
              hintText: 'Status',
              value: _status,
              onSaved: (value) {
                setState(() {
                  _status = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _status = value;
                });
              },
              dataSource: [
                {
                  "display": "Fresh Lead",
                  "value": "Fresh Lead",
                },
                {
                  "display": "Client",
                  "value": "Client",
                },
                {
                  "display": "Contacted",
                  "value": "Contacted",
                },
                {
                  "display": "Shown Demo",
                  "value": "Shown Demo",
                },
                {
                  "display": "Proposal Sent",
                  "value": "Proposal Sent",
                },
                {
                  "display": "Lead Lost",
                  "value": "Lead Lost",
                },{
                  "display": "Calling",
                  "value": "Calling",
                },{
                  "display": "Meeting Done",
                  "value": "Meeting Done",
                },{
                  "display": "Follow Up",
                  "value": "Follow Up",
                },{
                  "display": "Junk",
                  "value": "Junk",
                },{
                  "display": "HOT",
                  "value": "HOT",
                },{
                  "display": "WARM",
                  "value": "WARM",
                },{
                  "display": "COLD",
                  "value": "COLD",
                },{
                  "display": "MLM Conference",
                  "value": "MLM Conference",
                },{
                  "display": "Not Answering",
                  "value": "Not Answering",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),

            DropDownFormField(
              titleText: 'Select Tag',
              hintText: 'Select Item',
              value: _myActivity,
              onSaved: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _myActivity = value;
                });
              },
              dataSource: [
                {
                  "display": "Android",
                  "value": "Android",
                },
                {
                  "display": "Flutter",
                  "value": "Flutter",
                },
                {
                  "display": "iOS",
                  "value": "iOS",
                },
                {
                  "display": "SQL",
                  "value": "SQL",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            DropDownFormField(
              titleText: 'Select Language',
              hintText: 'Select language',
              value: _language,
              onSaved: (value) {
                setState(() {
                  _language = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _language = value;
                });
              },
              dataSource: [
                {
                  "display": "English",
                  "value": "English",
                },
                {
                  "display": "Urdu",
                  "value": "Urdu",
                },
                {
                  "display": "Arabic",
                  "value": "Arabic",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            // language
            DropdownButtonFormField(
              items: list.toList(),
              hint: Text("Assign To Staff"),

              onChanged: (value) {
                setState(() {
                  for(int i=0; i < stafflist.length; i++){
                    if(stafflist[i].fullName==value){
                      staffidindex=i;
                    }
                  }
                  staffid=stafflist[staffidindex].googleAuthSecret;
                  print(staffid);
                  _selectedStaff = value;
                });
              },
              onSaved: (value){

                _selectedStaff = value;
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(2, 10, 20, 10),
                  child: Icon(Icons.filter_list),
                ),
                Text("Is Public"),
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 10, 05, 5),
                  child: Container(
                    height: 20,
                    width: 50,
                    child: FlutterSwitch(
                      value: _isPublic,
                      onToggle: (val) {
                        setState(() {
                          _isPublic = val;
                        });
                      },
                    ),
                  ),
                )
              ],
            ), //isPublic
            TextField(
              readOnly: true,
              controller: customContactDate_controller,
              decoration: InputDecoration(hintText: 'Select Contact Date'),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                customContactDate_controller.text =
                    date.toString().substring(0, 10);
              },
            ), //contact date
            TextField(
              readOnly: true,
              controller: datetoday_controller,
              decoration: InputDecoration(hintText: 'Select Contact Date'),
              onTap: () async {
                var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100));
                datetoday_controller.text = date.toString().substring(0, 10);
              },
            ), //contacted today
            TextFormField(
              controller: description_controller,
              maxLines: 4,
              decoration: InputDecoration(
                  icon: Icon(Icons.description), labelText: 'Descriptions'),
            ), //description
          ],
        ),
      ));

  onSubmit(String leadid) {
    addnew(leadid);
  }
  Future<LeadsModel> addnew(String leadid) async {
    String uuid=staffid;
    print(uuid);
    final DatabaseReference _Ref =
    FirebaseDatabase.instance.reference().child('Staff').child(uuid);
    Fluttertoast.showToast(msg: uuid);
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    Random random = new Random();
    //  int randomNumber = random.nextInt(2000);
    var match = {
      "id":leadid,
      "name": name_controller.text,
      "title": title_controller.text,
      "email": email_controller.text,
      "website": website_controller.text,
      "phonenumber": phonenumber_controller.text,
      "company": company_controller.text,
      "address": address_controller.text,
      "city": city_controller.text,
      "state": state_controller.text,
      "description": description_controller.text,
      "default_language": language_controller.text,
      "zip": zipcode_controller.text,
      "assigned": "$_selectedStaff",
      "source": source_controller.text,
      "status": status_controller.text,
      "custom_contact_date": customContactDate_controller.text,
      "contacted_today": datetoday_controller.text,
      "is_public": isPublic_controller.text,
    };
    _Ref.child("AssignedLead").set(leadid);
    String name=name_controller.text;
    String title=title_controller.text;
    String email=email_controller.text;
    String website=website_controller.text;
    String phonenumber=phonenumber_controller.text;
    String company=company_controller.text;
    String address=address_controller.text;
    String city=city_controller.text;
    String state=state_controller.text;
    String description=description_controller.text;
    String default_language=_language;
    String zip=zipcode_controller.text;
    String assigned=_selectedStaff;
    String source=source_controller.text;
    String status=_status;
    String custom_contact_date=customContactDate_controller.text;
    String contacted_today=datetoday_controller.text;
    String is_public="$_isPublic";
///////////////////////////////
    var headers = {
      'authtoken': 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiRmx1dHRlckNSTSIsIm5hbWUiOiJieSBLaGFuIEsiLCJwYXNzd29yZCI6bnVsbCwiQVBJX1RJTUUiOjE2MzAzMTc1Njl9.BELz8NtK_2IwI5PZkaqgZLdgSKDaZ1a5t0JaJduqtFw',
      'Content-Type': 'text/plain',
      'Cookie': 'csrf_cookie_name=0d5c9c8766574d68f79e782b87a9a0e1; sp_session=b3bd6d52a288aa16d410911c544dbf514cc35990'
    };
    var request = http.Request('PUT', Uri.parse('https://crm.botsolutions.tech/api/leads/$leadid'));
    request.body = '''{ "name": "$name","title": "$title","email": "$email","website": "$website","phonenumber": "$phonenumber","company": "$company","address": "$address","city": "$city","state": "$state","description": "$description","default_language": "$default_language","zip": "$zip","assigned": "$assigned","source": "$source","status": "$status","is_public":"$is_public"}''';
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //firebase query
      final DatabaseReference _Ref =
      FirebaseDatabase.instance.reference().child('Staff').child(uuid);
      _Ref.child("AssignedLead").set(leadid);
      print(await response.stream.bytesToString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => MyLeadsView()));
      DBProvider.db.updateLead(LeadsModel.fromJson(match),leadid);
      Fluttertoast.showToast(msg: "Lead updated");
    }
    else {
      print(response.reasonPhrase);
      Fluttertoast.showToast(msg: "Failed to update");
    }
}
}
