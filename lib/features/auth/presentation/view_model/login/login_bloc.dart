import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamroBooking/app/di/di.dart';
import 'package:hamroBooking/features/auth/domain/use_case/login_usecase.dart';
import 'package:hamroBooking/features/auth/presentation/view_model/register/register_bloc.dart';
import 'package:hamroBooking/features/home/presentation/view/home.dart';
import 'package:hamroBooking/features/home/presentation/view_model/home_cubit.dart';


part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;

  LoginBloc({required LoginUseCase loginUseCase, required HomeCubit homeCubit})
      : _loginUseCase = loginUseCase,
        super(LoginState.initial()) {
    // Handle Login Event
    on<LoginStudentEvent>((event, emit) async {
      emit(state.copyWith(isLoading: true));

      final result = await _loginUseCase(
        LoginParams(
          email: event.username,
          password: event.password,
        ),
      );

      result.fold(
        (failure) {
          emit(state.copyWith(isLoading: false, isSuccess: false));
          ScaffoldMessenger.of(event.context).showSnackBar(
            const SnackBar(
              content: Text('Invalid Credentials'),
              backgroundColor: Colors.red,
            ),
          );
        },
        (success) {
          emit(state.copyWith(isLoading: false, isSuccess: true));
          Navigator.pushReplacement(
            event.context,
            MaterialPageRoute(
              builder: (context) => const Dashboard(),
            ),
          );
        },
      );
    });

    // Handle Navigation to Register Screen
    on<NavigateRegisterScreenEvent>((event, emit) {
      Navigator.push(
        event.context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<RegisterBloc>(),
            child: event.destination,
          ),
        ),
      );
    });
  }
}
