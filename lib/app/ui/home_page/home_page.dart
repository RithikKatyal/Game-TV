import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:game_tv/app/bloc/provider/home_bloc.dart';
import 'package:game_tv/app/repository/gametv_repository.dart';
import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/app/ui/home_page/widgets/recommended_for_you.dart';
import 'package:game_tv/core_utils/screenutil.dart';
import 'package:game_tv/utils/strings/app_translations.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeBloc? homeBloc;
  GameTvRepository? gameTvRepository;
  List<TournamentData> list = [];
  ScrollController scrollController = ScrollController();
  bool isLast = true;
  String? cursor;
  @override
  void initState() {
    gameTvRepository = GameTvRepository();
    homeBloc = HomeBloc(gameTvRepository: gameTvRepository!);
    homeBloc!.add(HomeBlocUserDetailEvent());
    homeBloc!.add(HomeBlocRecommendDetailEvent(cursor: null));
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!isLast)
          homeBloc!.add(HomeBlocRecommendDetailEvent(
              cursor: cursor)); //fetch more tournaments
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeBlocState>(
        bloc: homeBloc,
        buildWhen: (prev, curr) {
          if (curr is HomeBlocGetUserDetailCompletedState ||
              curr is HomeBlocGetUserDetailErrorState ||
              curr is HomeBlocGetUserDetailInitialState) return true;
          return false;
        },
        builder: (context, state) {
          if (state is HomeBlocGetUserDetailCompletedState) {
            var data = state.userInfo;
            var wonPercentage =
                ((data.tournamentWon!) / (data.tournamentPlayed)! * 100)
                    .toStringAsFixed(2);
            return Scaffold(
              appBar: AppBar(
                  backgroundColor: Colors.white,
                  centerTitle: true,
                  title: Text(
                    data.avatarName!,
                    style: TextStyle(color: Colors.black),
                  )),
              body: SingleChildScrollView(
                controller: scrollController,
                physics: AlwaysScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.toHeight, left: 20.toWidth),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                child: Image(
                                  image: AssetImage('assets/Snake.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                data.firstName! + data.lastName!,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                // margin: EdgeInsets.all(90),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: Text('${data.eloRating}' +
                                      '  ' +
                                      Translations.getInstance
                                          .text(Translations.kEloRating)!),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.toHeight, left: 20.toWidth),
                      child: Row(
                        children: [
                          Container(
                            width: 110.toWidth,
                            height: 80.toHeight,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.orangeAccent,
                                    Colors.redAccent.withOpacity(.7),
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.toHeight),
                                    bottomLeft: Radius.circular(10.toHeight))),
                            child: Center(
                                child: Text(
                              '${data.tournamentPlayed}' +
                                  '\n' +
                                  Translations.getInstance
                                      .text(Translations.kTournamentsPlayed)!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          Container(
                            width: 110.toWidth,
                            height: 80.toHeight,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topRight,
                                end: Alignment.topLeft,
                                colors: [
                                  Colors.purpleAccent,
                                  Colors.deepPurpleAccent.withOpacity(.7),
                                ],
                              ),
                            ),
                            child: Center(
                                child: Text(
                              '${data.tournamentWon}' +
                                  '\n' +
                                  Translations.getInstance
                                      .text(Translations.kTournamentWon)!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                          Container(
                            width: 110.toWidth,
                            height: 80.toHeight,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.topLeft,
                                  colors: [
                                    Colors.redAccent,
                                    Colors.deepOrangeAccent
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.toHeight),
                                    bottomRight: Radius.circular(10.toHeight))),
                            child: Center(
                                child: Text(
                              '${wonPercentage}' +
                                  '\n' +
                                  Translations.getInstance
                                      .text(Translations.kWinningPercentage)!,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: 20.toHeight,
                          left: 20.toWidth,
                          bottom: 20.toWidth),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            Translations.getInstance
                                .text(Translations.kRecommendedForYou)!,
                            style: TextStyle(fontSize: 20.toHeight),
                          )),
                    ),
                    BlocBuilder<HomeBloc, HomeBlocState>(
                      bloc: homeBloc,
                      buildWhen: (prev, curr) {
                        if (curr
                                is HomeBlocGetRecommendedDetailCompletedState ||
                            curr is HomeBlocGetRecommendedDetailErrorState ||
                            curr is HomeBlocGetRecommendedDetailInitialState)
                          return true;
                        return false;
                      },
                      builder: (context, state) {
                        if (state
                            is HomeBlocGetRecommendedDetailCompletedState) {
                          var data = state.tournamentsInfo.tournamentData;
                          if (list.isEmpty)
                            list = data!;
                          else {
                            data!.forEach((element) {
                              list.add(element);
                            });
                          }
                          isLast = state.tournamentsInfo.isLastBatch!;
                          cursor = state.tournamentsInfo.cursor;
                          return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: list.length + 1,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == list.length) {
                                if (!isLast) {
                                  return SpinKitRotatingCircle(
                                    color: Colors.blue,
                                  );
                                } else {
                                  return SizedBox.shrink();
                                }
                              } else {
                                return RecommendedForYou(
                                  tournamentData: list[index],
                                );
                              }
                            },
                          );
                        } else if (state
                            is HomeBlocGetRecommendedDetailErrorState) {
                          return Scaffold(
                              body: Container(
                            child: Text(Translations.getInstance
                                .text(Translations.kSomethingWentWrong)!),
                          ));
                        } else {
                          return SpinKitChasingDots(color: Colors.orangeAccent);
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is HomeBlocGetUserDetailErrorState) {
            return Scaffold(
                body: Container(
              child: Text(Translations.getInstance
                  .text(Translations.kSomethingWentWrong)!),
            ));
          } else {
            return Scaffold(
                body: SpinKitDoubleBounce(
              color: Colors.red,
            ));
          }
        });
  }
}
