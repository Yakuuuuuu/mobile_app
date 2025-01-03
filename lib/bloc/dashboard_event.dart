import 'package:equatable/equatable.dart';

abstract class DashboardEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ChangeTabEvent extends DashboardEvent {
  final int newIndex;

  ChangeTabEvent(this.newIndex);

  @override
  List<Object?> get props => [newIndex];
}
