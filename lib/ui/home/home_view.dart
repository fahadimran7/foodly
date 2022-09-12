import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/bottom_navbar.dart';
import 'package:stacked_architecture/ui/featured_restaurants/featured_restaurants_view.dart';
import 'package:stacked_architecture/ui/home/home_viewmodel.dart';
import 'package:stacked_architecture/ui/orders/orders_view.dart';
import 'package:stacked_architecture/ui/search_restaurants/search_restaurants_view.dart';
import '../user_profile/user_profile_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          bottomNavigationBar: BottomNavBar(
            currentIndex: model.currentIndex,
            onNavItemTapped: model.setIndex,
          ),
          body: PageTransitionSwitcher(
            reverse: model.reverse,
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (Widget child,
                Animation<double> primaryAnimation,
                Animation<double> secondaryAnimation) {
              return SharedAxisTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal,
                child: child,
              );
            },
            child: getViewForIndex(model.currentIndex),
          ),
        );
      },
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const FeaturedRestaurantsView();
      case 1:
        return const SearchRestaurantsView();
      case 2:
        return const OrderView();
      case 3:
        return const UserProfileView();
      default:
        return const FeaturedRestaurantsView();
    }
  }
}
