import 'dart:math';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'Database/db_provider.dart';
import 'Lead_proposal.dart';
import 'leads_model.dart';

class CreatenewProposal extends StatefulWidget {
  LeadsModel lead;
  CreatenewProposal(LeadsModel lead) {
this.lead = lead;
}
@override
_CreatenewProposalState createState() => _CreatenewProposalState(lead);
}
class _CreatenewProposalState extends State<CreatenewProposal> {
LeadsModel proposal;
_CreatenewProposalState(LeadsModel proposal) {
this.proposal = proposal;
}

  String _status;
  String _related;
  String _assigned;
  String _currency;
  String _discount;

  final _formKey = GlobalKey<FormState>();
  TextEditingController subjectController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController opentillController = TextEditingController();
  TextEditingController statusController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController CountryController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController LeadController = TextEditingController();
  TextEditingController currencyController = TextEditingController();
  TextEditingController RelatedController = TextEditingController();
  TextEditingController toleadController = TextEditingController();
  TextEditingController discounttypeController = TextEditingController();
  TextEditingController tagsController = TextEditingController();
  TextEditingController assigned_controller = TextEditingController();
  TextEditingController proposalidController = TextEditingController();
  TextEditingController datecreatedController = TextEditingController();

  List<DropdownMenuItem<String>> list;

  @override
  void initState() {
    _currency = "";
    _related = "";
    _discount = "";
    _assigned = assigned_controller.text;
    setState(() {
       LeadController.text= proposal.name;
       toleadController.text=proposal.name;
       addressController.text = proposal.address;
       cityController.text = proposal.city;
       stateController.text = proposal.state.toString();
       CountryController.text= proposal.country.toString();
       emailController.text = proposal.email.toString();
       phoneController.text = proposal.phonenumber;
      _discount = discounttypeController.text;
      _currency = currencyController.text;
      _assigned = assigned_controller.text;
      _status = statusController.text;
      _related = RelatedController.text;
    super.initState();
       list = [];
       // DBProvider.getStaffData().then((listmap) {
       //   listmap.map((map) {
       //     print(map.toString());
       //     return getDropdownWidget(map);
       //   }).forEach((dropdownitem) {
       //     list.add(dropdownitem);
       //   });
       // });
    });
    // list = [];
    // DBProvider.getStaffData().then((listmap) {
    //   listmap.map((map) {
    //     print(map.toString());
    //     return getDropdownWidget(map);
    //   }).forEach((dropdownitem) {
    //     list.add(dropdownitem);
    //   });
    // });
  }

