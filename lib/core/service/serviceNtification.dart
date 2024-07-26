import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../config/hive_config.dart';
import '../constants/constantsStringApp.dart';
import 'coreService.dart';

class LocalNotificationService{
  Future<void> requestPermission()async{
    PermissionStatus status=await Permission.notification.request();
    if(status != PermissionStatus.granted){
      throw Exception("permession not granted");
    }
  }
  

Future<void>uploadFcm()async{
  try{
    await FirebaseMessaging.instance.getToken().then((value) async{
      print("getToken :: $value");
      CoreService.responsee=await CoreService.dio.post(
          apiTableNotification,
          data: {
            "id_user":userHive!.get("id"),
            "notificationToken": value
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    },);
     await  FirebaseMessaging.instance.onTokenRefresh.listen((value) async{
      print("getTokenRefresh :: $value");
      CoreService.responsee=await CoreService.dio.post(
          apiTableNotification,
          data: {
            "id_user":userHive!.get("id"),
            "notificationToken": value
          },
          options: Options(
              headers: {
                'apikey':apikey
              }
          )
      );
    },);
  }catch(e){
    print(e);
  }
}


  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();
  Future<void> init()async{
    const AndroidInitializationSettings initializationSettingsAndroid=AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings=InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }


  showNotification(RemoteMessage message)async{
    const AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails('channel_id', 'Channel Name',channelDescription: 'Channel Description',importance: Importance.max,priority: Priority.high,ticker: 'ticker');
    int notificationId=1;
    const NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(notificationId, message.notification!.title, message.notification!.body, notificationDetails,payload: 'Not present');
  }


  showNotificationText()async{
    const AndroidNotificationDetails androidNotificationDetails=AndroidNotificationDetails('channel_id', 'Channel Name',channelDescription: 'Channel Description',importance: Importance.max,priority: Priority.high,ticker: 'ticker');
    int notificationId=1;
    const NotificationDetails notificationDetails=NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(notificationId, "Statistics and Planning Center", "Thank's, we are submite your answers", notificationDetails,payload: 'Not present');
  }


}