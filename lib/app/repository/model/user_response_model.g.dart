// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponseModel _$UserResponseModelFromJson(Map<String, dynamic> json) {
  return UserResponseModel(
    json['id'] as String?,
    json['code'] as int?,
    json['msg'] as String?,
    json['UserData'] == null
        ? null
        : UserData.fromJson(json['UserData'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserResponseModelToJson(UserResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code': instance.code,
      'msg': instance.msg,
      'UserData': instance.userData,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    json['firstName'] as String?,
    json['lastName'] as String?,
    json['avatarName'] as String?,
    json['eloRating'] as int?,
    json['tournamentPlayed'] as int?,
    json['tournamentWon'] as int?,
  );
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'avatarName': instance.avatarName,
      'eloRating': instance.eloRating,
      'tournamentPlayed': instance.tournamentPlayed,
      'tournamentWon': instance.tournamentWon,
    };
