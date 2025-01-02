import 'package:mobile_app/data/model/onboarding_slide_model.dart';

class OnboardingRepository {
  List<OnboardingSlideModel> getSlides() {
    return [
      OnboardingSlideModel(
        title: 'Welcome to Hamro Booking',
        description: 'Your travel companion!',
      ),
      OnboardingSlideModel(
        title: 'Find the Best Hotels',
        description: 'Get the best deals at the best prices.',
      ),
      OnboardingSlideModel(
        title: 'Explore Destinations',
        description: 'Discover your dream destinations effortlessly.',
      ),
      OnboardingSlideModel(
        title: 'Enjoy Luxurious Comfort',
        description: 'Experience unparalleled comfort and luxury.',
      ),
    ];
  }
}
