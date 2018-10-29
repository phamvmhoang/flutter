import 'package:flutter/material.dart';
import 'dart:async';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:contacts_service/contacts_service.dart';


Permission getPermissionFromString(String value){
  Permission permission;
  for (Permission item in Permission.values) {
    if(item.toString() == value){
      permission = item;
      break;
    }
  }
  return permission;
}

void main() async {

  await SimplePermissions.requestPermission(getPermissionFromString('Permission.ReadContacts'));
  await SimplePermissions.requestPermission(getPermissionFromString('Permission.WriteContacts'));

  runApp( MaterialApp(
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> {

  final GlobalKey<ScaffoldState> _scalffold = GlobalKey<ScaffoldState>();

  void _onCreate() async {

    Contact contact = Contact(
      familyName: 'Pham',
      givenName: 'Lam',
      emails: <Item>[
        Item(label: 'Work', value: 'phamvmhoang@gmail.com'),
        Item(label: 'Home', value: 'pvmhoang@gmail.com'),
      ],
    );
    await ContactsService.addContact(contact);
    _showSnackBar('Create Contact');

  }

  void _onRead() async {
    Iterable<Contact> contacts = await ContactsService.getContacts(query: 'Lam');
    Contact contact = contacts.elementAt(0);
    _showSnackBar('${contact.familyName}  has email ${contact.emails.elementAt(0).value}');
  }

  void _onFind() async {
    Iterable<Contact> contacts = await ContactsService.getContacts(query: 'Lam');
    _showSnackBar('There is ${contacts.length} people with give name is Lam');
  }

  void _onDelete() async {
    Iterable<Contact> contacts = await ContactsService.getContacts(query: 'Lam');
    String name =contacts.elementAt(0).givenName;
    await ContactsService.deleteContact(contacts.elementAt(0));
    _showSnackBar('Contact with name: ${name} has been deeted.');
  }

  void _showSnackBar(String message) {
    _scalffold.currentState.showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scalffold,
      appBar:  AppBar(
        title:  Text('Flutter Contact Sample'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('Contacts'),
              RaisedButton(onPressed: _onCreate, child: Text('Create')),
              RaisedButton(onPressed: _onFind, child: Text('Find')),
              RaisedButton(onPressed: _onRead, child: Text('Read')),
              RaisedButton(onPressed: _onDelete, child: Text('Delete')),
              RaisedButton(onPressed: SimplePermissions.openSettings, child: Text('Open Setting')),
            ],
          ),
        ),
      ),
    );
  }
}
