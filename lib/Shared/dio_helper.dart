import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    //task1
  // dio=Dio(BaseOptions(
  //    baseUrl:'http://159.89.4.181:2000/api/' ,
  //   receiveDataWhenStatusError: true
  // )
  // );
    //task2
    //task2
  dio=Dio(BaseOptions(
      baseUrl:'https://cvsportsapp.com/api/' ,
      receiveDataWhenStatusError: true
  )
  );
  //   //task 3 post register data
  // dio=Dio(BaseOptions(
  //     baseUrl:'https://cookforme.mvdev.xyz/api/' ,
  //     receiveDataWhenStatusError: true
  // )
  // );
  }


  //task1
 // static Future<Response> getData({
 //   required String path,
 //    Map<String,dynamic>? query
 //
 // })async{
 //  return await dio.get(path,queryParameters: query );
 // }
 //task2
  static Future<Response> getData({
    required String path,
    Map<String,dynamic>? query,
    String lang='ar',
  })async{
    dio.options.headers={
      'Accept': 'application/json',
      'lang': lang,
    };
    return await dio.get(path,queryParameters: query );
  }

  static Future<Response>postData({
  required String path,
  required Map <String,dynamic> data,
   String lang='en',
})async

{
  // dio.options.headers = {
  //   'Content-Type': 'application/json',
  //   'lang': lang,
  // };
  return await dio.post(path,queryParameters:data,options: Options(
    followRedirects: false,validateStatus: (status){return status! <500;}
  ));
}


}