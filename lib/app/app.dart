import 'package:st_boilerplate_stacked/services/shared_preferences_services.dart';
import 'package:st_boilerplate_stacked/services/utilities_service.dart';
import 'package:st_boilerplate_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:st_boilerplate_stacked/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:st_boilerplate_stacked/ui/views/home/home_view.dart';
import 'package:st_boilerplate_stacked/ui/views/second/second_view.dart';
import 'package:st_boilerplate_stacked/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:st_boilerplate_stacked/ui/bottom_sheets/custom/custom_sheet.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: SecondView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SharedPreferencesServices),
    LazySingleton(classType: UtilitiesService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CustomSheet),
// @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
