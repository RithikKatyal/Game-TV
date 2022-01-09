part of '../provider/home_bloc.dart';

abstract class HomeBlocState {
  const HomeBlocState();
  
  @override
  List<Object> get props => [];
}

class HomeBlocGetUserDetailInitialState extends HomeBlocState {
   HomeBlocGetUserDetailInitialState();
}
class HomeBlocGetUserDetailCompletedState extends HomeBlocState {
  final UserInfo userInfo;
  HomeBlocGetUserDetailCompletedState({required this.userInfo});
}
class HomeBlocGetUserDetailErrorState extends HomeBlocState {
 HomeBlocGetUserDetailErrorState();
}
class HomeBlocGetRecommendedDetailInitialState extends HomeBlocState {
    HomeBlocGetRecommendedDetailInitialState();
}
class HomeBlocGetRecommendedDetailCompletedState extends HomeBlocState {
  final TournamentsInfo tournamentsInfo; 
  HomeBlocGetRecommendedDetailCompletedState({required this.tournamentsInfo});
}
class HomeBlocGetRecommendedDetailErrorState extends HomeBlocState {
 HomeBlocGetRecommendedDetailErrorState();
}

