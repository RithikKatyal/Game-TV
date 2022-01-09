part of '../provider/home_bloc.dart';

abstract class HomeBlocEvent extends Equatable {
  const HomeBlocEvent();
  @override
  List<Object> get props => [];
}

class HomeBlocUserDetailEvent extends HomeBlocEvent {
  HomeBlocUserDetailEvent();
}

class HomeBlocRecommendDetailEvent extends HomeBlocEvent {
  final String? cursor;
  HomeBlocRecommendDetailEvent({this.cursor});
}
