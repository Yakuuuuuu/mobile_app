import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repositories/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitialState()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.login(event.email, event.password);
        emit(AuthSuccessState(user));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });

    on<SignupEvent>((event, emit) async {
      emit(AuthLoadingState());
      try {
        final user = await authRepository.signup(
            event.name, event.email, event.password);
        emit(AuthSuccessState(user));
      } catch (e) {
        emit(AuthErrorState(e.toString()));
      }
    });
  }
}
