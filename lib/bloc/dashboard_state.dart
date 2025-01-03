import 'package:equatable/equatable.dart';

abstract class DashboardState extends Equatable {
  @override
  List<Object?> get props => [];
}

class DashboardInitialState extends DashboardState {}

class DashboardTabChangedState extends DashboardState {
  final int currentIndex;

  DashboardTabChangedState(this.currentIndex);

  @override
  List<Object?> get props => [currentIndex];
}
