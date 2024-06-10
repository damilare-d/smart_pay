import 'jwt.dart';

class BaseData<T> {
  dynamic _status;
  int? statusCode;
  String? statusDescription;
  String message;
  String? errorCode;
  List<Map<String, dynamic>>? errors;
  String? error;
  T? data;
  dynamic _rawData;
  Jwt? jwt;

  BaseData(
    this._status,
    this.statusCode,
    this.statusDescription,
    this.message,
    this.data,
  );

  factory BaseData.fromJson(
    Map<String, dynamic> json, {
    T? Function(Map<String, dynamic>)? objectConverter,
    T? Function(List<dynamic>)? listConverter,
    T? Function(dynamic)? primDataConverter,
  }) {
    return BaseData<T>(
      json['status'],
      (json['code'] as int?) ?? (json['statusCode'] as int?),
      json['status']?.toString(),
      json['message'].toString(),
      json["data"] != null
          ? (primDataConverter != null
              ? primDataConverter(json['data'])
              : (objectConverter != null
                  ? objectConverter(json["data"] is String
                      ? json["data"]
                      : json["data"] as Map<String, dynamic>)
                  : (listConverter != null
                      ? (json["data"] is List
                          ? listConverter(json["data"] as List<dynamic>)
                          : listConverter(
                              (json["data"]["result"] as List<dynamic>?) ?? []))
                      : json["data"] as T)))
          : null,
    )
      ..errorCode = json['errorCode'] as String?
      ..errors = (json['errors'] as List?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList()
      ..error = (json['error'] as String?)
      ..jwt = json['jwt'] != null
          ? Jwt.fromJson(json['jwt'] as Map<String, dynamic>)
          : null
      .._rawData = json["data"];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'status': _status,
        'statusCode': statusCode,
        'statusDescription': statusDescription,
        'message': message,
        'errorCode': errorCode,
        'errors': errors,
        'error': error,
        'data': _rawData,
        'jwt': jwt?.toJson(),
      };

  @override
  String toString() {
    return 'BaseData{status: $status, statusCode: $statusCode, message: $message, errorCode: $errorCode, errors: $errors, error: $error, data: $data}';
  }

  bool get status =>
      ((_status is int)
          ? _status == 200
          : ((_status is String)
              ? (_status as String).toLowerCase() == 'success' ||
                  (_status as String).toLowerCase() == 'approved'
              : (_status as bool?) ?? false)) ||
      statusCode == 200 ||
      message.toLowerCase().contains("successfully");
}
