import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'CreatenewProposal.dart';
import 'Database/db_provider.dart';
import 'Proposal_View.dart';
import 'leads_model.dart';

class lead_proposal extends StatefulWidget {
  LeadsModel lead = new LeadsModel();
  lead_proposal({key, this.lead}) : super(key: key);
  @override
  lead_proposalState createState() => lead_proposalState(lead);
}
class lead_proposalState extends State<lead_proposal> {
  LeadsModel proposal = new LeadsModel();
  lead_proposalState(LeadsModel proposal) {
    this.proposal = proposal;
  }
// ignore: camel_case_type
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ProposalModel>>(
          future: DBProvider.db.getProposals(proposal),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Text("No Proposals Available"),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(child: InkWell(
                      child: Card(
                        child: ListTile(
                          leading: Text(snapshot.data[index].proposalid.toString()),
                          title: Text(snapshot.data[index].subject) ,
                          trailing:  Text(snapshot.data[index].status.toString()),
                    ),),
                      // title: Row(
                      //   children: [
                      //     Column(
                      //       crossAxisAlignment: CrossAxisAlignment.stretch,
                      //       children: [
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text("Proposal #:",
                      //                 style: TextStyle(
                      //                     color: Colors.blue, fontSize: 18.0)),
                      //             Text(snapshot.data[index].proposalid
                      //                 .toString()),
                      //           ],
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text("Subject"),
                      //             Text(snapshot.data[index].subject),
                      //           ],
                      //         ),
                      //         Row(
                      //           mainAxisAlignment: MainAxisAlignment.start,
                      //           children: [
                      //             Text("Assigned to:"),
                      //             Text(snapshot.data[index].assigned),
                      //           ],
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // subtitle: Column(
                      //   children: <Widget>[
                      //     Row(
                      //       children: [
                      //         Text("Lead Name:" + proposal.name.toString()),
                      //       ],
                      //     ),
                      //   ],
                      // ),
                      // trailing: Container(
                      //   height: 20,
                      //   width: 30,
                      //   decoration: BoxDecoration(
                      //       shape: BoxShape.rectangle,
                      //       borderRadius: BorderRadius.circular(10.0),
                      //       color: Colors.blue),
                      //   child: Text(
                      //     snapshot.data[index].status.toString(),
                      //     style: TextStyle(color: Colors.blue),
                      //   ),
                      // ),
                    onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProposalView()));},));
                  });
            }
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CreatenewProposal(proposal)));

        },
        child: Icon(Icons.add),
      ),
    );
  }
}
class ProposalModel {
  ProposalModel({
    this.proposalid,
    this.customer_id,
    this.id,
    this.subject,
    this.status,
    this.assigned,
    this.relatedto,
    this.leadname,
    this.tolead,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipcode,
    this.email,
    this.phone,
    this.dateCreated,
    this.fromdate,
    this.opentill,
    this.currency,
    this.discounttype,
    this.tags,
    this.total,
  });
  String proposalid;
  String customer_id;
  String id;
  String subject;
  String status;
  String assigned;
  String relatedto;
  String leadname;
  String tolead;
  String address;
  String city;
  String state;
  String country;
  String zipcode;
  String email;
  String phone;
  String dateCreated;
  String fromdate;
  String opentill;
  String currency;
  String discounttype;
  String tags;
  String total;
  static const String TABLENAME = "LeadProposal";
  Map<String, dynamic> toMap() {
    return {
      "proposalid":  proposalid,
      'customer_id': customer_id,
      'id': id,
      "subject": subject,
      "status": status,
      "assigned": assigned,
      "relatedto": relatedto,
      "leadname": leadname,
      "tolead": tolead,
      "address": address,
      "city": city,
      "state": state,
      "country": country,
      "zipcode": zipcode,
      "email": email,
      "phone": phone,
      "dateCreated": dateCreated,
      "fromdate": fromdate,
      "opentill": opentill,
      "currency": currency,
      "discounttype": discounttype,
      "tags": tags,
      'total': total,
    };
  }
}