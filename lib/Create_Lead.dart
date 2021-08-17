import 'dart:math';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'Database/db_provider.dart';
import 'MyLeadsView.dart';
import 'leads_model.dart';

class create_Lead extends StatefulWidget {
  @override
  _create_LeadState createState() => _create_LeadState();
}
class _create_LeadState extends State<create_Lead> {
  Future<LeadsModel> _model;
  final _formKey = GlobalKey<FormState>();
  double width = 0;
  double height = 0;
  String _myActivity;
  String _assigned;
  String _status;
  bool _isPublic = false;
  String _language;
  String source;
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
  String selectedStaff;
  int count;
  List<DropdownMenuItem<String>> list;

  @override
  void initState() {
    _myActivity = "";
    _language = "";
    _status = "";
    source = "";
    selectedStaff = assigned_controller.text;
    setState(() {
      _myActivity = tags_controller.text;
      _status = status_controller.text;
      _language = language_controller.text;
      source = source_controller.text;
      list = [];
      DBProvider.getStaffData().then((listmap) {
        listmap.map((map) {
          return getDropdownWidget(map);
        }).forEach((dropdownitem) {
          list.add(dropdownitem);
        });
      });
      selectedStaff = assigned_controller.text;
    });
    super.initState();

  }

  DropdownMenuItem<String> getDropdownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['full_name'],
      child: Text(map["full_name"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("Create New Lead"),
          actions: [
            IconButton(
              icon: Icon(Icons.save),
              tooltip: 'Submit',
              onPressed: () {
                onSubmit();
              },
            ),
          ],
        ),
        body:
            // _listView(),
            SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _form(),
              // _listView(),
            ],
          ),
        ));
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
            ),
            //name
            TextFormField(
              controller: title_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.title), labelText: 'Title'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ),
            //title
            TextFormField(
              controller: company_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.business), labelText: 'Company Name'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ),
            //company
            TextFormField(
              controller: email_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.email), labelText: 'Email'),
            ),
            //email
            TextFormField(
              keyboardType: TextInputType.phone,
              maxLength: 16,
              controller: phonenumber_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.phone), labelText: 'Phone Number'),
              validator: (val) =>
                  (val.length == 0 ? 'The field cannot be empty' : null),
            ),
            //phone
            TextFormField(
              controller: address_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.home), labelText: 'Address'),
            ),
            //address
            TextFormField(
              controller: website_controller,
              decoration:
                  InputDecoration(icon: Icon(Icons.web), labelText: 'Website'),
            ),
            //website
            TextFormField(
              controller: city_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.apartment), labelText: 'City'),
            ),
            //city
            TextFormField(
              controller: state_controller,
              decoration: InputDecoration(
                  icon: Icon(Icons.place), labelText: 'State Name'),
            ),
            //state
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
                  selectedStaff = value;
                });
              },
              onSaved: (value){
                selectedStaff = value;
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
            ),
            //isPublic
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
            ),
            //contact date
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
            ),
            //contacted today
            TextFormField(
              controller: description_controller,
              maxLines: 4,
              decoration: InputDecoration(
                  icon: Icon(Icons.description), labelText: 'Descriptions'),
            ),
            //description
          ],
        ),
      ));

  onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      bool result = await DataConnectionChecker().hasConnection;
      if (result == true) {
        _model = addnew(
          name_controller.text,
          title_controller.text,
          company_controller.text,
          email_controller.text,
          phonenumber_controller.text,
          address_controller.text,
          website_controller.text,
          city_controller.text,
          state_controller.text,
          zipcode_controller.text,
          tags_controller.text,
          language_controller.text,
          assigned_controller.text,
          source_controller.text,
          status_controller.text,
          customContactDate_controller.text,
          datetoday_controller.text,
          description_controller.text,
        );
        form.reset();
      } else {
        DateTime dateToday = new DateTime.now();
        String date = dateToday.toString().substring(0, 10);
        Random random = new Random();
        // int randomNumber = random.nextInt(2000);
        var match = {
          //  "id":  "MA-$randomNumber",
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
          "assigned": assigned_controller.text,
          "dateadded": date,
          "source": source_controller.text,
          "status": status_controller.text,
          "custom_contact_date": customContactDate_controller.text,
          "contacted_today": datetoday_controller.text,
          "is_public": isPublic_controller.text,
        };
        DBProvider.db.addnewLead(LeadsModel.fromJson(match));
      }
    } else {
      Fluttertoast.showToast(
          msg: "Please fill out All required the Fields",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<LeadsModel> addnew(
    String name,
    String title,
    String company,
    String zip,
    String city,
    String state,
    String address,
    String assigned,
    String email,
    String website,
    String phonenumber,
    String isPublic,
    String defaultLanguage,
    String customContactDate,
    String contactedToday,
    String status,
    String source,
    String description,
  ) async {
    DateTime dateToday = new DateTime.now();
    String date = dateToday.toString().substring(0, 10);
    Random random = new Random();
    //  int randomNumber = random.nextInt(2000);
    var match = {
      //  "id":  "MA-$randomNumber",
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
      "default_language": _language,
      "zip": zipcode_controller.text,
      "assigned": selectedStaff,
      "dateadded": date,
      "source": source_controller.text,
      "status": _status,
      "custom_contact_date": customContactDate_controller.text,
      "contacted_today": datetoday_controller.text,
      "is_public": _isPublic,
    };

    final String myUrl = "https://crm.botsolutions.tech/api/leads/";
    final response = await http
        .post(
      Uri.parse(myUrl),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
        'authtoken':
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiRmx1dHRlckNSTSIsIm5hbWUiOiJBaG1hZCBSZWhtYW4iLCJwYXNzd29yZCI6bnVsbCwiQVBJX1RJTUUiOjE2Mjg1OTQwOTh9.-NHttd3B7ejKI1SrqkZpAGonz6clpF9EBnmcU22_2HE',
      },
      body: match,
    )
        .then((response) {
      print('Response status : ${response.statusCode}');
      print('Response body : ${response.body}');
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MyLeadsView()));
        print(response.body);
        DBProvider.db.addnewLead(LeadsModel.fromJson(match));
        Fluttertoast.showToast(msg: "new Lead Created");
      } else {
        Fluttertoast.showToast(msg: "Error");
      }
    });
    return response;
  }
}
