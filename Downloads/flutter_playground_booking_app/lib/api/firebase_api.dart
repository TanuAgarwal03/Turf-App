import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;
  Future<void> initNotifications() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    // firebase cloud messaging token - it is an idetifier for our device in our application
    // we use it for sending notification to specific device
    print('Token : $fCMToken');
  }
}