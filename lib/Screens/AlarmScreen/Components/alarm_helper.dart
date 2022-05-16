// ignore_for_file: unused_field, import_of_legacy_library_into_null_safe

import 'package:mylastwords/models/alarm_info.dart';
import 'package:sqflite/sqflite.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mylastwords/constants.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mylastwords/main.dart';

final String tblAlarm = 'alarm';
final String colId = 'id';
final String colTitle = 'title';
final String colDateTime = 'alarmDateTime';
final String colalarmOnOff = 'alarmOnOff';


class AlarmHelper {
  static Database? _database;
  static AlarmHelper? _alarmHelper;

  AlarmHelper._createInstance();
  factory AlarmHelper() {
    if (_alarmHelper == null) {
      _alarmHelper = AlarmHelper._createInstance();
    }
    return _alarmHelper!;
  }

  Future<Database?> get database async {
    if (_database == null) {
      _database = await initializaDatabase();
    }
    return _database;
  }

  Future<Database?> initializaDatabase() async {
    var dir = await getDatabasesPath();
    var path = dir + "alarm.db";

    var database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
          create table $tblAlarm 
          (
            $colId text not null primary key,
            $colTitle text not null,
            $colDateTime text not null,
            $colalarmOnOff text not null
          )
        ''');
      },
    );
    return database;
  }

  void insertAlarm(AlarmInfo alarmInfo) async {
    var db = await this.database;
    var result = await db!.insert(tblAlarm, alarmInfo.toMap());
      Fluttertoast.showToast(
        msg:
            "Successfully Added Alarm",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor:
            lightBackground,
        textColor: txtColorDark,
        fontSize: 15.0);
    print('result : $result');
  }

  Future<List<AlarmInfo>> getAlarms() async {
    List<AlarmInfo> _alarms = [];
    var db = await this.database;
    var result = await db!.query(tblAlarm);
    result.forEach((element) {
      var alarmInfo = AlarmInfo.fromMap(element);
      _alarms.add(alarmInfo);
    });
    return _alarms;
  }

  Future<int> delete(String id) async {
     var db = await this.database;
        Fluttertoast.showToast(
        msg:
            "Successfully Deleted Alarm",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor:
            lightBackground,
        textColor: txtColorDark,
        fontSize: 15.0);
    return await db!.delete(tblAlarm, where: '$colId=?',whereArgs: [id]);
  }

  Future<int> updateOnOff(AlarmInfo alarmInfo) async {
     var db = await this.database;  
     String id = alarmInfo.toMap()['id'];      
    return await db!.update(tblAlarm, alarmInfo.toMap()['alarmOnOff'], where: '$colId=?',whereArgs: [id]);
  }

   

  void scheduleAlarm(
      DateTime scheduledNotificationDateTime, AlarmInfo alarmInfo) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      'alarm_notif',
      'alarm_notif',
      'Channel for Alarm notification',
      icon: 'codex_logo',
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
      largeIcon: DrawableResourceAndroidBitmap('codex_logo'),
    );

    var iOSPlatformChannelSpecifics = IOSNotificationDetails(
        sound: 'a_long_cold_sting.wav',        
        presentAlert: true,
        presentBadge: true,
        presentSound: true,);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.schedule(0, 'Sample Alarm', alarmInfo.title,
        scheduledNotificationDateTime, platformChannelSpecifics);
  }
}
