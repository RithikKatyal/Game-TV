class TournamentsInfo {
  List<TournamentData>? tournamentData;
  String? cursor;
  bool? isLastBatch;
}

class TournamentData {
  String? name;
  String? coverUrl;
  String? gameName;
  String? tournamentSlug;
}
