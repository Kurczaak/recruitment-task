import 'dart:io';

import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_recruitment_task/generated/locale_keys.g.dart';
import 'package:flutter_recruitment_task/network_configuration/result.dart';

typedef Future Callback();

//define strings here as const

Future<Result<ResultType>> handleResponse<ResponseType, ResultType>(
    Callback callback, ResultType Function(ResponseType) mapToEntity) async {
  try {
    ResponseType response = await callback();
    ResultType entity = mapToEntity(response);
    return Result<ResultType>.success(entity);
  } on DioError catch (e) {
    if (e.error is SocketException) {
      return Result.error(LocaleKeys.no_internet_error.tr());
    }
    return Result.error(e.message);
  } on HttpException catch (e) {
    return Result.error(e.message);
  } on FormatException catch (e) {
    return Result.error("Bad response format: $e");
  } catch (e, stacktrace) {
    print("Exception: $e, stacktrace: $stacktrace");
    return Result.error("Something went wrong - $e");
  }
}
