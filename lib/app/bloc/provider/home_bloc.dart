import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:game_tv/app/repository/gametv_repository.dart';
import 'package:game_tv/app/repository/model/tournament_data.dart';
import 'package:game_tv/app/repository/model/tournament_response_model.dart';
import 'package:game_tv/app/repository/model/user_data.dart';
part '../events/home_bloc_event.dart';
part '../states/home_bloc_state.dart';

class HomeBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  final GameTvRepository gameTvRepository;
  HomeBloc({required this.gameTvRepository}) : super(HomeBlocGetUserDetailInitialState());

  @override
  Stream<HomeBlocState> mapEventToState(HomeBlocEvent event) async* {
    if(event is HomeBlocUserDetailEvent){
      yield HomeBlocGetUserDetailInitialState();
      try{
      var result = await gameTvRepository.getUserDetails();
      if (result.getData!=null)
      yield HomeBlocGetUserDetailCompletedState( userInfo: result.getData!);
      else
      yield HomeBlocGetUserDetailErrorState();
      } on Exception catch(_){
       yield HomeBlocGetUserDetailErrorState();
      } on Error catch (_){
        yield HomeBlocGetUserDetailErrorState();
      }
    } else  if(event is HomeBlocRecommendDetailEvent){
      if(event.cursor==null || event.cursor!.isEmpty){
      yield HomeBlocGetRecommendedDetailInitialState();
      }
      try{
      var result = await gameTvRepository.getRecommendedDetails(event.cursor);
      if (result.getData!=null)
      yield HomeBlocGetRecommendedDetailCompletedState( tournamentsInfo: result.getData!);
      else
      yield HomeBlocGetRecommendedDetailErrorState();
      } on Exception catch(_){
       yield HomeBlocGetRecommendedDetailErrorState();
      } on Error catch (_){
        yield HomeBlocGetRecommendedDetailErrorState();
      }
    }
  }
  }
