part of 'navigation_bloc.dart';

@immutable
sealed class NavigationEvent {}

final class NavigationInitialEvent extends NavigationEvent{}

final class NavigationChangePageEvent extends NavigationEvent {
  NavigationChangePageEvent({required this.index});
  final int index;
}

final class NavigationShowActionSheetEvent extends NavigationEvent {}
