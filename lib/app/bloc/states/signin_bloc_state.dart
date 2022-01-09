part of '../provider/signin_bloc.dart';

abstract class SigninBlocState extends Equatable {
  const SigninBlocState();
  
  @override
  List<Object> get props => [];
}

class SigninBlocInitial extends SigninBlocState {}
