import 'package:dio/dio.dart';

class DioHelper{
  static late Dio dio;

  static init(){
  dio=Dio(BaseOptions(
     baseUrl:'http://159.89.4.181:2000/api/' ,
    receiveDataWhenStatusError: true
  ));
  }
 static Future<Response> getData({
   required String path,
    Map<String,dynamic>? query})async{
  return await dio.get(path,queryParameters: query );
 }
}