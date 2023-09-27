import 'dart:convert';

import '../model/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<UserModel> getUsers() async{
    final response = await http.get(Uri.parse(endpoint));
    if(response.statusCode==200){
      print(response.body);
      return UserModel.fromJson(jsonDecode(response.body));
    }else{
      print('error');
      print(response.statusCode);
      throw Exception(response.reasonPhrase);
    }

  }
}
