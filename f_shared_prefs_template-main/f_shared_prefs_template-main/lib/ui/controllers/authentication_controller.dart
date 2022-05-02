import 'package:get/get.dart';

import '../../domain/use_case/authentication.dart';

class AuthenticationController extends GetxController {
  var _logged = false.obs;
  final Authentication _authentication = Get.find<Authentication>();

  bool get logged => _logged.value;

  set logged(bool mode) {
    _logged.value = mode;
  }

  void initializeRoute() async {
    logged = await _authentication.init;
  }

  AuthenticationController() {
    initializeRoute();
  }

  // para cada uno llamar los métodos del use_case authentication

  Future<bool> login(user, password) async {
    //Verificamos si el user y password coinciden con los almacenados
    
    var log= await _authentication.login(user, password);
    //_logged = true as RxBool;
    _logged.value=true;
    return log;
    
  }

  Future<bool> signup(user, password) async {
    _authentication.signup(user, password);

    return true;
  }

  void logout() {
    _authentication.logout();
    _logged.value = false;
  }
}
