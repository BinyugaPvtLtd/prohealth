import 'dart:convert';
import 'package:dio/dio.dart';
class ForgotPassManager{
  Dio dio = Dio();

  Future<void> forgotPass({required String email})async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var data = json.encode({
     // "email": "srojkrjha@gmail.com"
      "email": email,
    });
    var dio = Dio();
    var response = await dio.request(
      'https://wwx3rebc2b.execute-api.us-west-1.amazonaws.com/dev/serverlessSetup/auth/forgotPassword',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    }
    else {
      print(response.statusMessage);
    }
  }
}