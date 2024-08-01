import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:prohealth/app/constants/app_config.dart';
import 'package:prohealth/app/resources/const_string.dart';
import 'package:prohealth/app/services/api/api.dart';
import 'package:prohealth/app/services/api/repository/hr_module_repository/manage_emp/upload_repo.dart';
import 'package:prohealth/app/services/token/token_manager.dart';
import 'package:prohealth/data/api_data/api_data.dart';
import 'dart:html' as html;
import 'package:http/http.dart' as http;
import 'package:universal_io/io.dart';

// Future<ApiData> uploadDocuments({
//   required BuildContext context,
//   required int employeeDocumentMetaId,
//   required int employeeDocumentTypeSetupId,
//   required int employeeId,
//   required XFile documentFile,
//   required String documentName
// }) async {
//   try {
//     File file = File(documentFile.path);
//     print("File ${file}");
//     // var fileDocuments = MultipartFile(
//     //   documentFile,
//     //   filename: documentName,
//     // );
//     // print("file Doc ${fileDocuments}");
//     var response = await Api(context).post(
//       path: UploadDocumentRepository.uploadEmployeeDocumentGet(employeeDocumentTypeMetaDataId: employeeDocumentMetaId, employeeDocumentTypeSetupId: employeeDocumentTypeSetupId, employeeId: employeeId),
//       data: {
//         'file':file
//       },
//     );
//     print("Response ${response.toString()}");
//     if (response.statusCode == 200 || response.statusCode == 201) {
//       print("Documents uploded");
//       // orgDocumentGet(context);
//       return ApiData(
//           statusCode: response.statusCode!,
//           success: true,
//           message: response.statusMessage!);
//     } else {
//       print("Error 1");
//       return ApiData(
//           statusCode: response.statusCode!,
//           success: false,
//           message: response.data['message']);
//     }
//   } catch (e) {
//     print("Error $e");
//     return ApiData(
//         statusCode: 404, success: false, message: AppString.somethingWentWrong);
//   }
// }


Future<void> uploadHttpDocuments({
  required BuildContext context,
  required int employeeDocumentMetaId,
  required int employeeDocumentTypeSetupId,
  required int employeeId,
  required File documentFile,
  required String documentName
}) async {
  try {
    final String token = await TokenManager.getAccessToken();
    var headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json'
};
    // File file = documentFile as File;
    // Future<XFile> convertHtmlFileToXFile(String assetPath) async {
    //   // Load the HTML file content from assets
    //   final String htmlContent = await rootBundle.loadString(assetPath);
    //
    //   // Get the temporary directory
    //   final Directory tempDir = await getTemporaryDirectory();
    //
    //   // Create a temporary file
    //   final File tempFile = File('${tempDir.path}/temp.html');
    //
    //   // Write the HTML content to the temporary file
    //   await tempFile.writeAsString(htmlContent);
    //
    //   // Convert the temporary file to an XFile
    //   final XFile xFile = XFile(tempFile.path);
    //
    //   return xFile;
    // }
    // await convertHtmlFileToXFile(file as String);
    // print("::::${file}");
    print("File :::${documentFile.path.toString()}" );
    print("Token :: $token");
var request = http.MultipartRequest('POST',
    Uri.parse('${AppConfig.dev}/employee-documents/uploadDocument/$employeeDocumentMetaId/$employeeDocumentTypeSetupId/$employeeId'));
request.files.add(await http.MultipartFile.fromPath('file', '/C:/Users/shubham/Downloads/file-document-black.png'));
// request.files.add(http.MultipartFile.fromPath('file',documentFile.path) as http.MultipartFile);
request.headers.addAll(headers);

// http.StreamedResponse response = await request.send();
//     var responseData = await http.Response.fromStream(response);

print("Request ::: ${request}");
// if (response.statusCode == 200 || response.statusCode == 201) {
//   print("Uploded");
// print(await response.stream.bytesToString());
// }
// else {
//   print("Faild");
//   print("${response.statusCode}");
// print(response.reasonPhrase);
// }
  } catch (e) {
    print("Error $e");
  }
}

