import 'package:dio/dio.dart';
import 'package:game_tv/core_utils/common_utils.dart';
import 'package:game_tv/services/api/app_exception.dart';
import 'package:game_tv/services/api/exception_helper.dart';



import 'app_error_type.dart';

class AppError {
  AppErrorType? _appErrorType;
  String? _errorCode;
  int? _apiCode;
  String? displayMessage;

  //Debug purpose only
  DioError? _dioError;
  Exception? _exception;
  Error? _error;
  ErrorModel? _errorModel;

  AppErrorType get appErrorType =>
      _appErrorType ?? AppErrorType.unknownHandlingError;
  String get errorCode => _errorCode ?? kApiUnknownError;
  int get apiCode => _apiCode ?? kApiUnknownErrorCode;


  AppError.withApiException(ExceptionHandler? error,
      {String? displayMessage}) {
    if (error != null &&
        error.getErrorModel() != null &&
        error.getErrorModel()!.errorMessageKey.hasValidData()) {
      _dioError = error.getDioError();
      _exception = error.getException();
      _errorModel = error.getErrorModel();
      _setErrorType(_errorModel?.errorMessageKey,
          apiCode: _errorModel?.errorCode);
      this.displayMessage = displayMessage;
    } else {
      AppError.defaultException(displayMessage: displayMessage);
    }
  }


  AppError.defaultException({Exception? exception, this.displayMessage}) {
    _defaultError();
    _exception = exception;
  }

  AppError.defaultError({Error? error, this.displayMessage}) {
    _defaultError();
    _error = error;
  }

  void _defaultError() {
    _appErrorType = AppErrorType.unknownHandlingError;
  }

  void _setErrorType(String? errorCode, {int? apiCode}) {
    if (errorCode?.hasValidData() ?? false) {
      errorCode = errorCode!.trim().toUpperCase();
      if (errorCode.contains(kApiCanceled)) {
        _appErrorType = AppErrorType.canceledError;
        _apiCode = kApiCanceledCode;
        _errorCode = kApiCanceled;
      } else if (errorCode.contains(kApiConnectionTimeout)) {
        _appErrorType = AppErrorType.connectionTimeOutError;
        _apiCode = kApiConnectionTimeoutCode;
        _errorCode = kApiConnectionTimeout;
      } else if (errorCode.contains(kApiDefault)) {
        _appErrorType = AppErrorType.defaultError;
        _apiCode = kApiDefaultCode;
        _errorCode = kApiDefault;
      } else if (errorCode.contains(kApiReceiveTimeout)) {
        _appErrorType = AppErrorType.receivedTimeOutError;
        _apiCode = kApiReceiveTimeoutCode;
        _errorCode = kApiReceiveTimeout;
      } else if (errorCode.contains(kApiSendTimeout)) {
        _appErrorType = AppErrorType.sendTimeoutCode;
        _apiCode = kApiCanceledCode;
        _errorCode = kApiCanceled;
      } else if (errorCode.contains(kApiHandshakeExceptionError)) {
        _appErrorType = AppErrorType.handshakeError;
        _apiCode = kApiHandshakeExceptionErrorCode;
        _errorCode = kApiHandshakeExceptionError;
      } else if (errorCode.contains(kApiResponseError)) {
        _appErrorType = AppErrorType.responseError;
        _apiCode = apiCode;
        _errorCode = kApiResponseError;
      } else {
        _appErrorType = AppErrorType.unknownApiError;
        _apiCode = kApiUnknownErrorCode;
        _errorCode = kApiUnknownError;
      }
    } else {
      _defaultError();
    }
  }
}