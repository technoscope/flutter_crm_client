import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Lead_details.dart';
import 'Lead_proposal.dart';
import 'Lead_related.dart';
import 'Update_lead.dart';
import 'leads_model.dart';

class LeadsDashboardScreen extends StatefulWidget {
  LeadsModel lead = new LeadsModel();

  LeadsDashboardScreen({key, this.lead}) : super(key: key);

  @override
  _LeadsDashboardScreenState createState() => _LeadsDashboardScreenState(lead);
}

class _LeadsDashboardScreenState extends State<LeadsDashboardScreen> {
  LeadsModel lead = new LeadsModel();

  _LeadsDashboardScreenState(LeadsModel lead) {
    this.lead = lead;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {Navigator.pop(context); },),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Text("RELATED"),
                ),
                Tab(text: "PROPOSAL"),
                Tab(text: "DETAILS"),
              ],
            ),
            title: Text("Lead Details"),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder:
                  (context)=>
                      Update_lead(lead:lead)
              )
              );
            }, icon: Icon(Icons.edit))
          ],
          ),
          body: TabBarView(
            children: [
             Lead_related(lead: lead),
             lead_proposal(lead: lead),
             Lead_Details(lead: lead)
            ],
          ),
        ),
      ),
    );
  }
}
