part of 'navigation_bloc.dart';

final class NavigationState {
  NavigationState({ this.status, this.currentPageIndex});
  NavigationStatus? status;
  final int? currentPageIndex;
}

sealed class NavigationActionState extends NavigationState {}

final class NavigationShowActionSheetActionState extends NavigationActionState {}