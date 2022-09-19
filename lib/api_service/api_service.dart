import 'dart:convert';

import 'package:http/http.dart';
import 'package:untitled5/models/post_model.dart';
import 'package:untitled5/models/response_model.dart';

class ApiService{

  static Map<String, String> headers = {"Content-Type":"application/json; charset=UTF-8"};
  static String  GET_API = "/api/v1/update/1";
  static String BASE = "dummy.restapiexample.com";

  static Future<String?> POST(String api,Map<String,String> params) async{
    var uri = Uri.http(BASE,api,params);
    var response = await put(uri,headers: headers,body: jsonEncode(params));
    if(response.statusCode==200||response.statusCode==201){
      return response.body;
    }
    return null;
  }

//  HTTP params

  static Map<String, String> paramsPost(Post post){
    Map<String,String> params = {};
    params.addAll({
      'title': post.title,
      'body': post.body,
      'userId': post.userId.toString()
    });
    return params;
  }

  static RePost parsePost(String json){
    dynamic j = jsonDecode(json);
    var rs = RePost.fromJson(j);
    return rs;
  }
}