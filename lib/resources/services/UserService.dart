import 'dart:convert';

import 'package:food_delivery/models/user.dart';
import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';
import 'package:http/http.dart';

signUpUser(user) async{
  String url = '$baseurl/users/register';
  return await httpClient.post(url,body: json.encode(user))
      .then((value) => print(value.body))
      .catchError((err) => print(err));
}

loginUser(user) async {
  String url = '$baseurl/users/authenticate';
  return await httpClient.post(url, body: json.encode(user));
}

loadUserInfo() async
{
  String url = '$baseurl/users/me';
  // return await httpClient.get(url);
  Response response = await httpClient.get(url);
  if(response.statusCode == 200)
  {
    User user = parseUser(response.body);
    return user;
  }else{
    throw Exception('Failed to load user');
  }
}


User parseUser(String responseBody){
  // final parsed = Map<String,dynamic>.from(jsonDecode(responseBody));
  final parsed = json.decode(responseBody).cast<String,dynamic>();
  return User.fromJson(parsed);
}
