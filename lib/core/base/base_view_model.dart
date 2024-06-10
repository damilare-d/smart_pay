import 'package:smartpay/utils/extensions.dart';
import 'package:stacked/stacked.dart';


import '../../app/application.dart';
import 'exceptions.dart';

class MBaseViewModel extends ReactiveViewModel with LoggerMixin {
  @override
  void onFutureError(error, Object? key) {
    super.onFutureError(error, key);
    logger.e(error);
    if (error is TypeError) {
      logger.e(error.stackTrace);
    }
    if (error is IncorrectOTPError) {
      setError(error.message);
    } else if (error is ApiException) {
      snack.showSnackbar(message: error.message.lazySubString(0, 150));
    } else if (error.toString().isNotEmpty) {
      snack.showSnackbar(message: error.toString().lazySubString(0, 150));
    } else {
      logger.e("An Unknown Error Occurred");
    }
  }
}
