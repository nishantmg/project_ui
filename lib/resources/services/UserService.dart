import 'dart:convert';

import 'package:food_delivery/resources/environment.dart';
import 'package:food_delivery/resources/services/HttpCommon.dart';

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
  return await httpClient.get(url);
}
