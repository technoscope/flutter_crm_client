import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import '../leads/Lead_proposal.dart';
import '../StaffModel.dart';
import '../leads/leads_NotesView.dart';
import '../leads/leads_TasksView.dart';
import '../leads/leads_model.dart';
import '../leads/leads_reminderView.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    // If database exists, return database
    if (_database != null) return _database;
    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'bot_crm.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE IF NOT EXISTS Leads('
              "id TEXT PRIMARY KEY NOT NULL,"
              "hash TEXT,"
              "name TEXT,"
              "title TEXT, "
              "company TEXT,"
              "description TEXT,"
              "country TEXT,"
              "zip TEXT,"
              "city TEXT,"
              "state TEXT,"
              "address TEXT,"
              "assigned TEXT,"
              "dateadded TEXT,"
              "from_form_id TEXT,"
              "status TEXT,"
              "source TEXT,"
              "lastcontact TEXT,"
              "dateassigned TEXT,"
              "last_status_change TEXT,"
              "addedfrom TEXT,"
              "email TEXT,"
              "website TEXT,"
              "leadorder TEXT,"
              "phonenumber TEXT,"
              "date_converted TEXT,"
              "lost TEXT,"
              "junk TEXT,"
              "last_lead_status TEXT,"
              "is_imported_from_email_integration TEXT,"
              "email_integration_uid TEXT,"
              "is_public TEXT,"
              "default_language TEXT,"
              "client_id TEXT,"
              "lead_value TEXT,"
              "vat TEXT,"
              "statusorder TEXT,"
              "color TEXT,"
              "isdefault TEXT,"
              "status_name TEXT,"
              "source_name TEXT"
              ')');

          await db.execute(
              'CREATE TABLE IF NOT EXISTS Notes(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, customer_id TEXT, content TEXT)');
          await db.execute(
              'CREATE TABLE IF NOT EXISTS Reminders(assigned TEXT, id TEXT, dateCreated TEXT, content TEXT)');
          await db.execute(
              'CREATE TABLE IF NOT EXISTS LeadsNotes(assigned TEXT, id TEXT, dateCreated TEXT, content TEXT)');
          await db.execute(
              'CREATE TABLE IF NOT EXISTS LeadProposals(proposalid TEXT PRIMARY KEY NOT NULL, customer_id TEXT, id TEXT, subject TEXT, status TEXT,assigned TEXT,relatedto TEXT,leadname TEXT,tolead  TEXT,address TEXT,city TEXT,state TEXT,country TEXT,zipcode TEXT,email TEXT,phone TEXT,dateCreated TEXT,fromdate TEXT,opentill TEXT, currency TEXT, discounttype TEXT, tags TEXT, total TEXT)');
          await db.execute(
              'CREATE TABLE IF NOT EXISTS LeadTasks(assigned TEXT, id TEXT, startDate TEXT,dueDate TEXT,subject TEXT,hourlyRate TEXT, dateCreated TEXT, description TEXT,priority TEXT)');
          // await db.execute(
          //     'CREATE TABLE IF NOT EXISTS LeadAssign(staffid INTEGER, uuid TEXT,leadid TEXT)');

          await db.execute('CREATE TABLE IF NOT EXISTS Invoice('
              "invoice_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,"
              "customer_id TEXT,"
              "billing_city TEXT,"
              "billing_state TEXT,"
              "billing_zip TEXT,"
              "billing_country TEXT,"
              "shipping_city TEXT,"
              "shipping_state TEXT,"
              "shipping_zip TEXT,"
              "shipping_country TEXT,"
              "invoicenumber TEXT,"
              "invoicedate TEXT,"
              "invoiceduedate TEXT,"
              "paymentmodes TEXT,"
              "currency TEXT,"
              "saleagent TEXT,"
              "recurringinvoice TEXT,"
              "discounttype TEXT,"
              "totalcycle TEXT,"
              "adminnote TEXT,"
              "itemname TEXT,"
              "description TEXT,"
              "rate TEXT,"
              "tax TEXT,"
              "subtotal TEXT,"
              "discount TEXT,"
              "adjustment TEXT,"
              "total TEXT,"
              "clientnote TEXT,"
              "termandcondition TEXT"
              ')');
          await db.execute('CREATE TABLE IF NOT EXISTS Staffs('
              "staffid INTEGER PRIMARY KEY NOT NULL,"
              "email TEXT,"
              "firstname TEXT,"
              "lastname TEXT,"
              "facebook TEXT,"
              "linkedin TEXT,"
              "phonenumber TEXT,"
              "skype TEXT,"
              "password TEXT,"
              "datecreated TEXT,"
              "profile_image TEXT,"
              "last_ip TEXT,"
              "last_login TEXT,"
              "last_activity TEXT,"
              "last_password_change TEXT,"
              "new_pass_key TEXT,"
              "new_pass_key_requested TEXT,"
              "admin TEXT,"
              "role TEXT,"
              "active TEXT,"
              "default_language TEXT,"
              "direction TEXT,"
              "media_path_slug TEXT,"
              "is_not_staff TEXT,"
              "hourly_rate TEXT,"
              "two_factor_auth_enabled TEXT,"
              "two_factor_auth_code TEXT,"
              "two_factor_auth_code_requested TEXT,"
              "email_signature TEXT,"
              "birthday TEXT,"
              "birthplace TEXT,"
              "sex TEXT,"
              "marital_status TEXT,"
              "nation TEXT,"
              "religion TEXT,"
              "identification TEXT,"
              "days_for_identity TEXT,"
              "home_town TEXT,"
              "resident TEXT,"
              "current_address TEXT,"
              "literacy TEXT,"
              "orther_infor TEXT,"
              "job_position TEXT,"
              "workplace TEXT,"
              "place_of_issue TEXT,"
              "account_number TEXT,"
              "name_account TEXT,"
              "issue_bank TEXT,"
              "records_received TEXT,"
              "personal_tax_code TEXT,"
              "team_manage TEXT,"
              "staff_identifi TEXT,"
              "status_work TEXT,"
              "date_update TEXT,"
              "mail_password TEXT,"
              "last_email_check TEXT,"
              "google_auth_secret TEXT,"
              "full_name TEXT,"
              "permissions TEXT"
              ')');
        });
  }



