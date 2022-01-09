import 'package:flutter/material.dart';
import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/core_utils/screenutil.dart';

class RecommendedForYou extends StatefulWidget {
  final TournamentData tournamentData;
  const RecommendedForYou({Key? key, required this.tournamentData})
      : super(key: key);

  @override
  _RecommendedForYouState createState() => _RecommendedForYouState();
}

class _RecommendedForYouState extends State<RecommendedForYou> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.toWidth, right: 20.toWidth),
      child: Container(
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(10.toHeight)),
          child: Card(
            elevation: 5,
            child: Column(
              children: [
                Image(
                  image: NetworkImage('${widget.tournamentData.coverUrl}'),
                  height: 150.toHeight,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fill,
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      '${widget.tournamentData.gameName}',
                      style: TextStyle(fontSize: 20.toHeight),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
