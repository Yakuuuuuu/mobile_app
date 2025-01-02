abstract class OnboardingState {}

class OnboardingInitialState extends OnboardingState {
  final int currentIndex;

  OnboardingInitialState(this.currentIndex);
}

class OnboardingSlideChangedState extends OnboardingState {
  final int currentIndex;

  OnboardingSlideChangedState(this.currentIndex);
}
