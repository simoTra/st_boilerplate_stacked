import 'package:st_boilerplate_stacked/services/shared_preferences_services.dart';
import 'package:stacked/stacked.dart';
import 'package:st_boilerplate_stacked/app/app.locator.dart';
import 'package:st_boilerplate_stacked/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _sharedPreferecesServices = locator<SharedPreferencesServices>();

  // Place anything here that needs to happen before we get into the application
  Future runStartupLogic() async {
    await Future.delayed(const Duration(seconds: 3));
    await _sharedPreferecesServices.setSharedTest('test');

    // This is where you can make decisions on where your app should navigate when
    // you have custom startup logic

    _navigationService.replaceWithHomeView();
  }

  void navigate() {
    _navigationService.navigateToHomeView();
  }
}
