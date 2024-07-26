import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/config/hive_config.dart';
import '/core/service/serviceNtification.dart';
import '/config/routes.dart';
import '/featurs/authentication/presentation_layer/pages/on_boarding.dart';
import '/featurs/forms/presention_layer/pages/all_forms.dart';
import 'injection_container.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await LocalNotificationService().requestPermission();
  await LocalNotificationService().init();
  await initializeDependencies();
  await Hive.initFlutter();
  await setupHive();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    notificationHandler();
    
  }

  void notificationHandler(){
    FirebaseMessaging.onMessage.listen((event)async {
      print(event.notification!.title);
     await LocalNotificationService().showNotification(event);
    },);
  }

  @override
  Widget build(BuildContext context) {
    // userHive!.delete("id");
    return  MaterialApp(
      debugShowCheckedModeBanner:false,
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      home: (userHive!.get("id")==null || userHive!.get("id")=='')?OnBoarding() : AllForms(),
    );
  }
}
