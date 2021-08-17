// To parse this JSON data, do
//
//     final leadsModel = leadsModelFromJson(jsonString);

import 'dart:convert';

LeadsModel leadsModelFromJson(String str) => LeadsModel.fromJson(json.decode(str));

String leadsModelToJson(LeadsModel data) => json.encode(data.toJson());

class LeadsModel {
  LeadsModel({
    this.id,
    this.hash,
    this.name,
    this.title,
    this.company,
    this.description,
    this.country,
    this.zip,
    this.city,
    this.state,
    this.address,
    this.assigned,
    this.dateadded,
    this.fromFormId,
    this.status,
    this.source,
    this.lastcontact,
    this.dateassigned,
    this.lastStatusChange,
    this.addedfrom,
    this.email,
    this.website,
    this.leadorder,
    this.phonenumber,
    this.dateConverted,
    this.lost,
    this.junk,
    this.lastLeadStatus,
    this.isImportedFromEmailIntegration,
    this.emailIntegrationUid,
    this.isPublic,
    this.defaultLanguage,
    this.clientId,
    this.leadValue,
    this.vat,
    this.statusorder,
    this.color,
    this.isdefault,
    this.statusName,
    this.sourceName,
  });

  String id;
  String hash;
  String name;
  String title;
  String company;
  String description;
  String country;
  String zip;
  String city;
  String state;
  String address;
  String assigned;
  DateTime dateadded;
  String fromFormId;
  String status;
  String source;
  String lastcontact;
  String dateassigned;
  String lastStatusChange;
  String addedfrom;
  String email;
  String website;
  String leadorder;
  String phonenumber;
  String dateConverted;
  String lost;
  String junk;
  String lastLeadStatus;
  String isImportedFromEmailIntegration;
  dynamic emailIntegrationUid;
  String isPublic;
  String defaultLanguage;
  String clientId;
  String leadValue;
  dynamic vat;
  String statusorder;
  String color;
  String isdefault;
  String statusName;
  String sourceName;

  factory LeadsModel.fromJson(Map<String, dynamic> json) => LeadsModel(
    id: json["id"],
    hash: json["hash"],
    name: json["name"],
    title: json["title"],
    company: json["company"],
    description: json["description"],
    country: json["country"],
    zip: json["zip"],
    city: json["city"],
    state: json["state"],
    address: json["address"],
    assigned: json["assigned"],
    dateadded: DateTime.parse(json["dateadded"]),
    fromFormId: json["from_form_id"],
    status: json["status"],
    source: json["source"],
    lastcontact: json["lastcontact"],
    dateassigned: json["dateassigned"],
    lastStatusChange:json["last_status_change"],
    addedfrom: json["addedfrom"],
    email: json["email"],
    website: json["website"],
    leadorder: json["leadorder"],
    phonenumber: json["phonenumber"],
   dateConverted: json["date_converted"],
    lost: json["lost"],
    junk: json["junk"],
    lastLeadStatus: json["last_lead_status"],
    isImportedFromEmailIntegration: json["is_imported_from_email_integration"],
    emailIntegrationUid: json["email_integration_uid"],
    isPublic: json["is_public"],
    defaultLanguage: json["default_language"],
    clientId: json["client_id"],
    leadValue: json["lead_value"],
    vat: json["vat"],
    statusorder: json["statusorder"],
    color: json["color"],
    isdefault: json["isdefault"],
    statusName: json["status_name"],
    sourceName: json["source_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "hash": hash,
    "name": name,
    "title": title,
    "company": company,
    "description": description,
    "country": country,
    "zip": zip,
    "city": city,
    "state": state,
    "address": address,
    "assigned": assigned,
    "dateadded": dateadded.toIso8601String(),
    "from_form_id": fromFormId,
    "status": status,
    "source": source,
    "lastcontact": lastcontact,
    "dateassigned": dateassigned,
    "last_status_change": lastStatusChange,
    "addedfrom": addedfrom,
    "email": email,
    "website": website,
    "leadorder": leadorder,
    "phonenumber": phonenumber,
    "date_converted": dateConverted,
    "lost": lost,
    "junk": junk,
    "last_lead_status": lastLeadStatus,
    "is_imported_from_email_integration": isImportedFromEmailIntegration,
    "email_integration_uid": emailIntegrationUid,
    "is_public": isPublic,
    "default_language": defaultLanguage,
    "client_id": clientId,
    "lead_value": leadValue,
    "vat": vat,
    "statusorder": statusorder,
    "color": color,
    "isdefault": isdefault,
    "status_name": statusName,
    "source_name": sourceName,
  };
}
