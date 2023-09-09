import 'package:xyz_cart/providers/auth_provider.dart';
import 'package:xyz_cart/providers/loadin_provider.dart';
import 'package:xyz_cart/services/local_prefs.dart';
import 'package:xyz_cart/utils/mixins.dart';

mixin LoginDelegate implements SnackbarMixin {}

class ViewModel {
  LoginDelegate? loaginDelegate;
  LoadinProvider? loadinProvider;
  AuthProvider? authProvider;
  final LocalPreferences _localPreferences = LocalPreferences.instance;
  ViewModel(
      {required LoginDelegate lDelegate,
      required LoadinProvider lProvider,
      required AuthProvider aProvider}) {
    loaginDelegate = lDelegate;
    loadinProvider = lProvider;
    authProvider = aProvider;
  }
  String email = "";
  String password = "";
  Future<bool> handleLoginButtonPress() async {
    loadinProvider!.updateBoolState(true);
    try {
      await authProvider!.login(email, password);
      if (authProvider!.userData != null) {
        _localPreferences.setToken(authProvider!.userData!.accessToken);
        return true;
      }
    } catch (e) {
      loaginDelegate!.showSnackbar("Error login $e");
    }
    loadinProvider!.updateBoolState(false);
    return false;
  }
}
