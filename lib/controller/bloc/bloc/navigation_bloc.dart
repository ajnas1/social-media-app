import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:social_media_app/utilities/constants.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(status: NavigationStatus.initial,currentPageIndex: 0)) {
    on<NavigationInitialEvent>(navigationInitialEvent);
    on<NavigationChangePageEvent>(navigationChangePageEvent);
    on<NavigationShowActionSheetEvent>(navigationShowActionSheetEvent);
  }
  FutureOr<void> navigationInitialEvent(NavigationEvent event, Emitter<NavigationState> emit) async {
     emit(NavigationState(status: NavigationStatus.loading,currentPageIndex: 0));
     await Future.delayed(const Duration(seconds: 3));
     emit(NavigationState(status: NavigationStatus.loaded,currentPageIndex: 0));
  }
  FutureOr<void> navigationChangePageEvent(NavigationChangePageEvent event, Emitter<NavigationState> emit) async {
     emit(NavigationState(status: NavigationStatus.loaded,currentPageIndex: event.index));
  }
  FutureOr<void> navigationShowActionSheetEvent(NavigationShowActionSheetEvent event, Emitter<NavigationState> emit) async {
    //  emit(NavigationState(status: NavigationStatus.loaded,currentPageIndex: event.index));
     emit(NavigationShowActionSheetActionState());
  }
}
