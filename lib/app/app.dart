import 'package:smartpay/core/services/api_service.dart';
import 'package:smartpay/core/services/auth_repository.dart';
import 'package:smartpay/core/services/user_details_service.dart';
import 'package:smartpay/ui/bottom_sheets/country_selwcwtion_sheet/country_selection_sheet.dart';
import 'package:smartpay/ui/screens/confirmation/confirmation_view.dart';
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
    MaterialRoute(page: ConfirmationView),
    // @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: SnackbarService),
    LazySingleton(classType: ThemeNotifier),
    LazySingleton(classType: AuthRepository),
    LazySingleton(classType: ApiService),
    LazySingleton(classType: UserDetailsService),
    // @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    StackedBottomsheet(classType: CountrySelectionSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
  logger: StackedLogger(),
)
class App {}
