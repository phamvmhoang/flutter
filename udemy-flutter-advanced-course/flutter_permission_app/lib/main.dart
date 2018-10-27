import 'package:flutter/material.dart';
import 'package:simple_permissions/simple_permissions.dart';

void main() {
  runApp( MaterialApp(
    home:  MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> {

  String _status;
  Permission _permission;


  @override
  void initState() {
    super.initState();
    _status = 'Select an item';
    print(Permission.values);
  }

  void _requestPermission() async {
    PermissionStatus rs = await SimplePermissions.requestPermission(_permission);
    print('Permission status is $rs');
    setState(() {
      _status = rs.toString();
    });
  }

  void _checkPermission() async{
    bool rs = await SimplePermissions.checkPermission(_permission);
    print('Persmission result is $rs');
    setState(() {
      _status = rs.toString();
    });
  }


  void _getPermissionStatus() async{
    PermissionStatus rs = await SimplePermissions.getPermissionStatus(_permission);
    print('Permission status is $rs');
    setState(() {
      _status = rs.toString();
    });
  }

  void _onDropwdownChange(Permission permission) {
    setState(() {
      _permission = permission;
      _status = 'Click Button';
    });
    print('Seletted Permission: $_permission');
  }

  List<DropdownMenuItem<Permission>>  _getDropdownItem(){
    List<DropdownMenuItem<Permission>> items = List<DropdownMenuItem<Permission>>();
    Permission.values.forEach( (p) {
      items.add(DropdownMenuItem(
          child: Text(getPermissionString(p)),
          value: p
      ));
    });
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        title:  Text('Flutter Permission Sample'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_status),
              DropdownButton(
                  items: _getDropdownItem(),
                  onChanged: _onDropwdownChange,
                  value: _permission,
              ),
              RaisedButton(onPressed: _requestPermission, child: Text('Request Permission')),
              RaisedButton(onPressed: _checkPermission, child: Text('Check Permission')),
              RaisedButton(onPressed: _getPermissionStatus, child: Text('Get Status')),
              RaisedButton(onPressed: SimplePermissions.openSettings, child: Text('Open Setting'))
            ],
          ),
        ),
      ),
    );
  }
}