import 'package:json_annotation/json_annotation.dart'; 
  
part 'tournament_response_model.g.dart';


@JsonSerializable()
  class TournamentResponseModel extends Object {

  @JsonKey(name: 'code')
  int ? code;

  @JsonKey(name: 'data')
  Data ? data;

  @JsonKey(name: 'success')
  bool ? success;

  TournamentResponseModel(this.code,this.data,this.success,);

  factory TournamentResponseModel.fromJson(Map<String, dynamic> srcJson) => _$TournamentResponseModelFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TournamentResponseModelToJson(this);

}

  
@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'cursor')
  String ? cursor;

  @JsonKey(name: 'tournaments')
  List<Tournaments> ? tournaments;

  @JsonKey(name: 'is_last_batch')
  bool ? isLastBatch;

  Data(this.cursor,this.tournaments,this.isLastBatch,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}

  
@JsonSerializable()
  class Tournaments extends Object {

  @JsonKey(name: 'is_check_in_required')
  bool ? isCheckInRequired;

  @JsonKey(name: 'tournament_id')
  String ? tournamentId;

  @JsonKey(name: 'tournament_ended')
  bool ? tournamentEnded;

  @JsonKey(name: 'tournament_end_date')
  String ? tournamentEndDate;

  @JsonKey(name: 'are_random_teams_allowed')
  bool ? areRandomTeamsAllowed;

  @JsonKey(name: 'registered_teams')
  int ? registeredTeams;

  @JsonKey(name: 'admin_locale')
  String ? adminLocale;

  @JsonKey(name: 'reg_end_date')
  String ? regEndDate;

  @JsonKey(name: 'start_date')
  String ? startDate;

  @JsonKey(name: 'rules')
  String ? rules;

  @JsonKey(name: 'max_teams')
  int ? maxTeams;

  @JsonKey(name: 'tournament_url')
  String ? tournamentUrl;

  @JsonKey(name: 'prizes')
  String ? prizes;

  @JsonKey(name: 'match_style_type')
  String ? matchStyleType;

  @JsonKey(name: 'tournament_type')
  String ? tournamentType;

  @JsonKey(name: 'geo')
  String ? geo;

  @JsonKey(name: 'is_password_required')
  bool ? isPasswordRequired;

  @JsonKey(name: 'name')
  String ? name;

  @JsonKey(name: 'match_style')
  String ? matchStyle;

  @JsonKey(name: 'registration_url')
  String ? registrationUrl;

  @JsonKey(name: 'is_registration_open')
  bool ? isRegistrationOpen;

  @JsonKey(name: 'is_waitlist_enabled')
  bool ? isWaitlistEnabled;

  @JsonKey(name: 'incomplete_teams_allowed')
  bool ? incompleteTeamsAllowed;

  @JsonKey(name: 'is_auto_result_allowed')
  bool ? isAutoResultAllowed;

  @JsonKey(name: 'team_size')
  int ? teamSize;

  @JsonKey(name: 'status')
  String ? status;

  @JsonKey(name: 'is_levels_enabled')
  bool ? isLevelsEnabled;

  @JsonKey(name: 'index_page')
  bool ? indexPage;

  @JsonKey(name: 'dynamic_app_url')
  String ? dynamicAppUrl;

  @JsonKey(name: 'game_format')
  String ? gameFormat;

  @JsonKey(name: 'details')
  String ? details;

  @JsonKey(name: 'game_icon_url')
  String ? gameIconUrl;

  @JsonKey(name: 'reg_start_date')
  String ? regStartDate;

  @JsonKey(name: 'cover_url')
  String ? coverUrl;

  @JsonKey(name: 'tournament_slug')
  String ? tournamentSlug;

  @JsonKey(name: 'discord_url')
  String ? discordUrl;

  @JsonKey(name: 'game_id')
  String ? gameId;

  @JsonKey(name: 'result_submission_by_admin')
  bool ? resultSubmissionByAdmin;

  @JsonKey(name: 'country')
  String ? country;

  @JsonKey(name: 'admin_username')
  String ? adminUsername;

  @JsonKey(name: 'game_name')
  String ? gameName;

  @JsonKey(name: 'stream_url')
  String ? streamUrl;

  Tournaments(this.isCheckInRequired,this.tournamentId,this.tournamentEnded,this.tournamentEndDate,this.areRandomTeamsAllowed,this.registeredTeams,this.adminLocale,this.regEndDate,this.startDate,this.rules,this.maxTeams,this.tournamentUrl,this.prizes,this.matchStyleType,this.tournamentType,this.geo,this.isPasswordRequired,this.name,this.matchStyle,this.registrationUrl,this.isRegistrationOpen,this.isWaitlistEnabled,this.incompleteTeamsAllowed,this.isAutoResultAllowed,this.teamSize,this.status,this.isLevelsEnabled,this.indexPage,this.dynamicAppUrl,this.gameFormat,this.details,this.gameIconUrl,this.regStartDate,this.coverUrl,this.tournamentSlug,this.discordUrl,this.gameId,this.resultSubmissionByAdmin,this.country,this.adminUsername,this.gameName,this.streamUrl,);

  factory Tournaments.fromJson(Map<String, dynamic> srcJson) => _$TournamentsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TournamentsToJson(this);

}

  
