abstract class DashboardEvent {}

class ChangeTabEvent extends DashboardEvent {
  final int newIndex;

  ChangeTabEvent(this.newIndex);
}
