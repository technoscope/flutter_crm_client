import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'leads_model.dart';
class Lead_Details extends StatelessWidget {
  LeadsModel lead;
  Lead_Details({key, this.lead}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
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
                  lead.company.toString(),
                  style: TextStyle(color: Colors.black, fontSize: 16),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    lead.name.toString(),
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.topLeft,
                child: Text(
                  "Lead Information",
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.my_location,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Title",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
              Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(lead.title.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      )),                 ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                 children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.my_location,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Source",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                  Expanded(
                         child: Padding(
                           padding: const EdgeInsets.only(right: 8.0),
                           child: Text(lead.sourceName.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                         )),

                  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.my_location,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Staff Details",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(lead.assigned.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.language,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Language",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.defaultLanguage.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.location_city,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Country",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Text(lead.country.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.location_city,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("City",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.city.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.location_city,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("State",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.state.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.location_city,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Zip",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.zip.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    ) ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.location_city,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Address",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.address.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.email,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Email",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.email.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )   ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.http,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Website",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.website.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )     ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.phone,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Phone",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.phonenumber.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )    ],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Date Added",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.dateadded.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )  ],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Last Status Change",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.lastStatusChange.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    ) ],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Last Lead Status",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.lastLeadStatus.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Last Contact",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.lastcontact.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Date Assigned",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.dateassigned.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.date_range,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Date Converted",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.dateConverted.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.my_location,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Status",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.statusName.toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )],
                ),
                SizedBox(height: 5,child: Divider(color: Colors.grey,),),
                Row(
                  children: [
                    SizedBox(width: 5.0,),
                    Icon(Icons.description,size: 15,color: Colors.black,),
                    SizedBox(width: 10,),
                    Text("Description",style: TextStyle(color: Colors.black,fontSize: 15, fontWeight: FontWeight.bold),),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Text(lead.description.toString(),maxLines:5,style: TextStyle(fontSize: 15),textAlign: TextAlign.right,),
                      ),
                    )
                  ],
                ),SizedBox(height: 5,child: Divider(color: Colors.grey,),),
              ],
              ),
            )
          ],
        ),
      ),
    )
    );
  }
}
