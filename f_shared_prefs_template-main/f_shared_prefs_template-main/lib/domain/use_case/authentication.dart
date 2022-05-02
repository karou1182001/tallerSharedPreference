import 'package:shared_preferences/shared_preferences.dart';

import '../../data/repositories/local_preferences.dart';

class Authentication {
  final _sharedPreferences = LocalPreferences();

  Future<bool> get init async =>
      await _sharedPreferences.retrieveData<bool>('logged') ?? false;

  Future<bool> login(user, password) async {
    // verificar si user y password coinciden con los almacenados
    // en ese caso cambiar el estado de loggeed y devolver  Future.value(true);
    var usuario= await _sharedPreferences.retrieveData<String>("user");
    var pass= await _sharedPreferences.retrieveData<String>("password");
    if (user== usuario  && password== pass)
    {
      //Cambiamos el estado del logged
      _sharedPreferences.storeData<bool>("logged", true);
      return true;
      
    } else {
      return false;
    }
  }

  Future<void> signup(user, password) async {
    // almancenar user y password
    _sharedPreferences.storeData<String>("user", user);
    _sharedPreferences.storeData<String>("password", password);
   

  }

  void logout() async {
    // cambiar loggeed
    _sharedPreferences.storeData<bool>("logged", false);
  }
}
