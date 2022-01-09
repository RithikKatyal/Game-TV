import 'package:game_tv/app/repository/model/user_data.dart';
import 'package:game_tv/app/repository/model/user_response_model.dart';

UserInfo mapToUserData(UserResponseModel userResponseModel) {
  var model = UserInfo()
    ..avatarName = userResponseModel.userData?.avatarName ?? ''
    ..firstName = userResponseModel.userData?.firstName ?? ''
    ..lastName = userResponseModel.userData?.lastName ?? ''
    ..eloRating = userResponseModel.userData?.eloRating ?? 0
    ..tournamentPlayed = userResponseModel.userData?.tournamentPlayed ?? 0
    ..tournamentWon = userResponseModel.userData?.tournamentWon ?? 0;
  return model;
}
