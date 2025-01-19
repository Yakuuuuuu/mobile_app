import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hamroBooking/features/auth/domain/use_case/register_usecase.dart';
import 'register_event.dart';
import 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc({required RegisterUseCase registerUseCase})
      : _registerUseCase = registerUseCase,
        super(RegisterState.initial()) {
    on<RegisterStudentEvent>(_onRegisterStudent);
  }

  Future<void> _onRegisterStudent(
    RegisterStudentEvent event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.password != event.confirmPassword) {
      emit(state.copyWith(
        isLoading: false,
        isSuccess: false,
        errorMessage: "Passwords do not match",
      ));
      return;
    }

    emit(state.copyWith(isLoading: true, errorMessage: null));

    final result = await _registerUseCase.call(
      RegisterUserParams(
        email: event.email,
        password: event.password,
      ),
    );

    result.fold(
      (failure) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: false,
          errorMessage: failure.message ?? "Registration failed",
        ));
      },
      (success) {
        emit(state.copyWith(
          isLoading: false,
          isSuccess: true,
          errorMessage: null,
        ));
      },
    );
  }
}
