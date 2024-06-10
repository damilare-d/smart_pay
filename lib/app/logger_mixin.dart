import 'package:logger/logger.dart';

import 'app.logger.dart';

mixin LoggerMixin {
  Logger get logger => getLogger(runtimeType.toString());
}
