import 'package:flutter_bloc/flutter_bloc.dart';

import 'dashboard_event.dart';
import 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardInitialState()) {
    on<ChangeTabEvent>((event, emit) {
      emit(DashboardTabChangedState(event.newIndex));
    });
  }
}
