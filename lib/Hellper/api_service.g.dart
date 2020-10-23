part of 'api_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestClient implements RestClient {
  _RestClient(this._dio) {
    ArgumentError.checkNotNull(_dio, '_dio');
    _dio.options.baseUrl = 'http://api.dariwarung.com/';
    _dio.options.connectTimeout = 5000; //5s
    _dio.options.receiveTimeout = 3000;
    _dio.options.headers['content-Type'] = 'application/json';
  }

  final Dio _dio;

  @override
  Future<LoginModels> postLogins(LoginRequest loginRequest) async {
    Response response = await _dio.post("Auth/Login", data: loginRequest.toJson());
    final value = LoginModels.fromJson(response.data);
    return Future.value(value);
  }
}