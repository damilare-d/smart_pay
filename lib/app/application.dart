import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.bottomsheets.dart';
import 'app.dialogs.dart';
import 'app.locator.dart';

export 'package:stacked_services/stacked_services.dart';

export 'app.bottomsheets.dart';
export 'app.locator.dart';
export 'logger_mixin.dart';

class Application {
  static const String packageName = 'com.example.trig_retails_app';
  static const String appName = "Trig Retails App";

  static Future<void> initialize() async {
    WidgetsFlutterBinding.ensureInitialized();

    await setupLocator();
    setupBottomSheetUi();
    setupDialogUi();
  }
}

NavigationService get appRouter => locator<NavigationService>();
DialogService get dialogService => locator<DialogService>();
SnackbarService get snack => locator<SnackbarService>();
BottomSheetService get sheetService => locator<BottomSheetService>();
