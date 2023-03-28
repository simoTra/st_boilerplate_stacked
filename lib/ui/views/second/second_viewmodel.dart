import 'package:st_boilerplate_stacked/app/app.bottomsheets.dart';
import 'package:st_boilerplate_stacked/app/app.dialogs.dart';
import 'package:st_boilerplate_stacked/app/app.locator.dart';
import 'package:st_boilerplate_stacked/app/app.router.dart';
import 'package:st_boilerplate_stacked/services/utilities_service.dart';
import 'package:st_boilerplate_stacked/services/shared_preferences_services.dart';
import 'package:st_boilerplate_stacked/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SecondViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _navigationService = locator<NavigationService>();
  final _sharedPreferecesServices = locator<SharedPreferencesServices>();
  final _utilitiesService = locator<UtilitiesService>();

  String get counterLabel => 'Counter is: ${_utilitiesService.count} ';
  String? sharedText;

  void incrementCounter() {
    _utilitiesService.count++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked ${_utilitiesService.count}  stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.custom,
      title: 'This is a custom buttom sheet',
      description: 'This is a very short description',
    );
  }

  void replace() {
    _navigationService.replaceWithHomeView();
  }

  Future<void> shared() async {
    String? text = await _sharedPreferecesServices.getSharedTest();
    _utilitiesService.logger.d(text);
    final response = await _utilitiesService.dio
        .get('https://jsonplaceholder.typicode.com/todos/1');
    print(response.data);
  }
}
