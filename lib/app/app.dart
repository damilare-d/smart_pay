import 'package:smartpay/ui/screens/create_new_password/create_new_password_view.dart';
import 'package:smartpay/ui/screens/identification/identification_view.dart';
import 'package:smartpay/ui/screens/onboarding/onboarding_view.dart';
import 'package:smartpay/ui/screens/recover_password/recover_password_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


import '../ui/bottom_sheets/notice/notice_sheet.dart';
import '../ui/dialogs/info_alert/info_alert_dialog.dart';
import '../ui/screens/authentication/authentication_view.dart';
import '../ui/screens/create_pin/create_pin_view.dart';
import '../ui/screens/home/home_view.dart';
import '../ui/screens/sign_in/sign_in_view.dart';
import '../ui/screens/sign_up/sign_up_view.dart';
import '../ui/screens/startup/startup_view.dart';
import '../ui/screens/verify_identity/verify_identity_view.dart';
import '../ui/styles/theme_manager.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: OnboardingView),
    MaterialRoute(page: SignInView),
    MaterialRoute(page: RecoverPasswordView),
    MaterialRoute(page: VerifyIdentityView),
    MaterialRoute(page: CreateNewPasswordView),
    MaterialRoute(page: SignUpView),
    MaterialRoute(page: AuthenticationView),
    MaterialRoute(page: IdentificationView),
    MaterialRoute(page: CreatePinView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ThemeNotifier),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
