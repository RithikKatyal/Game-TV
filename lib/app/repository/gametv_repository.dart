import 'dart:async';
import 'dart:core';
import 'package:game_tv/app/repository/api_client.dart';
import 'package:game_tv/app/repository/mapper/tournment_data_mapper.dart';
import 'package:game_tv/app/repository/mapper/user_data_mapper.dart';
import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/app/repository/model/user_data.dart';
import 'package:game_tv/core_utils/log_util.dart';
import 'package:game_tv/services/api/api_response_wrapper.dart';
import 'package:game_tv/services/api/app_exception.dart';
import 'package:game_tv/services/api/service_manager.dart';

class GameTvRepository {
  ApiClient? _apiClient;

  GameTvRepository() {
    var dioClient = ServiceManager.get().getDioClient();
    _apiClient = ApiClient(dioClient);
  }

  Future<ApiResponseWrapper<UserInfo>> getUserDetails() async {
    try {
      var response = await _apiClient!.getUserDetail();
      return ApiResponseWrapper()..setData(mapToUserData(response));
    } on Exception catch (exception, stacktrace) {
      LogUtil().printLog(
          tag: 'Bluestack api exception', message: exception.toString());
      LogUtil().printLog(
          tag: 'Bluestack api exception', message: stacktrace.toString());
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }

  Future<ApiResponseWrapper<TournamentsInfo>> getRecommendedDetails(
      String? cursor) async {
    var response;
    try {
      if (cursor == null || cursor.isEmpty)
        response = await _apiClient!.getRecommendedData();
      else
        response = await _apiClient!.getRecommendedData(cursor: cursor);
      return ApiResponseWrapper()..setData(mapToTournament(response));
    } on Exception catch (exception, stacktrace) {
      LogUtil()
          .printLog(tag: 'gameTv api exception', message: exception.toString());
      LogUtil().printLog(
          tag: 'gameTv api exception', message: stacktrace.toString());
      return ApiResponseWrapper()..setException(ExceptionHandler(exception));
    }
  }
}
