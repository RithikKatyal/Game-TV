import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part '../events/signin_bloc_event.dart';
part '../states/signin_bloc_state.dart';

class SigninBlocBloc extends Bloc<SigninBlocEvent, SigninBlocState> {
  SigninBlocBloc() : super(SigninBlocInitial()) {
    on<SigninBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
