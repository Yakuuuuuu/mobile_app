import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'onboarding_event.dart';
import 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final PageController pageController;

  OnboardingBloc(this.pageController) : super(OnboardingInitialState(0)) {
    on<NextSlideEvent>((event, emit) {
      final currentIndex = (state is OnboardingSlideChangedState)
          ? (state as OnboardingSlideChangedState).currentIndex
          : (state as OnboardingInitialState).currentIndex;

      if (currentIndex < event.totalSlides - 1) {
        pageController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        emit(OnboardingSlideChangedState(currentIndex + 1));
      }
    });

    on<PreviousSlideEvent>((event, emit) {
      final currentIndex = (state is OnboardingSlideChangedState)
          ? (state as OnboardingSlideChangedState).currentIndex
          : (state as OnboardingInitialState).currentIndex;

      if (currentIndex > 0) {
        pageController.previousPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.ease,
        );
        emit(OnboardingSlideChangedState(currentIndex - 1));
      }
    });

    on<UpdateSlideIndexEvent>((event, emit) {
      emit(OnboardingSlideChangedState(event.newIndex));
    });
  }
}
