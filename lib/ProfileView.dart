import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Database/db_provider.dart';
import 'StaffModel.dart';
class ProfileView extends StatefulWidget {
  ProfileView({Key key}) : super(key: key);
  @override
  _ProfileViewState createState() => _ProfileViewState();
}
class _ProfileViewState extends State<ProfileView> {
  final databaseReference = FirebaseDatabase.instance;
  String uuid;
  var ref;
  static Map map;
  String staffid=" ";
  String email=" ";
  String firstname=" ";
  String lastname=" ";
  String facebook=" ";
  String linkedin=" ";
  String phonenumber=" ";
  String skype=" ";
  String password=" ";
  String datecreated=" ";
  String profileImage=" ";
  String lastIp=" ";
  String lastLogin=" ";
  String lastActivity=" ";
  String lastPasswordChange=" ";
  String newPassKey=" ";
  String newPassKeyRequested=" ";
  String admin=" ";
  String role=" ";
  String active=" ";
  String defaultLanguage=" ";
  String direction=" ";
  String mediaPathSlug=" ";
  String isNotStaff=" ";
  String hourlyRate=" ";
  String twoFactorAuthEnabled=" ";
  String twoFactorAuthCode=" ";
  String twoFactorAuthCodeRequested=" ";
  String emailSignature=" ";
  String birthday=" ";
  String birthplace=" ";
  String sex=" ";
  String maritalStatus=" ";
  String nation=" ";
  String religion=" ";
  String identification=" ";
  String daysForIdentity=" ";
  String homeTown=" ";
  String resident=" ";
  String currentAddress=" ";
  String literacy=" ";
  String ortherInfor=" ";
  String jobPosition=" ";
  String workplace=" ";
  String placeOfIssue=" ";
  String accountNumber=" ";
  String nameAccount=" ";
  String issueBank=" ";
  String recordsReceived=" ";
  String personalTaxCode=" ";
  String teamManage=" ";
  String staffIdentifi=" ";
  String statusWork=" ";
  String dateUpdate=" ";
  String mailPassword=" ";
  String lastEmailCheck=" ";
  String googleAuthSecret=" ";
  String fullName=" ";
  String permissions=" ";
  bool flag = false;
  bool firebaseflag = false;

  @override
  void initState() {
    _initfirebase();
    if (flag = true) {
      _getemployee();
    }
    super.initState();
  }

  _initfirebase() {
    flag = true;
    uuid = FirebaseAuth.instance.currentUser.uid.toString();
    ref = databaseReference.reference().child('Staff');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
        ),
        body: firebaseflag?Container(
          color: Colors.white12,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: Colors.white,
                        child: Image(
                          image: AssetImage(
                            "assets/logo_blue.png",
                          ),
                          height: 80.0,
                          width: 80.0,
                        ),
                      ),
                    ),
                    Text(
                      "$firstname $lastname",
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        email,
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.my_location,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "CurrentAddress ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              currentAddress,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.right,
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.baby_changing_station,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Birthday",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              birthday,
                              style: TextStyle(fontSize: 15),
                              textAlign: TextAlign.right,
                            ),
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.people,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Gender",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                sex,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.people,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Marital Status",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                maritalStatus,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.language,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Language",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                defaultLanguage,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.location_city,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Country",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                nation,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.location_city,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "City",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                currentAddress,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.location_city,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Home Town",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                homeTown,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.my_location,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "CurrentAddress ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8.0),
                                child: Text(
                                  currentAddress,
                                  style: TextStyle(fontSize: 15),
                                  textAlign: TextAlign.right,
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.date_range,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Date Assigned",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                datecreated,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.work,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Job position",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                jobPosition,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.my_location,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Bank name",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                issueBank,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.description,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Account number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                accountNumber,
                                maxLines: 5,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 5.0,
                          ),
                          Icon(
                            Icons.description,
                            size: 15,
                            color: Colors.black,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Personal Tax Number",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                personalTaxCode,
                                maxLines: 5,
                                style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: 5,
                        child: Divider(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ):Center(child: CircularProgressIndicator()));
  }
  _getemployee() async {
    await ref.child(uuid).once().then((DataSnapshot snapshot) {
      map = snapshot.value["profile"];
      setState(() {
        firebaseflag=true;
        firstname = map["firstname"];
        lastname = map["lastname"];
        birthday = map["birthday"];
        email = map["email"];
        phonenumber = map["phonenumber"];
        religion = map["religion"];
        issueBank = map["issue_bank"];
        homeTown = map["home_town"];
        jobPosition = map["job_position"];
        sex = map["sex"];
        staffid = map["staffid"];
        nation = map["nation"];
        resident = map["resident"];
        accountNumber = map["account_number"];
        maritalStatus = map["marital_status"];
        personalTaxCode = map["Personal_tax_code"];
        datecreated = map["datecreated"];
        facebook = map["facebook"];
        currentAddress = map["current_address"];
      });
    });
    ref = databaseReference.reference().child('Staff');
    await ref.child(uuid).child("profile").once().then((DataSnapshot snapshot) {
      DBProvider.db.addnewStaff(StaffModel.fromSnapshot(snapshot));
    });
  }
}
