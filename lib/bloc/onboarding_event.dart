abstract class OnboardingEvent {}

class NextSlideEvent extends OnboardingEvent {
  final int totalSlides;

  NextSlideEvent(this.totalSlides);
}

class PreviousSlideEvent extends OnboardingEvent {}

class UpdateSlideIndexEvent extends OnboardingEvent {
  final int newIndex;

  UpdateSlideIndexEvent(this.newIndex);
}
