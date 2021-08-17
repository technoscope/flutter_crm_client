// To parse this JSON data, do
//
//     final staffModel = staffModelFromJson(jsonString);

import 'dart:convert';

import 'package:firebase_database/firebase_database.dart';
StaffModel staffModelFromJson(String str) =>
    StaffModel.fromJson(json.decode(str));
String staffModelToJson(StaffModel data) => json.encode(data.toJson());
class StaffModel {
  StaffModel({
    this.staffid,
    this.email,
    this.firstname,
    this.lastname,
    this.facebook,
    this.linkedin,
    this.phonenumber,
    this.skype,
    this.password,
    this.datecreated,
    this.profileImage,
    this.lastIp,
    this.lastLogin,
    this.lastActivity,
    this.lastPasswordChange,
    this.newPassKey,
    this.newPassKeyRequested,
    this.admin,
    this.role,
    this.active,
    this.defaultLanguage,
    this.direction,
    this.mediaPathSlug,
    this.isNotStaff,
    this.hourlyRate,
    this.twoFactorAuthEnabled,
    this.twoFactorAuthCode,
    this.twoFactorAuthCodeRequested,
    this.emailSignature,
    this.birthday,
    this.birthplace,
    this.sex,
    this.maritalStatus,
    this.nation,
    this.religion,
    this.identification,
    this.daysForIdentity,
    this.homeTown,
    this.resident,
    this.currentAddress,
    this.literacy,
    this.ortherInfor,
    this.jobPosition,
    this.workplace,
    this.placeOfIssue,
    this.accountNumber,
    this.nameAccount,
    this.issueBank,
    this.recordsReceived,
    this.personalTaxCode,
    this.teamManage,
    this.staffIdentifi,
    this.statusWork,
    this.dateUpdate,
    this.mailPassword,
    this.lastEmailCheck,
    this.googleAuthSecret,
    this.fullName,
    this.permissions,
  });

  dynamic staffid;
  String email;
  String firstname;
  String lastname;
  String facebook;
  String linkedin;
  String phonenumber;
  String skype;
  String password;
  dynamic datecreated;
  dynamic profileImage;
  String  lastIp;
  dynamic lastLogin;
  dynamic lastActivity;
  dynamic lastPasswordChange;
  dynamic newPassKey;
  dynamic newPassKeyRequested;
  String  admin;
  String  role;
  String  active;
  String  defaultLanguage;
  String  direction;
  String  mediaPathSlug;
  String  isNotStaff;
  String  hourlyRate;
  String  twoFactorAuthEnabled;
  dynamic twoFactorAuthCode;
  dynamic twoFactorAuthCodeRequested;
  String  emailSignature;
  dynamic birthday;
  dynamic birthplace;
  dynamic sex;
  dynamic maritalStatus;
  dynamic nation;
  dynamic religion;
  dynamic identification;
  dynamic daysForIdentity;
  dynamic homeTown;
  dynamic resident;
  dynamic currentAddress;
  dynamic literacy;
  dynamic ortherInfor;
  dynamic jobPosition;
  dynamic workplace;
  dynamic placeOfIssue;
  dynamic accountNumber;
  dynamic nameAccount;
  dynamic issueBank;
  dynamic recordsReceived;
  dynamic personalTaxCode;
  String  teamManage;
  dynamic staffIdentifi;
  dynamic statusWork;
  dynamic dateUpdate;
  dynamic mailPassword;
  dynamic lastEmailCheck;
  dynamic googleAuthSecret;
  String  fullName;
  String  permissions;

