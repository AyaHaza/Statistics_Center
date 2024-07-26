import 'package:http/http.dart'as http;
import 'package:googleapis_auth/auth_io.dart'as auth;
import 'dart:convert';

class Constant{
  //https://fcm.googleapis.com/fcm/send       *old url for sending notification*
  static  String base_url='https://fcm.googleapis.com/v1/projects/management-notifications-566b9/messages:send';
  static  String key_server='';
  static const String sender_id='167104993030';
  static Future<String> getAccessToken()async{
    final srviceAccountJson={
          "type": "service_account",
          "project_id": "management-notifications-566b9",
          "private_key_id": "6e9872e8f88f76b0b7f4dfd31a23e098a9b897b4",
          "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQDBSpv5A291V9I/\nQMQkOalYx5r1/S2n3CZbkIYgQKDOxhBKKjmxnc9OuShBxT8qjX2q/FWbZ8YEN07D\n8G/EJF5FhFjsD0uhHgPeI8IJk04Rw0dxV8ySBrfWSP8nmcSL/gYO+w3iCBlfIgDU\ncNWyXsOJO/cugoKxfCwdxAIEbt+6xG0jb2vkT0Y7lJ36KhaKBPr/gf9JVmu+2Kc4\nNxUViezrCPKi/IAx64NmAv1I979mEOueXFr+gBUJbbL8/cGYxjFUefEqGaM6aRou\nqqt1m/jD9roocFJooTqYSA1jg8rSQZBNspaYKQZbtNvwTA6vp4nKhqyCPHYObGzW\n3qKWmk1XAgMBAAECggEABTvOblcj+PLoS/MmfG6dQbyh2wBAcLeayEbpAs2NLRwa\ny89J4Z/KwbBswR8knzPWj78mWD9ekrWmqdKETDTJ4qr7N2UQoKut4iFouxakegGm\nGREOBnQtHR273uggdMPriRNOJG0gtr02dYoalypOtBQOFNHO1RxuG143ycPwxd9I\nkGazCUaxg6Q8oD/7wAY9A8EnmmAT5elb+jGAf507PWu3uBW6e80z8qjqTHj+GpMX\nxeEtXa1ZShXIsWhwSHWWcynchCHT03LnVOFMnSq+pSxXnHaurOZ7uMpTeVTqZbyh\nVsW7mUVO9n5V+VddhalwSQWdysGHqqtlCNx3TiAYbQKBgQD4iK6woUBCNAwvxubq\nJk/kaF+rJB5rq23lj18AR906XjK2s+CyahYfLThbflYRFQbOStwbaxfwo6RP2JG6\nUSFEotrF4E1/pEuXtONi0F89vSo2mNCax6npuT6yei6F47Qb2/rzN17TZP9uJ7jS\n+CnwjcvHW/pEU1TruiZeeRiZwwKBgQDHGReEOl6b0jDAErbyZLgKQbRGOCnlGYLd\nbFPVdDJPDonAwmTK5BUxdcN/LxIgD4OuPs5VPJmO4B0X87aWHi+4uMpHWVQdobIQ\nLRULQ+DJwOdg5KBYsJiWcKqIw+l4MkgNTt3jJKTx2y7VV0cCJpTCyqE+G5vLat7+\nqKhfcMMw3QKBgCgnDPIEWzlW51EgtVXG8slYA3zGzRNgEtUvoI2PDrLLXS4fSYIJ\nmaFX0O8XLhh8aSkS9xSG7Ms35OfxeTm8ub85AFdPsbWZeYz88G+acoiq8xL3BVy8\nPTtBbluvWazP6N1HYPfCTlOg0ZOeX0HWThBLGE0RExHO1L1wyZohvlO5AoGBAKMK\nZTufIQKxacKgkLiGyj979sjaDVTTQ1tX7n8KHHipCx2TEz8i8EgEjAeG4Gzox4jV\nXdpnOcjKtoh6x7a/GY1Hpj4vZLavR0X/5Q/IkjglhFTQZI68bvgjY0OES5hmdKKR\nRxtPUtPMDdofEsMsHP43OTvHGBnIdrxMGTWu/ejxAoGBANpbwrZfKVCM48Gnd0ag\nHP/InYGg+8Szec51ngx+VWGoam7wtockzmPKlHwRqSd9ri0RsrZQOtpZbp0vNHnL\ntuYG7i5+1z5wnAF+49I+YnuAY7Dj6EaTuRyVorCiw3/H9mWmVUXOjGy470bdPscK\nBOpE1vWwKYSjrEYvI+7E733c\n-----END PRIVATE KEY-----\n",
          "client_email": "flutter-token-notification@management-notifications-566b9.iam.gserviceaccount.com",
          "client_id": "104118597347114538669",
          "auth_uri": "https://accounts.google.com/o/oauth2/auth",
          "token_uri": "https://oauth2.googleapis.com/token",
          "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
          "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flutter-token-notification%40management-notifications-566b9.iam.gserviceaccount.com",
          "universe_domain": "googleapis.com"
        };
    List<String> scops=[
      "https://www.googleapis.com/auth/userinfo.email",
      "https://www.googleapis.com/auth/firebase.database",
      "https://www.googleapis.com/auth/firebase.messaging"

    ];

    http.Client client= await auth.clientViaServiceAccount(
            auth.ServiceAccountCredentials.fromJson(srviceAccountJson),
            scops
            );
    auth.AccessCredentials credentials=await auth.obtainAccessCredentialsViaServiceAccount(
      auth.ServiceAccountCredentials.fromJson(srviceAccountJson),
      scops,
      client
      
    );
    client.close();

    return credentials.accessToken.data;
  }
}

class NotificationServer{
  Future<bool> pushNotifications({ 
    required String title,
    body,
    token,
})async{
    Constant.key_server=await Constant.getAccessToken();
    Map<String,dynamic> payload={
      'message':{
        'token': token,
      'notification':{
        'title':title,
        'body':body,
      }}
    };
    String dataNotification=jsonEncode(payload);
    var response=await http.post(
      Uri.parse(Constant.base_url),
      headers: {
        'Content-Type':'application/json',
        'Authorization':'Bearer ${Constant.key_server}'
      },
      body: dataNotification,
    );
    print(response.body.toString());
    return true;
  }
}