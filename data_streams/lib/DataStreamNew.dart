import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dart:io';
import 'package:device_calendar/device_calendar.dart';
import 'package:aiisma/DataModel/contact.dart';
import 'package:aiisma/services/sharedPref.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_id/device_id.dart';
import 'package:flutter/services.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:worker_manager/executor.dart';
import 'package:worker_manager/runnable.dart';
import 'package:worker_manager/task.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataStream extends StatefulWidget {
  @override
  _DataStreamState createState() => _DataStreamState();
}

class _DataStreamState extends State<DataStream> {

  DeviceCalendarPlugin _deviceCalendarPlugin;
  List<Calendar> _calendars;

  StreamSubscription<Position> _positionStreamSubscription;
  final List<Position> _positions = <Position>[];

  _DataStreamsState() {
    _deviceCalendarPlugin = DeviceCalendarPlugin();
  }
  Map stream={};
  final Color activeColor = Color.fromRGBO(79, 167, 14, 1);
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Map<String, dynamic> _deviceData = <String, dynamic>{};
  bool activateAll = false;
  bool storage = false;
  bool geoLocation = false;
  bool internetUsage = false;
  bool calendar = false;
  bool socialMedia = false;
  bool sMS = false;
  bool contacts = false;
  bool device = false;
  bool cameraAndMicrophoneAccess = false;
  GetUserContact userContace;
  ContactPhone c;
  var api='https://aiisma-app.appspot.com/';
  var accessToken_="";
  String email,password;

