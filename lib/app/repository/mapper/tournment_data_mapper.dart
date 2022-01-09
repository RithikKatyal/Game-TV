import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/app/repository/model/tournament_response_model.dart';

TournamentsInfo mapToTournament(
    TournamentResponseModel tournamentResponseModel) {
  var model = TournamentsInfo()
    ..cursor = tournamentResponseModel.data?.cursor ?? ''
    ..isLastBatch = tournamentResponseModel.data?.isLastBatch ?? true
    ..tournamentData =
        mapToTournamentData(tournamentResponseModel.data?.tournaments ?? []);
  return model;
}

List<TournamentData> mapToTournamentData(List<Tournaments> tournaments) {
  List<TournamentData> tournamentData = [];
  for (var data in tournaments) {
    var model = TournamentData()
      ..coverUrl = data.coverUrl ?? ''
      ..name = data.name ?? ''
      ..gameName = data.gameName ?? ''
      ..tournamentSlug = data.tournamentSlug ?? '';
    tournamentData.add(model);
  }
  return tournamentData;
}
