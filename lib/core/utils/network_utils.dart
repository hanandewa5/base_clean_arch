import 'dart:io';

class NetworkUtils {
  static Future<bool> checkStatus() async {
    bool isConnected = false;
    try {
      final result = await InternetAddress.lookup('google.com');
      isConnected = result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      isConnected = false;
    }

    return isConnected;
  }
}