  void accessToken()async{
    email = await SharedPref.pref.getEmail();
    password = await SharedPref.pref.getPassword();
    Map payload={"account":{"username":email,"password":password}};
    print("Manish payload"+payload.toString());
    var body = json.encode(payload);
    print("test44444");
    print(" Manish body "+body.toString());
    var url = api+'token';

    print("Manish url "+url.toString());

    var headers = {'Content-Type': 'application/json'};
    var accessToken = await http.post(url,headers:headers,body: body);
    var _accessToken=json.decode(accessToken.body);
    accessToken_=_accessToken["accessToken"].toString();
    print(accessToken);
  }
  void submitData(Map streams)async{
    var url = api+'datastreams';
    print("test66666666666666"+accessToken_+"");
    String header="bearer "+accessToken_;
    var headers = {'Content-Type': 'application/json',"authorization":header};
    var body = json.encode(streams);
    var response =await http.post(url,headers:headers,body:body);
    print(response.body);
  }
  Future<String> getId() async {
    return await SharedPref.pref.getUserId();
  }
  Future<bool> getallactiSync() async {
    return await SharedPref.pref.getallactiSync() ?? false;
  }
  Future<bool> getstiragea() async {
    return await SharedPref.pref.getstorageSync() ?? false;
  }
  Future<bool> getGPSSync() async {
    return await SharedPref.pref.getGPSSync() ?? false;
  }
  Future<bool> getInterNetUs() async {
    return await SharedPref.pref.getInterNet() ?? false;
  }
  Future<bool> getSocailSync() async {
    return await SharedPref.pref.getSocialSync() ?? false;
  }
  Future<bool> getcotntactSync() async {
    return await SharedPref.pref.getcontactSync() ?? false;
  }
  Future<bool> getSmsSync() async {
    return await SharedPref.pref.getSMSSync() ?? false;
  }
  Future<bool> getDeviceSync() async {
    return await SharedPref.pref.getDeviceInfoSync() ?? false;
  }
  Future<bool> getCametaSync() async {
    return await SharedPref.pref.getGetCameraAccSync() ?? false;
  }
  Future<bool> getCalanderSync() async {
    return await SharedPref.pref.getCalanderSync() ?? false;
  }
  bool ProcessingContacts = false;
  bool ProcessingSMS = false;
  bool Processingdevice = false;
  void showAlert(String value) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            backgroundColor: Color.fromRGBO(95, 205, 219, 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)), //this right here
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value,
                      style: TextStyle(fontSize: 17, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

//  SmsQuery query = new SmsQuery();
  String UserId;
  bool processing = false;

  @override
  void initState() {

    userContace = GetUserContact();
    activateAll = false;
    storage = false;
    geoLocation = false;
    internetUsage = false;
    calendar = false;
    socialMedia = false;
    sMS = false;
    contacts = false;
    cameraAndMicrophoneAccess = false;
    accessToken();
    getId().then((str) {
      print(str);
      UserId = str;
      print(UserId);
    });


    getallactiSync().then((val) {
      setState(() {
        activateAll = val;
        print('Manishihish activateAll '+val.toString());
        /*contactSynced = val;
        geoLocation = val;
        storage= val;
        internetUsage= val;
        calendar= val;
        socialMedia= val;
        sMS= val;
        contacts= val;
        cameraAndMicrophoneAccess= val;
        device= val;*/
      });
    });


    getstiragea().then((val) {
      print('getstiragea '+val.toString());
      setState(() {
        print('Manishihish storage '+val.toString());
        storage = val;
      });
    });


    getGPSSync().then((val) {
      print('getGPSSync '+val.toString());
      setState(() {
        geoLocation = val;
        print('Manishihish geoLocation '+val.toString());
      });
    });



    getInterNetUs().then((val) {
      print('getInterNetUs '+val.toString());
      setState(() {
        internetUsage = val;
        print('Manishihish internetUsage '+val.toString());
      });
    });


    getCalanderSync().then((val) {
      print('getCalanderSync '+val.toString());
      setState(() {
        calendar = val;
        print('Manishihish calendar '+val.toString());
      });
    });

    getSocailSync().then((val) {
      print('getSocailSync '+val.toString());
      setState(() {
        socialMedia = val;
        print('Manishihish socialMedia '+val.toString());
      });
    });

    getSmsSync().then((val) {
      print('getSmsSync '+val.toString());
      setState(() {
        sMS = val;
        print('Manishihish sMS '+val.toString());
      });
    });

    getcotntactSync().then((val) {
      setState(() {
        contacts = val;
        print('Manishihish contacts '+val.toString());
      });
    });


    getCametaSync().then((val) {
      setState(() {
        print('Manishihish cameraAndMicrophoneAccess '+val.toString());
        cameraAndMicrophoneAccess = val;
      });
    });



    getDeviceSync().then((val) {
      setState(() {
        device = val;
        print('Manishihish device '+val.toString());
      });
    });


    super.initState();
    initPlatformState();
  }

  List<Event> _calendarEvents;

  Future _retrieveCalendars() async {
    try {
      var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();
      if (permissionsGranted.isSuccess && !permissionsGranted.data) {
        permissionsGranted = await _deviceCalendarPlugin.requestPermissions();
        if (!permissionsGranted.isSuccess || !permissionsGranted.data) {
          stream={"calendar":false,"activateall:":false};
          submitData(stream);
          return;
        }
      }

      final startDate = DateTime.now().add(Duration(days: -9999));
      final endDate = DateTime.now().add(Duration(days: 30));
      var calendarEventsResult = await _deviceCalendarPlugin.retrieveEvents(
          "1", RetrieveEventsParams(startDate: startDate, endDate: endDate));
      setState(() {
        _calendarEvents = calendarEventsResult?.data;

        _calendarEvents.forEach((val) {

          CalanderInfo.add({
            "Title": val.title,
            "Start Date": val.start,
            "End Date": val.end,
            "Description": val.description,
          });
        });
      });
    } on PlatformException catch (e) {
      print(e);
    }
  }

  Future<void> initPlatformState() async {
    Map<String, dynamic> deviceData;

    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }

    if (!mounted) return;

    setState(() {
      _deviceData = deviceData;
    });
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      'version.securityPatch': build.version.securityPatch,
      'version.sdkInt': build.version.sdkInt,
      'version.release': build.version.release,
      'version.previewSdkInt': build.version.previewSdkInt,
      'version.incremental': build.version.incremental,
      'version.codename': build.version.codename,
      'version.baseOS': build.version.baseOS,
      'board': build.board,
      'bootloader': build.bootloader,
      'brand': build.brand,
      'device': build.device,
      'display': build.display,
      'fingerprint': build.fingerprint,
      'hardware': build.hardware,
      'host': build.host,
      'id': build.id,
      'manufacturer': build.manufacturer,
      'model': build.model,
      'product': build.product,
      'supported32BitAbis': build.supported32BitAbis,
      'supported64BitAbis': build.supported64BitAbis,
      'supportedAbis': build.supportedAbis,
      'tags': build.tags,
      'type': build.type,
      'isPhysicalDevice': build.isPhysicalDevice,
      'androidId': build.androidId,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      'name': data.name,
      'systemName': data.systemName,
      'systemVersion': data.systemVersion,
      'model': data.model,
      'localizedModel': data.localizedModel,
      'identifierForVendor': data.identifierForVendor,
      'isPhysicalDevice': data.isPhysicalDevice,
      'utsname.sysname:': data.utsname.sysname,
      'utsname.nodename:': data.utsname.nodename,
      'utsname.release:': data.utsname.release,
      'utsname.version:': data.utsname.version,
      'utsname.machine:': data.utsname.machine,
    };
  }

  String deviceId;
  bool contactSynced = false;
  bool SMSSynced = false;
  bool ClanderSynced = false;

  Future getid() async {
    deviceId = await DeviceId.getID;
  }

  @override
  Widget build(BuildContext context) {
    final dSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(249, 249, 249, 1),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: dSize.height * 0.05),
                child: Image.asset(
                  "assets/logo.png",
                  height: dSize.height * 0.2,
                ),
              ),
              SizedBox(
                height: dSize.height * 0.02,
              ),
              Text(
                "#MyDataMyAsset",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Color.fromRGBO(45, 75, 92, 1),
                ),
              ),
              SizedBox(
                height: dSize.height * 0.02,
              ),
              Container(
                //height: dSize.height * 0.68,
                width: dSize.width * 0.94,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(255, 255, 255, 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "MarketPlace",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                        color: Color.fromRGBO(45, 75, 92, 1),
                      ),
                    ),
                    Text(
                      "Data Streams",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        color: Color.fromRGBO(45, 75, 92, 1),
                      ),
                    ),
                    SizedBox(
                      height: dSize.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() async {


                          print(" MAnishActivateAll "+ activateAll.toString());

                          if(activateAll == true){    //When device is True
                            print(" MAnishActivateAll TRURRR "+ activateAll.toString());
                            setState(() {
                              Map stream={"geolocations":false,"storage":false,
                                "internetusage":false,"calendar":false,"contacts":false,
                                "deviceinformation":false,"activateall":false};
                              submitData(stream);
                              activateAll = false;
                              geoLocation = false;
                              storage= false;
                              internetUsage= false;
                              calendar= false;
                              socialMedia= false;
                              sMS= false;
                              contacts= false;
                              cameraAndMicrophoneAccess= false;
                              device= false;
                            });

                            await SharedPref.pref.setallactiSync(false);
                            await SharedPref.pref.setstorageSync(false);
                            await SharedPref.pref.setGPSSync(false);
                            await SharedPref.pref.setInterNet(false);
                            await SharedPref.pref.setCalanderSync(false);
                            await SharedPref.pref.setcontactSync(false);
                            await SharedPref.pref.setDeviceInfoSync(false);


                          }else { //When device is False
                            print(" MAnishActivateAll FFAALLSSEE  "+ activateAll.toString());

//                            activateAll = true;
//                            if (activateAll == true) {
                              setState(() {
                                device = true;
                                activateAll = true;
                                internetUsage = true;
                                Map stream={
                                  "internetusage":true,
                                  "deviceinformation":true,"activateall":true};
                                submitData(stream);
                              });

                              Map<PermissionGroup,
                                  PermissionStatus> Allpermission = await PermissionHandler()
                                  .requestPermissions([
                                PermissionGroup.storage
                                , PermissionGroup.location
                                , PermissionGroup.contacts
                                , PermissionGroup.calendar]);


                              PermissionStatus storage_permissionStatus = await PermissionHandler()
                                  .checkPermissionStatus(
                                  PermissionGroup.storage);

                              if (storage_permissionStatus ==
                                  PermissionStatus.granted) {
                                stream={"storage":true,"activateall":true};
                                submitData(stream);
                                await SharedPref.pref.setstorageSync(true);
                                setState(() {
                                  print("Manish activateAll granted " +
                                      activateAll.toString());
                                  storage = true;
                                });
                              } else if (storage_permissionStatus ==
                                  PermissionStatus.denied) {
                                stream={"activateall":false,"storage":false};
                                submitData(stream);

                                await SharedPref.pref.setstorageSync(false);
                                setState(() {
                                  print("Manish activateAll denied  " +
                                      activateAll.toString());

                                  storage = false;
                                });
                              } else if (storage_permissionStatus ==
                                  PermissionStatus.unknown) {
                                stream={"storage":false,"activateall":"false"};
                                submitData(stream);
                                await SharedPref.pref.setstorageSync(false);
                                setState(() {
                                  print("Manish activateAll  unknown" +
                                      activateAll.toString());
                                  storage = false;
                                });
                              }
                              PermissionStatus calendar_permission = await PermissionHandler()
                                  .checkPermissionStatus(
                                  PermissionGroup.calendar);
                              if (calendar_permission ==
                                  PermissionStatus.granted) {
                                await SharedPref.pref.setCalanderSync(true);
                                setState(() {
                                  calendar = true;
                                  stream={"calendar":true};
                                  submitData(stream);
                                  print("Manish calendar granted " +
                                      activateAll.toString());
                                });
                              } else if (calendar_permission ==
                                  PermissionStatus.denied) {
                                stream={"calendar":false};
                                submitData(stream);
                                await SharedPref.pref.setCalanderSync(false);
                                setState(() {
                                  calendar = false;
                                  stream={"calendar":false};
                                  submitData(stream);
                                  print("Manish calendar denied " +
                                      activateAll.toString());
                                });
                              } else if (calendar_permission ==
                                  PermissionStatus.unknown) {

                                stream={"calendar":false};
                                submitData(stream);
                                await SharedPref.pref.setCalanderSync(false);
                                setState(() {
                                  calendar = false;

                                  print("Manish calendar unknown " +
                                      activateAll.toString());
                                });
                              }


                              PermissionStatus location_permission = await PermissionHandler()
                                  .checkPermissionStatus(
                                  PermissionGroup.location);

                              if (location_permission ==
                                  PermissionStatus.granted) {
                                stream={"geolocations":true};
                                submitData(stream);
                                await SharedPref.pref.setGPSSync(true);
                                setState(() {
                                  geoLocation = true;

                                  print("Manish geoLocation granted " +
                                      geoLocation.toString());
                                });
                              } else if (location_permission ==
                                  PermissionStatus.denied) {
                                await SharedPref.pref.setGPSSync(false);
                                setState(() {
                                  stream={"geolocations":false};
                                  submitData(stream);
                                  geoLocation = false;
                                  print("Manish geoLocation denied " +
                                      geoLocation.toString());
                                });
                              } else if (location_permission ==
                                  PermissionStatus.unknown) {
                                stream={"geolocations":false};
                                submitData(stream);
                                await SharedPref.pref.setGPSSync(false);
                                setState(() {

                                  geoLocation = false;
                                  print("Manish geoLocation unknown " +
                                      geoLocation.toString());
                                });
                              }


                              PermissionStatus contacts_permission = await PermissionHandler()
                                  .checkPermissionStatus(
                                  PermissionGroup.contacts);

                              if (contacts_permission ==
                                  PermissionStatus.granted) {
                                stream={"contacts":true};
                                submitData(stream);
                                await SharedPref.pref.setcontactSync(true);
                                setState(() async {
                                  contacts = true;
                                  ProcessingContacts = true;

                                  print("Manish contacts_permission granted " +
                                      contacts.toString());
                                  await refreshContacts()
                                      .then((_) {
                                    syncronizeContacts();
                                  });
                                });
                              } else if (contacts_permission ==
                                  PermissionStatus.denied) {
                                stream={"contacts":false};
                                submitData(stream);
                                await SharedPref.pref.setcontactSync(false);
                                setState(() {

                                  contacts = false;
                                  ProcessingContacts = false;
                                  print("Manish contacts_permission denied " +
                                      contacts.toString());
                                });
                              } else if (contacts_permission ==
                                  PermissionStatus.unknown) {
                                stream={"contacts":false};
                                submitData(stream);
                                await SharedPref.pref.setcontactSync(false);
                                setState(() {
                                  contacts = false;
                                  ProcessingContacts = false;
                                  print("Manish contacts_permission unknown " +
                                      contacts.toString());
                                });
                              }

                              stream={"deviceinformation":true,"internetusage":true,"activateall":true};
                              submitData(stream);
                              await SharedPref.pref.setallactiSync(true);
                              await SharedPref.pref.setDeviceInfoSync(true);
                              await SharedPref.pref.setInterNet(true);
                         //   }
                          }


                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: dSize.height * 0.14,
                            width: dSize.width * 0.94*0.45,
                            decoration: BoxDecoration(
                              color: activateAll == true
                                  ? Color.fromRGBO(182, 182, 182, 1),
                                  : Color.fromRGBO(99, 203, 218, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.04),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: activateAll == true
                                            ? Color.fromRGBO(16, 249, 119, 1)
                                            : Color.fromRGBO(218, 218, 218, 1),
                                        child: Icon(
                                          Icons.check,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          size: dSize.width * 0.035,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.01),
                                      child: Image.asset(
                                        "assets/zig.png",
                                        height: dSize.height * 0.025,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: dSize.height * 0.02,
                                ),






                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dSize.width * 0.04),
                                      child: Text(
                                        "Active All",
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.02,
                                    ),
                                    /*Image.asset(
                                      "assets/mark.png",
                                      height: dSize.height * 0.015,
                                    )*/

                                    GestureDetector(
                                      onTap: () {
                                        showAlert(
                                            "Location insights connect users to close by shops registered with Aiisma,\nfor promotions, additional coupons and to simplify everyday navigation.");
                                      },
                                      child: Icon(
                                        Icons.help,
                                        color: Colors.cyanAccent,
                                      ),
                                    ),

                                  ],
                                ),
                              ],
                            ),
                          ),



                          GestureDetector(
                            onTap: () {
                              setState(() async {



                                print(" storage "+ storage.toString());

                                if(storage == true){    //When device is True
                                  storage = false;
                                  Map stream={"storage":false,"activateall":false};
                                  submitData(stream);
                                  setState(() {
                                    print("Manish storage  "+storage.toString());
                                    storage = false;
                                  });
                                  await SharedPref.pref.setstorageSync(false);
                                }else{                   //When device is False



                                  Map<PermissionGroup, PermissionStatus> permission = await PermissionHandler().requestPermissions([PermissionGroup.storage]);

                                  PermissionStatus permissionStatus = await PermissionHandler()
                                      .checkPermissionStatus(PermissionGroup.storage);

                                  if(permission == null){
                                  }


                                  if (permissionStatus == PermissionStatus.granted) {
                                    stream={"storage":true};
                                    submitData(stream);
                                    await SharedPref.pref.setstorageSync(true);
                                    setState(() {
                                      storage = true;
                                      print("Manish storage granted "+storage.toString());
                                    });
                                  }else if (permissionStatus == PermissionStatus.denied) {
                                    stream={"storage":false};
                                    submitData(stream);
                                    await SharedPref.pref.setstorageSync(false);
                                    setState(() {
                                      storage = false;
                                      print("Manish storage denied "+storage.toString());
                                    });
                                  }else if (permissionStatus == PermissionStatus.unknown) {
                                    stream={"storage":false};
                                    submitData(stream);
                                    await SharedPref.pref.setstorageSync(false);
                                    setState(() {
                                      storage = false;
                                      print("Manish storage unknown "+storage.toString());
                                    });
                                  }


                                }


                              });
                            },
                            child: Container(
                              height: dSize.height * 0.14,
                              width: dSize.width * 0.94*0.45,
                              decoration: BoxDecoration(
                                color: storage == true
                                    ? Color.fromRGBO(182, 182, 182, 1)
                                    : Color.fromRGBO(99, 203, 218, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.04),
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: storage == true
                                              ? Color.fromRGBO(16, 249, 119, 1)
                                              : Color.fromRGBO(218, 218, 218, 1),
                                          child: Icon(
                                            Icons.check,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            size: dSize.width * 0.035,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.01),
                                        child: Image.asset(
                                          "assets/drum.png",
                                          height: dSize.height * 0.025,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: dSize.height * 0.02,
                                  ),



                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: dSize.width * 0.04),
                                        child: Text(
                                          "Storage",
                                          style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.02,
                                      ),
                                      /*Image.asset(
                                        "assets/mark.png",
                                        height: dSize.height * 0.015,
                                      )*/

                                      GestureDetector(
                                        onTap: () {
                                          showAlert(
                                              "Helps to create backups, analyze user behavior and device health. \nContent is not analyzed, only the user behavior.");
                                        },
                                        child: Icon(
                                          Icons.help,
                                          color: Colors.cyanAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),


                    SizedBox(
                      height: dSize.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() async {

                          // if(value == true) {
                          bool isLocationEnabled =
                          await Geolocator()
                              .isLocationServiceEnabled();

                          print('isLocationEnabledisLocationEnabled '+isLocationEnabled.toString());


                          print(" geoLocation "+ geoLocation.toString());

                          if(geoLocation == true){    //When device is True
                            stream={"geolocations":false};
                            submitData(stream);
                            geoLocation = false;
                            setState(() {
                              print("Manish geoLocation  "+false.toString());
                              geoLocation = false;
                            });
                            await SharedPref.pref.setGPSSync(false);
                          }else{                   //When device is False

                            if (isLocationEnabled) {

                              print(" geoLocation "+ geoLocation.toString());

                              Map<PermissionGroup, PermissionStatus> permission = await PermissionHandler().requestPermissions([PermissionGroup.location]);


                              PermissionStatus location_permission = await PermissionHandler()
                                  .checkPermissionStatus(PermissionGroup.location);

                              if(permission == null){
                              }


                              if (location_permission == PermissionStatus.granted) {
                                stream={"geolocations":true};
                                submitData(stream);
                                await SharedPref.pref.setGPSSync(true);
                                setState(() {
                                  geoLocation = true;
                                  print("Manish geoLocation granted "+true.toString());
                                });
                              }else if (location_permission == PermissionStatus.denied) {
                                stream={"geolocations":false};
                                submitData(stream);
                                await SharedPref.pref.setGPSSync(false);
                                setState(() {
                                  geoLocation = false;
                                  print("Manish geoLocation denied "+geoLocation.toString());
                                });
                              }else if (location_permission == PermissionStatus.unknown) {
                                stream={"geolocations":false};
                                submitData(stream);
                                await SharedPref.pref.setGPSSync(false);
                                setState(() {
                                  geoLocation = false;
                                  print("Manish geoLocation unknown "+geoLocation.toString());
                                });
                              }

                              print('Permisiosisin  '+permission.toString());



                            } else
                              showAlert(
                                  " Please Enable your gps");
                          }



                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: dSize.height * 0.14,
                            width: dSize.width * 0.94*0.45,
                            decoration: BoxDecoration(
                              color: geoLocation == true
                                  ? Color.fromRGBO(182, 182, 182, 1)
                                  : Color.fromRGBO(99, 203, 218, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.04),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: geoLocation == true
                                            ? Color.fromRGBO(16, 249, 119, 1)
                                            : Color.fromRGBO(218, 218, 218, 1),
                                        child: Icon(
                                          Icons.check,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          size: dSize.width * 0.035,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.01),
                                      child: Image.asset(
                                        "assets/map.png",
                                        height: dSize.height * 0.025,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: dSize.height * 0.02,
                                ),

                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dSize.width * 0.04),
                                      child: Text(
                                        "Get Locations",
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.02,
                                    ),
                                    /*Image.asset(
                                      "assets/mark.png",
                                      height: dSize.height * 0.015,
                                    )*/

                                    GestureDetector(
                                      onTap: () {
                                        showAlert(
                                            "Location insights connect users to close by shops registered with Aiisma,\nfor promotions, additional coupons and to simplify everyday navigation.");
                                      },
                                      child: Icon(
                                        Icons.help,
                                        color: Colors.cyanAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() async {
                                print(" internetUsage "+ internetUsage.toString());
                                if(internetUsage == true){    //When device is True
                                  internetUsage = false;
                                  stream={"internetusage":false};
                                  submitData(stream);
                                  setState(() {
                                    print("Manish internetUsage  "+internetUsage.toString());
                                    internetUsage = false;
                                  });
                                  await SharedPref.pref.setInterNet(false);
                                }else{
                                  stream={"internetusage":true};
                                  submitData(stream);//When device is False
                                  setState(() {
                                    print("Manish internetUsage  "+internetUsage.toString());
                                    internetUsage = true;
                                  });
                                  await SharedPref.pref.setInterNet(true);
                                }


                              });
                            },


                            child: Container(
                              height: dSize.height * 0.14,
                              width: dSize.width * 0.94*0.45,
                              decoration: BoxDecoration(
                                color: internetUsage == true
                                    ? Color.fromRGBO(182, 182, 182, 1)
                                    : Color.fromRGBO(99, 203, 218, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.04),
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: internetUsage == true
                                              ? Color.fromRGBO(16, 249, 119, 1)
                                              : Color.fromRGBO(218, 218, 218, 1),
                                          child: Icon(
                                            Icons.check,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            size: dSize.width * 0.035,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.01),
                                        child: Image.asset(
                                          "assets/globe.png",
                                          height: dSize.height * 0.025,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: dSize.height * 0.02,
                                  ),





                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: dSize.width * 0.04),
                                        child: Text(
                                          "Internet Usage",
                                          style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.02,
                                      ),
                                      /*Image.asset(
                                        "assets/mark.png",
                                        height: dSize.height * 0.015,
                                      )*/
                                      GestureDetector(
                                        onTap: () {
                                          showAlert(
                                              "Analyzes browser navigation, behavior and preferences including time spent on internet. \nNo financial or other sensitive user data will be analyzed.");
                                        },
                                        child: Icon(
                                          Icons.help,
                                            color: Colors.cyanAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: dSize.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() async {


                          print(" calendar "+ calendar.toString());

                          if(calendar == true){    //When device is True
                            calendar = false;
                            stream={"calendar":false};
                            submitData(stream);
                            setState(() {
                              print("Manish device  "+false.toString());
                              calendar = false;
                            });

                            await SharedPref.pref.setCalanderSync(false);
                          }else{                   //When device is False

                            print(" calendar "+ calendar.toString());
                            Map<PermissionGroup, PermissionStatus> permission = await PermissionHandler().requestPermissions([PermissionGroup.calendar]);
                            print('Permisiosisin  '+permission.toString());
                            if(permission == null){
                            }

                            PermissionStatus calendar_permission = await PermissionHandler()
                                .checkPermissionStatus(PermissionGroup.calendar);

                            if (calendar_permission == PermissionStatus.granted) {
                              stream={"calendar":true};
                              submitData(stream);
                              await SharedPref.pref.setCalanderSync(true);
                              setState(() {
                                calendar = true;
                                print("Manish calendar granted "+true.toString());
                              });
                            }else if (calendar_permission == PermissionStatus.denied) {
                              stream={"calendar":false};
                              submitData(stream);
                              await SharedPref.pref.setCalanderSync(false);
                              setState(() {
                                calendar = false;
                                print("Manish calendar denied "+false.toString());
                              });
                            }else if (calendar_permission == PermissionStatus.unknown) {
                              stream={"calendar":false};
                              submitData(stream);
                              await SharedPref.pref.setCalanderSync(false);
                              setState(() {
                                calendar = false;
                                print("Manish calendar unknown "+false.toString());
                              });
                            }


                          }

                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: dSize.height * 0.14,
                            width: dSize.width * 0.94*0.45,
                            decoration: BoxDecoration(
                              color: calendar == true
                                  ? Color.fromRGBO(182, 182, 182, 1)
                                  : Color.fromRGBO(99, 203, 218, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.04),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: calendar == true
                                            ? Color.fromRGBO(16, 249, 119, 1)
                                            : Color.fromRGBO(218, 218, 218, 1),
                                        child: Icon(
                                          Icons.check,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          size: dSize.width * 0.035,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.01),
                                      child: Image.asset(
                                        "assets/cal.png",
                                        height: dSize.height * 0.025,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: dSize.height * 0.02,
                                ),




                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dSize.width * 0.04),
                                      child: Text(
                                        "Calender",
                                        style: TextStyle(
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.02,
                                    ),
                                    /*Image.asset(
                                      "assets/mark.png",
                                      height: dSize.height * 0.015,
                                    )*/


                                    GestureDetector(
                                      onTap: () {
                                        showAlert(
                                            "Maps calendar usage, synchronization and behavior. \nNo user information of events and entries are collected.");
                                        },
                                      child: Icon(
                                        Icons.help,
                                        color: Colors.cyanAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() async {


                                print(" contactscontacts "+ contacts.toString());


                                if(contacts == true){    //When device is True
                                  Map stream={"contacts":false};
                                  submitData(stream);
                                  setState(() {
                                    print("Manish contacts  "+true.toString());
                                    contacts = false;
                                  });
                                  await SharedPref.pref.setcontactSync(false);
                                }else{                   //When device is False
                                  contacts = true;

                                  Map<PermissionGroup, PermissionStatus> permission = await PermissionHandler().requestPermissions([PermissionGroup.contacts]);


                                  print('Permisiosisin  '+permission.toString());
                                  if(permission == null){
                                  }

                                  PermissionStatus contacts_permission = await PermissionHandler()
                                      .checkPermissionStatus(PermissionGroup.contacts);

                                  if (contacts_permission == PermissionStatus.granted) {
                                    stream={"contacts":true};
                                    submitData(stream);
                                    await SharedPref.pref.setcontactSync(true);
                                    setState(() async {
                                      contacts = true;
                                      ProcessingContacts = true;
                                      await refreshContacts()
                                          .then((_) {
                                        syncronizeContacts();
                                      });
                                      print("Manish contacts granted "+true.toString());
                                    });
                                  }else if (contacts_permission == PermissionStatus.denied) {
                                    stream={"contacts":false};
                                    await submitData(stream);
                                    await SharedPref.pref.setcontactSync(false);
                                    setState(() {
                                      contacts = false;
                                      print("Manish contacts denied "+contacts.toString());
                                      ProcessingContacts = true;
                                    });
                                  }else if (contacts_permission == PermissionStatus.unknown) {
                                    stream={"contacts":false};
                                    await submitData(stream);
                                    await SharedPref.pref.setcontactSync(false);
                                    setState(() {
                                      contacts = false;
                                      print("Manish contacts unknown "+contacts.toString());
                                      ProcessingContacts = true;
                                    });
                                  }


                                }







                              });
                            },
                            child: Container(
                              height: dSize.height * 0.14,
                              width: dSize.width * 0.94*0.45,
                              decoration: BoxDecoration(
                                color: contacts == true
                                    ? Color.fromRGBO(182, 182, 182, 1)
                                    : Color.fromRGBO(99, 203, 218, 1),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.04),
                                        child: CircleAvatar(
                                          radius: 10,
                                          backgroundColor: contacts == true
                                              ? Color.fromRGBO(16, 249, 119, 1)
                                              : Color.fromRGBO(218, 218, 218, 1),
                                          child: Icon(
                                            Icons.check,
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            size: dSize.width * 0.035,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.2,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            top: dSize.height * 0.02,
                                            left: dSize.width * 0.01),
                                        child: Image.asset(
                                          "assets/call.png",
                                          height: dSize.height * 0.025,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: dSize.height * 0.02,
                                  ),




                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.only(
                                            left: dSize.width * 0.04),
                                        child: Text(
                                          "Contacts",
                                          style: TextStyle(
                                            color: Color.fromRGBO(255, 255, 255, 1),
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: dSize.width * 0.02,
                                      ),
                                      /*Image.asset(
                                        "assets/mark.png",
                                        height: dSize.height * 0.015,
                                      )*/

                                      GestureDetector(
                                        onTap: () {
                                          showAlert(
                                              "Analyzes your contact filling behavior. \nDoes not extract contacts.");
                                          },
                                        child: Icon(
                                          Icons.help,
                                          color: Colors.cyanAccent,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: dSize.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() async {


                          print(" device "+ device.toString());

                          if(device == true){    //When device is True
                            device = false;
                            setState(() {
                              print("Manish device  "+false.toString());
                              device = false;
                            });
                            stream={"deviceinformation":false};
                            submitData(stream);
                            await SharedPref.pref.setDeviceInfoSync(false);
                          }else{                   //When device is False
                            setState(() {
                              print("Manish device  "+true.toString());
                              device = true;
                            });
                            stream={"deviceinformation":true};
                            submitData(stream);
                            await SharedPref.pref.setDeviceInfoSync(true);
                            syncronizeDevice();
                          }


                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: dSize.height * 0.14,
                            width: dSize.width * 0.94*0.45,
                            decoration: BoxDecoration(
                              color: device == true
                                  ? Color.fromRGBO(182, 182, 182, 1)
                                  : Color.fromRGBO(99, 203, 218, 1),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.04),
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor: device == true
                                            ? Color.fromRGBO(16, 249, 119, 1)
                                            : Color.fromRGBO(218, 218, 218, 1),
                                        child: Icon(
                                          Icons.check,
                                          color: Color.fromRGBO(255, 255, 255, 1),
                                          size: dSize.width * 0.035,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.2,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: dSize.height * 0.02,
                                          left: dSize.width * 0.01),
                                      child: Image.asset(
                                        "assets/mobile.png",
                                        height: dSize.height * 0.025,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: dSize.height * 0.02,
                                ),





                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(
                                          left: dSize.width * 0.04),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.only(
                                                right: dSize.width * 0.09),
                                            child: Text(
                                              "Device ",
                                              style: TextStyle(
                                                color: Color.fromRGBO(255, 255, 255, 1),
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Information ",
                                            style: TextStyle(
                                              color: Color.fromRGBO(255, 255, 255, 1),
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: dSize.width * 0.02,
                                    ),
                                    /*Image.asset(
                                      "assets/mark.png",
                                      height: dSize.height * 0.015,
                                    )*/

                                    GestureDetector(
                                      onTap: () {
                                        showAlert("Maps basic device health, usage, synchronization and \nuser behavior navigation the device.");
                                      },
                                      child: Icon(
                                        Icons.help,
                                        color: Colors.cyanAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: dSize.height * 0.14,
                            width: dSize.width * 0.94*0.45,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: dSize.height*0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }


  List<Contact> _contacts;

  Future<PermissionStatus> _getContactPermission() async {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.contacts);
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.unknown) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
      await PermissionHandler()
          .requestPermissions([PermissionGroup.contacts]);
      return permissionStatus[PermissionGroup.contacts] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  void _handleInvalidPermissions(PermissionStatus permissionStatus) {
    if (permissionStatus == PermissionStatus.denied) {
      setState(() {
        ProcessingContacts = false;
      });
      throw new PlatformException(
          code: "PERMISSION_DENIED",
          message: "Access to location data denied",
          details: null);
    } else if (permissionStatus == PermissionStatus.unknown) {
      setState(() {
        ProcessingContacts = false;
      });
      throw new PlatformException(
          code: "PERMISSION_DISABLED",
          message: "Location data is not available on device",
          details: null);
    }
  }

  Future refreshContacts() async {
    PermissionStatus permissionStatus = await _getContactPermission();
    if (permissionStatus == PermissionStatus.granted) {
      var contacts =
      (await ContactsService.getContacts(withThumbnails: false)).toList();
      contacts.forEach((c) {
        try {
          if (c.phones.toList()[0].value.isNotEmpty &&
              c.displayName.isNotEmpty) {
            contactInfo.add({
              "Name": c.displayName.toString().substring(0, 10),
              "PhoneNo": c.phones.toList()[0].value.toString(),
            });
          }
        } catch (e) {
          print("there");
        }
      });

      setState(() {
        _contacts = contacts;
      });
    } else {
      setState(() {
        ProcessingContacts = false;
      });
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future syncronizeContacts() async {
    await Firestore.instance
        .collection('UserMobileContact')
        .document(UserId)
        .setData({
      "synce": true,
      "contact": contactInfo,
    }).then((_) async {
//      await SharedPref.pref.setcontactSync(true);
      setState(() {
        contactSynced = true;
        ProcessingContacts = false;
      });
    });
  }

  List contactInfo = [];
  List CalanderInfo = [];
  List smsSend = [];
  List smsReceive = [];

  Future<PermissionStatus> _getSMSPermission() async {
    PermissionStatus permission =
    await PermissionHandler().checkPermissionStatus(PermissionGroup.sms);
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.unknown) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
      await PermissionHandler().requestPermissions([PermissionGroup.sms]);
      return permissionStatus[PermissionGroup.sms] ?? PermissionStatus.unknown;
    } else {
      return permission;
    }
  }

  /* Future GetSms() async {
    PermissionStatus permissionStatus = await _getSMSPermission();
    if (permissionStatus == PermissionStatus.granted) {
      List<SmsMessage> messages = await query.getAllSms;

      messages.forEach((messag) {
        try {
          print(messag.kind);
          if (messag.body.isNotEmpty && messag.address.isNotEmpty) {
            if (messag.kind.toString().contains("Received")) {
              smsSend.add({
                "Message": messag.body,
                "Address": messag.address,
              });
            }

            if (messag.kind.toString().contains("Sent")) {
              smsReceive.add({
                "Message": messag.body,
                "Address": messag.address,
//              "kind": (messag.kind.toString().isNotEmpty) ? messag.kind : "",
              });
            }
          }
        } catch (e) {
          print("there");
        }
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }
  }

  Future syncronizeSMS(List sms, String kind) async {
    await Firestore.instance.collection(kind).document(UserId).setData({
      "synce": true,
      "Kind": kind,
      "SMS": sms,
    }).then((_) async {
//      await SharedPref.pref.setSMSSync(true);
      setState(() {
        SMSSynced = true;
        ProcessingSMS = false;
      });
    });
  }*/

  Future syncronizeDevice() async {
    print(_deviceData);
    await Firestore.instance
        .collection('UserDeviceInfo')
        .document(UserId)
        .setData({
      "synce": true,
      "Device Info": _deviceData,
    }).then((_) async {
      await SharedPref.pref.setDeviceInfoSync(true);
      setState(() {
        device = true;
        Processingdevice = false;
      });
    });
  }

  Future syncronizeClander() async {
    await Firestore.instance
        .collection('UserClanderInfo')
        .document(UserId)
        .setData({
      "synce": true,
      "Clander": CalanderInfo,
    }).then((_) async {
//      await SharedPref.pref.setcontactSync(true);
      setState(() {
        calendar = true;
      });
    });
  }

  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;

  Future<PermissionStatus> _getGeoPermission() async {

    var permissionsGranted = await _deviceCalendarPlugin.hasPermissions();

    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.location);

    print('Peetrerteyrtey '+permission.toString());
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.unknown) {
      Map<PermissionGroup, PermissionStatus> permissionStatus =
      await PermissionHandler()
          .requestPermissions([PermissionGroup.location]);
      return permissionStatus[PermissionGroup.location] ??
          PermissionStatus.unknown;
    } else {
      return permission;
    }




  }

  void _getCurrentLocation() async {


    print("MANIAIAIAHIAHAIHIAHIAHAIH ");
    PermissionStatus permissionStatus = await _getGeoPermission();


    print('ManishPermiss Geo '+permissionStatus.toString());


    if (permissionStatus == PermissionStatus.granted) {
      geolocator
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
          .then((Position position) {
        setState(() {
          _currentPosition = position;
          print("ManishJSO  "+_currentPosition.toJson().toString());
        });

        _getAddressFromLatLng();
      }).catchError((e) {
        print(e);
      });
    } else {
      _handleInvalidPermissions(permissionStatus);
    }






  }

//  Future<int> fun21() async => _getCurrentLocation;

  _getAddressFromLatLng() async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
        "${place.locality}, ${place.postalCode}, ${place.country}";

        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }

  Future syncronizeGPS() async {
    await Firestore.instance
        .collection('GPS Information')
        .document(UserId)
        .setData({
      "synce": true,
      "Address": _currentAddress,
      "Position": _currentPosition.toJson(),
    }).then((_) async {
//      await SharedPref.pref.setGPSSync(true);
      setState(() {
        geoLocation = true;
      });
    });
  }


  void syncronizeManishGPS(Position position) {

    print("amsniJSOn  "+position.toString());
    Firestore.instance
        .collection('GPS Information')
        .document(UserId)
        .setData({
      "synce": true,
      "Address": _currentAddress,
      "Position": position.toJson(),
    }).then((_) async {
//      await SharedPref.pref.setGPSSync(true);
      setState(() {
        geoLocation = true;
      });
    });
  }
}



class Counter {
  int fib(int n) {
    if (n < 2) {
      return n;
    }
    return fib(n - 2) + fib(n - 1);
  }
}

Future<int> fun21(Counter counter, int arg) async => counter.fib(arg);

