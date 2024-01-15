import 'package:docs_reader/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
    bool isGranted = false;
 

    checkPermission()async{
     if(await Permission.storage.request().isGranted){
      try {
        isGranted = true;
        // var systemInfo = await SystemChannels.platform.invokeMethod('SystemNavigator.systemFeatures');
        // if (systemInfo.contains('android')) {
          // var statFsData = await const MethodChannel('samples.flutter.dev/statfs').invokeMethod('getStatFs', {'path': '/'});
          // internalStorageAvailableGB = statFsData['available'] / 1024 / 1024 / 1024;
          // internalStorageTotalSpace = statFsData['total'] / 1024 / 1024 / 1024;
        //   final appDir = await getApplicationDocumentsDirectory();
        // final statInternal = await FileStat.stat(appDir.path);
        //  internalStorageAvailableGB = statInternal.size / 1024 / 1024 / 1024;
        // internalStorageTotalSpace = statInternal.size / 1024 / 1024 / 1024;
        // if(internalStorageTotalSpace.isFinite){
        //   internalStorageAvailableGB = internalStorageAvailableGB.clamp(0, internalStorageTotalSpace);
        // }else {
        //   internalStorageTotalSpace = 1;
        // }
        // }
        // final externalStorageDir = await getExternalStorageDirectory();
        //  final externalStorageDir = await getExternalStorageDirectory();
        // if (externalStorageDir != null) {
        //   final statExternal = await FileStat.stat(externalStorageDir.path);
        //   sdCardAvailableGB = statExternal.size / 1024 / 1024 / 1024;
        //   sdCardTotalSpace = statExternal.size / 1024 / 1024 / 1024;
        // }
        // print({'total':internalStorageTotalSpace,'available':internalStorageAvailableGB, 'sd':sdCardAvailableGB, 'sd tot': sdCardTotalSpace});

        setState(() {});
      } on PlatformException {
        print('error Occured while granting permission');
      }
     } else {
      print('permission is not granted');
     }
      // final appDir = await getApplicationDocumentsDirectory(); 
   
    }

    requestPermission()async{
      final status = await Permission.storage.request(); 
      return status;
    }


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer(Duration(seconds: 1), () { 
    //   Navigator.push(context, MaterialPageRoute(builder: (_)=> HomeScreen()));
    // });
    checkPermission();
  }



  @override
  Widget build(BuildContext context) {
    return isGranted ?  const HomeScreen() : Scaffold(backgroundColor: Colors.blueGrey.shade800, 
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text('Please Allow Location in settings.Close and run app after Giving permission', style: TextStyle(color: Colors.white, fontSize: 17),)), 
                    TextButton(onPressed: ()async{
                       await openAppSettings();
                        checkPermission();
                        setState(() {
                          isGranted ;
                        });
                    },style: TextButton.styleFrom(
                      backgroundColor: Colors.grey, 
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12), 
                        side: const BorderSide(color: Colors.white)
                      )
                    ),
                     child: const Text('Retry', style: TextStyle(color: Colors.black),))
                  ],
                ),
              ),);
  }
}