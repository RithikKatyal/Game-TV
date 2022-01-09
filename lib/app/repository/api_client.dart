import 'package:dio/dio.dart';
import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/app/repository/model/tournament_response_model.dart';
import 'package:game_tv/app/repository/model/user_response_model.dart';
import 'package:game_tv/utils/constants.dart';

import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio,
  ) {
    return _ApiClient(dio);
  }

  @GET(GameTvConstants.kUserDetail)
  Future<UserResponseModel> getUserDetail();

  @GET(GameTvConstants.kRecommendedDetail)
  Future<TournamentResponseModel> getRecommendedData({@Query('cursor') String ? cursor}); 
}
