import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeState.initial());

  void selectTab(int index) {
    emit(state.copyWith(selectedIndex: index));
  }
}
