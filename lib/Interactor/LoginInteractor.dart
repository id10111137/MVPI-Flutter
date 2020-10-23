import 'package:dio/dio.dart';
import 'package:login/Hellper/HellperSharePreferenced.dart';
import 'package:login/Hellper/api_service.dart';
import 'package:login/Model/LoginModels.dart';
import 'package:login/Model/LoginRequest.dart';
import 'package:login/Presenter/LoginPresenter.dart';
import 'package:login/View/LoginView.dart';
class LoginInteractor implements LoginPresenter {
  HellperSharePreferenced hellperSharePreferenced;
  LoginView loginView;
  RestClient restClient = RestClient(Dio());

  LoginInteractor(LoginView _loginView) {
    this.loginView = _loginView;
  }

  @override
  void doPostLogin(LoginRequest loginRequest) async {
    await restClient.postLogins(loginRequest).then((it) {
      // loginView.doStartLoading();
      if (it.code == 200) {
        loginView.doSuccses(new LoginModels.fromJson(it.toJson()));
        loginView.doHome();
        // loginView.doStopLoading();
      } else {
        // loginView.doStopLoading();
        loginView.doFailled("Username dan Password salah");
      }
    }).catchError((e) {
      switch (e.runtimeType) {
        case DioError:
          final res = (e as DioError).response;
          loginView.doFailled(res.toString());
          break;
        default:
      }
    });
  }
}
