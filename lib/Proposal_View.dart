import 'package:flutter/material.dart';
import 'leads_model.dart';
class ProposalView extends StatefulWidget {
  LeadsModel proposal;
  ProposalView({key, this.proposal}) : super(key: key);

  @override
  _ProposalViewState createState() => _ProposalViewState(proposal);
}

class _ProposalViewState extends State<ProposalView> {
  LeadsModel proposal = new LeadsModel();

  _ProposalViewState(LeadsModel proposal) {
    this.proposal = proposal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _proposal(),
    );
  }

  _proposal() {
    SingleChildScrollView(
      child: Column(
        children:[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: 300,
            child: Image.asset("assets/bot_logo.png",alignment: Alignment.center,),
          ),
        ),
          Text("Proposal ID:")
        ],
      ),
    )
;
  }
}
