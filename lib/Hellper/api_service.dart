
import 'package:dio/dio.dart';
import 'package:login/Model/LoginModels.dart';
import 'package:login/Model/LoginRequest.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "http://api.dariwarung.com/")
abstract class RestClient {
  factory RestClient(Dio dio) = _RestClient;

  @POST("Auth/Login")
  Future<LoginModels> postLogins(@Body() LoginRequest loginRequest);
}