//getting leads
  Future<List<LeadsModel>> getAllLeads() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Leads");
    List<LeadsModel> list = res.isNotEmpty
        ? res.map((c) => LeadsModel.fromJson(c)).toList()
        : [];
    return list;
  }
  addnewLead(LeadsModel newLead) async {
    final db = await database;
    if (_existLead(newLead) == false) {
      return null;
    } else {
      final res = await db.insert('Leads', newLead.toJson());
      return res;
    }
  }
  updateLead(LeadsModel update,String id) async {
      final db = await database;
      int res = await db.update('Leads', update.toJson(),
          where: 'id = ?', whereArgs: [id]);
      if (res == 1) {
        return 1;
      } else {
        return 0;
      }
    }

  Future<bool> _existLead(LeadsModel existLead) async {
    final db = await database;
    String id = existLead.id;
    final res = await db.rawQuery("select $id from Leads");
    if (res.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
  //-----------------------Staff---------------------------------
  Future<List<StaffModel>> getAllStaffs() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM Staffs");
    List<StaffModel> list = res.isNotEmpty
        ? res.map((c) => StaffModel.fromJson(c)).toList()
        : [];
    return list;
  }


  Future<String> getStaff(int staffid) async {
    print(staffid);
    print("adasdasdas");
    final db = await database;
    final res = await db.rawQuery("Select * from Staffs where staffid=$staffid");
    String result;
    String result2;
    List<StaffModel> list = res.isNotEmpty
        ? res.map((c) => StaffModel.fromJson(c)).toList()
        : [];
    result=await list[0].googleAuthSecret;
    result2=result;
    return result2;
  }

  addnewStaff(StaffModel newStaff) async {
    final db = await database;
    if(_existStaff(newStaff)==false){
      return null;
    }else {
      final res = await db.insert('Staffs', newStaff.toJson());
      return res;
    }
    }
  Future<bool> _existStaff(StaffModel existstaff) async {
    final db = await database;
    String id = existstaff.staffid;
    final res = await db.rawQuery("select $id from Staffs");
    if (res.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
  static Future<List<Map<String, dynamic>>> getStaffData()async{
    return await _database.rawQuery("select * from Staffs");
  }

  //---------------------------notes section-----------------------



//-------------------leads Details section----------------------------------------//
  Future<List<Reminders>> getReminders(LeadsModel model) async {
    final Database db = await database;
    String id=model.id;
    final List<Map<String, dynamic>> maps = await db.rawQuery("Select * from Reminders where id=$id");
    return List.generate(maps.length, (i) {
      return Reminders(
        assigned: maps[i]['assigned'],
        id: maps[i]['id'],
        dateCreated: maps[i]['dateCreated'],
        content: maps[i]['content'],
      );
    });
  }
  insertReminder(Reminders newReminder) async {
    final db = await database;
    final res = await db.insert('Reminders', newReminder.toMap());
    return res;

  }
  Future<List<NotesList>> getLeadNotes(LeadsModel model) async {
    final Database db = await database;
    String id=model.id;
    final List<Map<String, dynamic>> maps = await db.rawQuery("Select * from LeadsNotes where id=$id");
    return List.generate(maps.length, (i) {
      return NotesList(
        assigned: maps[i]['assigned'],
        id: maps[i]['id'],
        dateCreated: maps[i]['dateCreated'],
        content: maps[i]['content'],
      );
    });
  }
  insertLeadNotes(NotesList newNote) async {
    final db = await database;
    final res = await db.insert('LeadsNotes', newNote.toMap());
    return res;

  }
  Future<List<ProposalModel>> getProposals(LeadsModel model) async {
    final Database db = await database;
    String id = model.id;
    final List<Map<String, dynamic>> maps = await db.rawQuery(
        "Select * from LeadProposals where id=$id");
    return List.generate(maps.length, (i) {
      return ProposalModel(
        proposalid: maps[i]["proposalid"],
        customer_id:maps[i][" customer_id"],
        id: maps[i]["id"],
        subject: maps[i]["subject"],
        status: maps[i]["status"],
        assigned: maps[i]["assigned"],
        relatedto: maps[i]["relatedto"],
        leadname: maps[i]["leadname"],
        tolead: maps[i]["tolead"],
        address:maps[i]["address"],
        city: maps[i]["city"],
        state: maps[i]["state"],
        country: maps[i]["country"],
        zipcode: maps[i]["zipcode"],
        email: maps[i]["email"],
        phone: maps[i]["phone"],
        dateCreated: maps[i]["dateCreated"],
        fromdate: maps[i]["fromdate"],
        opentill: maps[i]["opentill"],
        currency: maps[i]["currency"],
        discounttype: maps[i]["discounttype"],
        tags: maps[i]["tags"],
        total: maps[i]["total"],
      );
    });
  }
  insertProposal(ProposalModel newProposal) async {
    final db = await database;
    final res = await db.insert('LeadProposals', newProposal.toMap());
    return res;

  }
  Future<List<TasksModel>> getLeadTasks(LeadsModel model) async {
    final Database db = await database;
    String id=model.id;
    final List<Map<String, dynamic>> maps = await db.rawQuery("Select * from LeadTasks where id=$id");
    return List.generate(maps.length, (i) {
      return TasksModel(
          assigned: maps[i]['assigned'],
          id: maps[i]['id'],
          startDate: maps[i]['startDate'],
          dueDate: maps[i]['dueDate'],
          subject: maps[i]['subject'],
          hourlyRate: maps[i]['hourlyRate'],
          dateCreated: maps[i]['dateCreated'],
          description: maps[i]['description'],
          priority: maps[i]['priority']

      );
    });
  }
  addLeadTask(TasksModel newTask) async {
    final db = await database;
    final res = await db.insert('LeadTasks', newTask.toMap());
    return res;
  }

}

