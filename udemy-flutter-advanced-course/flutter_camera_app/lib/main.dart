import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'package:camera/camera.dart';
import 'package:simple_permissions/simple_permissions.dart';

List<CameraDescription> cameras;

Permission getPermissionFromString(String value){
  Permission permission;
  Permission.values.forEach((Permission item){
    if(item.toString() == value){
      permission = item;
      return;
    }
  });
  return permission;
}

void main() async {

  cameras = await availableCameras();
  await SimplePermissions.requestPermission(getPermissionFromString('Permission.WriteExternalStorage'));
  await SimplePermissions.requestPermission(getPermissionFromString('Permission.Camera'));

  runApp( MaterialApp(
    home:  MyApp(),
  ));

}

class MyApp extends StatefulWidget {
  @override
  _State createState() =>  _State();
}

class _State extends State<MyApp> {

  CameraController cameraController;
  final GlobalKey<ScaffoldState> _scaffoldStateKey = GlobalKey<ScaffoldState>();
  Permission cameraPermission;
  Permission storagePermission;


  @override
  void initState() {
    super.initState();
    cameraController = CameraController(cameras[0], ResolutionPreset.medium);
    cameraController.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {
        // TODO
      });
    });
    cameraPermission = getPermissionFromString('Permission.WriteExternalStorage');
    storagePermission =  getPermissionFromString('Permission.Camera');

  }

  Future<String> saveImage() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    String filePath = '/storage/emulated/0/Pictures/${fileName}.jpg';

    if(cameraController.value.isTakingPicture) return null;
    try{
      await cameraController.takePicture(filePath);
    } on CameraException catch(e){
      showInSnackBar(e.toString());
    }
  }

  void takePicture() async {
    bool hasCameraPermision = await SimplePermissions.checkPermission(cameraPermission);
    bool hasStoragePermision = await SimplePermissions.checkPermission(storagePermission);

    if(!hasCameraPermision && !hasStoragePermision){
      showInSnackBar('No Permission');
      return;
    }

    saveImage().then((String filePath) {
      if(mounted && filePath != null) showInSnackBar("File has been saved at $filePath");
    });


  }

  void showInSnackBar(String message) {
    _scaffoldStateKey.currentState.showSnackBar(new SnackBar(content: new Text(message)));
  }


  @override
  void dispose() {
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldStateKey,
      appBar:  AppBar(
        title:  Text('Flutter Camera Sample'),
      ),
      body:  Container(
        padding:  EdgeInsets.all(32.0),
        child:  Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: <Widget>[
                   RaisedButton(onPressed: takePicture, child: Text('Take a picture')),
                   RaisedButton(onPressed: SimplePermissions.openSettings, child: Text('Settings')),
                 ],
               ),
              AspectRatio(
                aspectRatio: 1.0,
                child: CameraPreview(cameraController)
              )
            ],
          ),
        ),
      ),
    );
  }
}