  StaffModel.fromSnapshot(DataSnapshot map) :
    staffid=map.value["staffid"],
    email = map.value["email"],
    firstname = map.value["firstname"],
    lastname = map.value["lastname"],
    facebook = map.value["facebook"],
    linkedin=map.value["linkedin"],
    skype=map.value["skype"],
    password=map.value["password"],
    phonenumber = map.value["phonenumber"],
    datecreated = map.value["datecreated"],
    profileImage=map.value["profile_image"],
    lastIp=map.value["last_ip"],
    lastLogin=map.value["last_login"],
    lastActivity=map.value["last_activity"],
    lastPasswordChange=map.value["lastPasswordChange"],
    newPassKey=map.value["new_pass_key"],
    newPassKeyRequested=map.value["new_pass_key_requested"],
    admin = map.value["admin"],
    role=map.value["role"],
    active=map.value["active"],
    defaultLanguage=map.value["default_language"],
    direction=map.value["direction"],
    mediaPathSlug=map.value["media_path_slug"],
    isNotStaff=map.value["is_not_staff"],
    hourlyRate=map.value["hourly_rate"],
    twoFactorAuthEnabled=map.value["two_factor_auth_enabled"],
    twoFactorAuthCode=map.value["two_factor_auth_code"],
    twoFactorAuthCodeRequested=map.value["two_factor_auth_code_requested"],
    emailSignature=map.value["email_signature"],
    birthday=map.value["birthday"],
    birthplace=map.value["birthplace"],
    sex=map.value["sex"],
    maritalStatus=map.value["marital_status"],
    nation=map.value["nation"],
    religion=map.value["religion"],
    identification=map.value["identification"],
    daysForIdentity=map.value["days_for_identity"],
    homeTown=map.value["home_town"],
    resident=map.value["resident"],
    currentAddress=map.value["current_address"],
    literacy=map.value["literacy"],
    ortherInfor=map.value["orther_infor"],
    jobPosition=map.value["job_position"],
    workplace=map.value["workplace"],
    placeOfIssue=map.value["place_of_issue"],
    accountNumber=map.value["account_number"],
    nameAccount=map.value["name_account"],
    issueBank=map.value["issue_bank"],
    recordsReceived=map.value["records_received"],
    personalTaxCode=map.value["Personal_tax_code"],
    teamManage=map.value["team_manage"],
    staffIdentifi=map.value["staff_identifi"],
    statusWork=map.value["status_work"],
    dateUpdate=map.value["date_update"],
    mailPassword=map.value["mail_password"],
        lastEmailCheck=map.value["last_email_check"],
    googleAuthSecret=map.value["google_auth_secret"],
    fullName=map.value["full_name"],
    permissions=map.value["permissions"];
  factory StaffModel.fromJson(Map<String, dynamic> json) => StaffModel(
      staffid: json["staffid"],
      email: json["email"],
      firstname: json["firstname"],
      lastname: json["lastname"],
      facebook: json["facebook"],
      linkedin: json["linkedin"],
      phonenumber: json["phonenumber"],
      skype: json["skype"],
      password: json["password"],
      datecreated: json["datecreated"],
      profileImage: json["profile_image"],
      lastIp: json["last_ip"],
      lastLogin: json["last_login"],
      lastActivity: json["last_activity"],
      lastPasswordChange: json["last_password_change"],
      newPassKey: json["new_pass_key"],
      newPassKeyRequested: json["new_pass_key_requested"],
      admin: json["admin"],
      role: json["role"],
      active: json["active"],
      defaultLanguage: json["default_language"],
      direction: json["direction"],
      mediaPathSlug: json["media_path_slug"],
      isNotStaff: json["is_not_staff"],
      hourlyRate: json["hourly_rate"],
      twoFactorAuthEnabled: json["two_factor_auth_enabled"],
      twoFactorAuthCode: json["two_factor_auth_code"],
      twoFactorAuthCodeRequested: json["two_factor_auth_code_requested"],
      emailSignature: json["email_signature"],
      birthday: json["birthday"],
      birthplace: json["birthplace"],
      sex: json["sex"],
      maritalStatus: json["marital_status"],
      nation: json["nation"],
      religion: json["religion"],
      identification: json["identification"],
      daysForIdentity: json["days_for_identity"],
      homeTown: json["home_town"],
      resident: json["resident"],
      currentAddress: json["current_address"],
      literacy: json["literacy"],
      ortherInfor: json["orther_infor"],
      jobPosition: json["job_position"],
      workplace: json["workplace"],
      placeOfIssue: json["place_of_issue"],
      accountNumber: json["account_number"],
      nameAccount: json["name_account"],
      issueBank: json["issue_bank"],
      recordsReceived: json["records_received"],
      personalTaxCode: json["Personal_tax_code"],
      teamManage: json["team_manage"],
      staffIdentifi: json["staff_identifi"],
      statusWork: json["status_work"],
      dateUpdate: json["date_update"],
      mailPassword: json["mail_password"],
      lastEmailCheck: json["last_email_check"],
      googleAuthSecret: json["google_auth_secret"],
      fullName: json["full_name"],
      permissions: json["permissions"]
      // List<Permission>.from(json["permissions"].map((x) => Permission.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "staffid": staffid,
        "email": email,
        "firstname": firstname,
        "lastname": lastname,
        "facebook": facebook,
        "linkedin": linkedin,
        "phonenumber": phonenumber,
        "skype": skype,
        "password": password,
        "datecreated": datecreated,
        "profile_image": profileImage,
        "last_ip": lastIp,
        "last_login": lastLogin,
        "last_activity": lastActivity,
        "last_password_change": lastPasswordChange,
        "new_pass_key": newPassKey,
        "new_pass_key_requested": newPassKeyRequested,
        "admin": admin,
        "role": role,
        "active": active,
        "default_language": defaultLanguage,
        "direction": direction,
        "media_path_slug": mediaPathSlug,
        "is_not_staff": isNotStaff,
        "hourly_rate": hourlyRate,
        "two_factor_auth_enabled": twoFactorAuthEnabled,
        "two_factor_auth_code": twoFactorAuthCode,
        "two_factor_auth_code_requested": twoFactorAuthCodeRequested,
        "email_signature": emailSignature,
        "birthday": birthday,
        "birthplace": birthplace,
        "sex": sex,
        "marital_status": maritalStatus,
        "nation": nation,
        "religion": religion,
        "identification": identification,
        "days_for_identity": daysForIdentity,
        "home_town": homeTown,
        "resident": resident,
        "current_address": currentAddress,
        "literacy": literacy,
        "orther_infor": ortherInfor,
        "job_position": jobPosition,
        "workplace": workplace,
        "place_of_issue": placeOfIssue,
        "account_number": accountNumber,
        "name_account": nameAccount,
        "issue_bank": issueBank,
        "records_received": recordsReceived,
        "Personal_tax_code": personalTaxCode,
        "team_manage": teamManage,
        "staff_identifi": staffIdentifi,
        "status_work": statusWork,
        "date_update": dateUpdate,
        "mail_password": mailPassword,
        "last_email_check": lastEmailCheck,
        "google_auth_secret": googleAuthSecret,
        "full_name": fullName,
        "permissions": ""
        //List<dynamic>.from(permissions.map((x) => x.toJson())),
      };
}

class Permission {
  Permission({
    this.staffId,
    this.feature,
    this.capability,
  });
  String staffId;
  String feature;
  String capability;

  factory Permission.fromJson(Map<String, dynamic> json) => Permission(
        staffId: json["staff_id"],
        feature: json["feature"],
        capability: json["capability"],
      );

  Map<String, dynamic> toJson() => {
        "staff_id": staffId,
        "feature": feature,
        "capability": capability,
      };
}