  DropdownMenuItem<String> getDropdownWidget(Map<String, dynamic> map) {
    return DropdownMenuItem<String>(
      value: map['full_name'],
      child: Text(map["full_name"]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Create New Proposal"),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _form(),
            ],
          ),
        ),
      floatingActionButton: FloatingActionButton(
      onPressed: () {
        onSubmit();

      },
      child: Icon(Icons.check),
    ),);
  }

  _form() => Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Form(
          key: _formKey,
          child: Column(children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: subjectController,
                  decoration: InputDecoration(labelText: 'Subject'),
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
                      "display": "Draft",
                      "value": "Draft",
                    },
                    {
                      "display": "Sent",
                      "value": "Sent",
                    },
                    {
                      "display": "Open",
                      "value": "Open",
                    },
                    {
                      "display": "Revised",
                      "value": "Revised",
                    },
                    {
                      "display": "Declined",
                      "value": "Declined",
                    },
                    {
                      "display": "Accepted",
                      "value": "Accepted",
                    },
                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                DropDownFormField(
                  titleText: 'Related',
                  hintText: 'Related',
                  value: _related,
                  onSaved: (value) {
                    setState(() {
                      _related = value;
                    });
                  },
                  onChanged: (value) {
                    setState(() {
                      _related = value;
                    });
                  },
                  dataSource: [
                    {
                      "display": "Lead",
                      "value": "Lead",
                    },
                    {
                      "display": "Customer",
                      "value": "Customer",
                    },

                  ],
                  textField: 'display',
                  valueField: 'value',
                ),
              ],
            ),
            DropdownButtonFormField(
              items: list.toList(),
              hint: Text("Assigned"),
              onChanged: (value) {
                setState(() {
                  _assigned = value;
                });
              },
              onSaved: (value) {
                _assigned = value;
              },
            ),
            TextFormField(
              enabled: true,
              controller: LeadController,
              decoration: InputDecoration(labelText: "Lead Name"),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextField(
                  readOnly: true,
                  controller: dateController,
                  decoration: InputDecoration(hintText: 'Date'),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    dateController.text = date.toString().substring(0, 10);
                  },
                ),
                TextField(
                  readOnly: true,
                  controller: opentillController,
                  decoration: InputDecoration(hintText: 'Open Till'),
                  onTap: () async {
                    var date = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100));
                    opentillController.text = date.toString().substring(0, 10);
                  },
                ),
              ],
            ),
            TextFormField(
              controller: toleadController,
              decoration: InputDecoration(labelText: "TO Lead"),
            ),
            TextFormField(
              controller: addressController,
              decoration: InputDecoration(labelText: "Address"),
              maxLength: 100,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: cityController,
                  decoration: InputDecoration(labelText: "City"),
                ),
                TextFormField(
                  controller: stateController,
                  decoration: InputDecoration(labelText: "State"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: CountryController,
                  decoration:
                      InputDecoration(labelText: "Country"),
                ),
                TextFormField(
                  controller: zipController,
                  decoration: InputDecoration(labelText: "Zip code"),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextFormField(
                  controller: phoneController,
                  decoration: InputDecoration(labelText: "Phone Number"),
                ),
              ],
            ),
            DropDownFormField(
              titleText: 'Currency',
              hintText: 'Select Currency',
              value: _currency,
              onSaved: (value) {
                setState(() {
                  _currency = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _currency = value;
                });
              },
              dataSource: [
                {
                  "display": "SAR",
                  "value": "SAR",
                },
                {
                  "display": "PKR",
                  "value": "PKR",
                },
                {
                  "display": "USD",
                  "value": "USD",
                },
                {
                  "display": "EUR",
                  "value": "EUR",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            DropDownFormField(
              titleText: 'Discount type',
              hintText: 'No Discount',
              value: _discount,
              onSaved: (value) {
                setState(() {
                  _discount = value;
                });
              },
              onChanged: (value) {
                setState(() {
                  _discount = value;
                });
              },
              dataSource: [
                {
                  "display": "No Discount",
                  "value": "No Discount",
                },
                {
                  "display": "Before Tax",
                  "value": "Before Tax",
                },
                {
                  "display": "After Tax",
                  "value": "After Tax",
                },
              ],
              textField: 'display',
              valueField: 'value',
            ),
            TextFormField(
              controller: tagsController,
              decoration: InputDecoration(labelText: "Tags"),
            ),

          ])));

  onSubmit() async {
    var form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      bool result = await DataConnectionChecker().hasConnection;
      DateTime dateToday = new DateTime.now();
      String date = dateToday.toString().substring(0, 10);
      Random random = new Random();
      int randomNumber = random.nextInt(2000);
      if(result == true){
      DBProvider.db.insertProposal(ProposalModel(
        proposalid: "$randomNumber",
        id: proposal.id,
       subject: subjectController.text,
        status: statusController.text,
        assigned: assigned_controller.text,
        relatedto: RelatedController.text,
        leadname: LeadController.text,
        tolead: toleadController.text,
        address: addressController.text,
        city: cityController.text,
        state: stateController.text,
        country: CountryController.text,
        zipcode: zipController.text,
        email: emailController.text,
        phone: phoneController.text,
        dateCreated: date,
        fromdate: dateController.text,
        opentill: opentillController.text,
        currency: currencyController.text,
        discounttype: discounttypeController.text,
        tags: tagsController.text,

      )
      );
      Fluttertoast.showToast(msg: "New Proposal Added");
      Navigator.pop(context);
    }else{
        Fluttertoast.showToast(msg: "Please check your Network Connection");
      }
    }
  }
}
