import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.router.dart';

class OnboardingViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  int _currentPage = 0;

  final List<Map<String, String>> _splashData = [
    {
      "title": "All your favorites",
      "text":
          "Order from the best local restaurants with easy, on-demand delivery.",
      "image": "assets/images/onboarding-1.png",
    },
    {
      "title": "Free delivery offers",
      "text":
          "Free delivery for new customers via Apple Pay and others payment methods.",
      "image": "assets/images/onboarding-2.png",
    },
    {
      "title": "Choose your food",
      "text":
          "Easily find your type of food craving and you’ll get delivery in wide range.",
      "image": "assets/images/onboarding-3.png",
    },
  ];

  int get currentPage => _currentPage;

  List<Map<String, String>> get splashData => _splashData;

  setCurrentPage(int page) {
    _currentPage = page;
    notifyListeners();
  }

  void navigateToLogin() => _navigationService.navigateTo(Routes.loginView);
}
