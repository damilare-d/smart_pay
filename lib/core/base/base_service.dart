import 'package:stacked/stacked.dart';

import '../../app/application.dart';
import 'base_data.dart';
import 'exceptions.dart';

abstract class BaseService with ListenableServiceMixin, LoggerMixin {
  /// [otherOperations] is called when the status is true;
  dynamic handleResponse<T>(BaseData<T>? res,
      {void Function(T?)? otherOperations,
      bool returnData = false,
      String defaultErrorMessage = "An error occurred"}) {
    if (res?.status == true) {
      if (otherOperations != null) otherOperations(res!.data);
      return returnData ? res!.data : res!.status;
    }
    throw ApiException(res?.message ?? defaultErrorMessage);
  }
}
