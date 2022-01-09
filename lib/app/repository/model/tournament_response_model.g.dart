// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentResponseModel _$TournamentResponseModelFromJson(
    Map<String, dynamic> json) {
  return TournamentResponseModel(
    json['code'] as int?,
    json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    json['success'] as bool?,
  );
}

Map<String, dynamic> _$TournamentResponseModelToJson(
        TournamentResponseModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'success': instance.success,
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
    json['cursor'] as String?,
    (json['tournaments'] as List<dynamic>?)
        ?.map((e) => Tournaments.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['is_last_batch'] as bool?,
  );
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'cursor': instance.cursor,
      'tournaments': instance.tournaments,
      'is_last_batch': instance.isLastBatch,
    };

Tournaments _$TournamentsFromJson(Map<String, dynamic> json) {
  return Tournaments(
    json['is_check_in_required'] as bool?,
    json['tournament_id'] as String?,
    json['tournament_ended'] as bool?,
    json['tournament_end_date'] as String?,
    json['are_random_teams_allowed'] as bool?,
    json['registered_teams'] as int?,
    json['admin_locale'] as String?,
    json['reg_end_date'] as String?,
    json['start_date'] as String?,
    json['rules'] as String?,
    json['max_teams'] as int?,
    json['tournament_url'] as String?,
    json['prizes'] as String?,
    json['match_style_type'] as String?,
    json['tournament_type'] as String?,
    json['geo'] as String?,
    json['is_password_required'] as bool?,
    json['name'] as String?,
    json['match_style'] as String?,
    json['registration_url'] as String?,
    json['is_registration_open'] as bool?,
    json['is_waitlist_enabled'] as bool?,
    json['incomplete_teams_allowed'] as bool?,
    json['is_auto_result_allowed'] as bool?,
    json['team_size'] as int?,
    json['status'] as String?,
    json['is_levels_enabled'] as bool?,
    json['index_page'] as bool?,
    json['dynamic_app_url'] as String?,
    json['game_format'] as String?,
    json['details'] as String?,
    json['game_icon_url'] as String?,
    json['reg_start_date'] as String?,
    json['cover_url'] as String?,
    json['tournament_slug'] as String?,
    json['discord_url'] as String?,
    json['game_id'] as String?,
    json['result_submission_by_admin'] as bool?,
    json['country'] as String?,
    json['admin_username'] as String?,
    json['game_name'] as String?,
    json['stream_url'] as String?,
  );
}

Map<String, dynamic> _$TournamentsToJson(Tournaments instance) =>
    <String, dynamic>{
      'is_check_in_required': instance.isCheckInRequired,
      'tournament_id': instance.tournamentId,
      'tournament_ended': instance.tournamentEnded,
      'tournament_end_date': instance.tournamentEndDate,
      'are_random_teams_allowed': instance.areRandomTeamsAllowed,
      'registered_teams': instance.registeredTeams,
      'admin_locale': instance.adminLocale,
      'reg_end_date': instance.regEndDate,
      'start_date': instance.startDate,
      'rules': instance.rules,
      'max_teams': instance.maxTeams,
      'tournament_url': instance.tournamentUrl,
      'prizes': instance.prizes,
      'match_style_type': instance.matchStyleType,
      'tournament_type': instance.tournamentType,
      'geo': instance.geo,
      'is_password_required': instance.isPasswordRequired,
      'name': instance.name,
      'match_style': instance.matchStyle,
      'registration_url': instance.registrationUrl,
      'is_registration_open': instance.isRegistrationOpen,
      'is_waitlist_enabled': instance.isWaitlistEnabled,
      'incomplete_teams_allowed': instance.incompleteTeamsAllowed,
      'is_auto_result_allowed': instance.isAutoResultAllowed,
      'team_size': instance.teamSize,
      'status': instance.status,
      'is_levels_enabled': instance.isLevelsEnabled,
      'index_page': instance.indexPage,
      'dynamic_app_url': instance.dynamicAppUrl,
      'game_format': instance.gameFormat,
      'details': instance.details,
      'game_icon_url': instance.gameIconUrl,
      'reg_start_date': instance.regStartDate,
      'cover_url': instance.coverUrl,
      'tournament_slug': instance.tournamentSlug,
      'discord_url': instance.discordUrl,
      'game_id': instance.gameId,
      'result_submission_by_admin': instance.resultSubmissionByAdmin,
      'country': instance.country,
      'admin_username': instance.adminUsername,
      'game_name': instance.gameName,
      'stream_url': instance.streamUrl,
    };
