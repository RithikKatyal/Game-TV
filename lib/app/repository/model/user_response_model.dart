import 'package:json_annotation/json_annotation.dart'; 
  
part 'user_response_model.g.dart';


@JsonSerializable()
  class UserResponseModel extends Object {

  @JsonKey(name: 'id')
  String ? id;

  @JsonKey(name: 'code')
  int ? code;

  @JsonKey(name: 'msg')
  String ? msg;

  @JsonKey(name: 'UserData')
  UserData ? userData;

  UserResponseModel(this.id,this.code,this.msg,this.userData,);

  factory UserResponseModel.fromJson(Map<String, dynamic> srcJson) => _$UserResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);

}

  
@JsonSerializable()
  class UserData extends Object {

  @JsonKey(name: 'firstName')
  String ? firstName;

  @JsonKey(name: 'lastName')
  String ? lastName;

  @JsonKey(name: 'avatarName')
  String ? avatarName;

  @JsonKey(name: 'eloRating')
  int ? eloRating;

  @JsonKey(name: 'tournamentPlayed')
  int ? tournamentPlayed;

  @JsonKey(name: 'tournamentWon')
  int ? tournamentWon;

  UserData(this.firstName,this.lastName,this.avatarName,this.eloRating,this.tournamentPlayed,this.tournamentWon,);

  factory UserData.fromJson(Map<String, dynamic> srcJson) => _$UserDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);

}

  
