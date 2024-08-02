import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
// import 'package:encrypt/encrypt.dart' as encrypt;

class AppFilePickerBase64 {


  static String generateRandomKey(int length) {
    final random = Random.secure();
    final key = List<int>.generate(length, (_) => random.nextInt(256));
    return base64UrlEncode(key);
  }

  static String generateKey() {
    final key = generateRandomKey(32);
    print('Generated Key: $key');
    return key;
  }
  /// Encrypt bytes to base 64
  static Future<String> getEncodeBase64({required dynamic bytes}) async {
    String base64Documents = base64Encode(bytes);
    return base64Documents;
  }

 // static Future<List<int>> mainFun({required String keyUrl}) async {
 //    String fileName =  keyUrl.split('/').last;
 //    final key = generateRandomKey(32);  // 32 bytes = 256 bits (for AES-256)
 //    final iv = generateRandomKey(16);
 //    final encryptedUrl = fileName;
 //    // final key = 'your-32-byte-key';  // Replace with your actual key
 //    // final iv = 'your-16-byte-iv';    // Replace with your actual IV
 //
 //    // final decryptedUrl = dexryptUrl(encryptedUrl, key, iv);
 //    // print('Decrypted URL: $decryptedUrl');
 //    // return decryptedUrl;
 //  }
  // static List<int> dexryptUrl(String encryptedUrl, String key, String iv){
  //     final keyBytes = encrypt.Key.fromUtf8(key);
  //     final ivBytes = encrypt.IV.fromUtf8(iv);
  //
  //      // final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));
  //      final encrypter = encrypt.Encrypter(encrypt.AES(keyBytes));
  //
  //     final encryptedText = 'e7c0ec2f-e346-41dc-90bb-a33b2546da4d-uORbh4Ir0xlsTcArxhByr0O';
  //     final encrypted = encrypt.Encrypted.fromBase64(encryptedText);
  //     final decrypted = encrypter.decryptBytes(encrypted, iv: ivBytes);
  //     return decrypted;
  // }
  // static Future<void> getDecodeBase64({required String fetchedUrl}) async {
  //   String url = fetchedUrl;
  //   String fileUrl =
  //       "https://symmetry-office-document.s3.us-west-2.amazonaws.com/documents/e7c0ec2f-e346-41dc-90bb-a33b2546da4d-uORbh4Ir0xlsTcArxhByr0O";
  //
  //   // Get the file name from the URL
  //   String fileName = fileUrl.split('/').last;
  //
  //   // Send an HTTP GET request to download the file
  //   var response = await http.get(Uri.parse(fileUrl));
  //
  //   // Get the directory to save the file
  //   Directory appDocDir = await getApplicationDocumentsDirectory();
  //   String filePath = '${appDocDir.path}/$fileName';
  //
  //   // Write the file
  //   File file = File(filePath);
  //   await file.writeAsBytes(response.bodyBytes);
  //
  //   print('File saved at: $filePath');
  //
  //   // Encode the URL to base64
  //   String base64EncodedUrl = base64.encode(utf8.encode(url));
  //   print("Encoded url ::${base64EncodedUrl}");
  //   //return base64EncodedUrl;
  // }
}
