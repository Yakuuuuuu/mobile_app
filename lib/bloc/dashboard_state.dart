abstract class DashboardState {}

class DashboardInitialState extends DashboardState {}

class DashboardTabChangedState extends DashboardState {
  final int currentIndex;

  DashboardTabChangedState(this.currentIndex);
}
