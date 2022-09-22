import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/account_settings.dart/account_settings_view.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/bottom_navbar.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/no_glow_behaviour.dart';
import 'package:stacked_architecture/ui/home/home_viewmodel.dart';
import 'package:stacked_architecture/ui/orders/orders_view.dart';
import 'package:stacked_architecture/ui/restaurants_home/restaurants_home_view.dart';
import 'package:stacked_architecture/ui/search_restaurants/search_restaurants_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      builder: (context, model, child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: Scaffold(
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
            ),
          ),
        );
      },
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return const RestaurantsHomeView();
      case 1:
        return SearchRestaurantsView();
      case 2:
        return const OrderView();
      case 3:
        return const AccountSettingsView();
      default:
        return const RestaurantsHomeView();
    }
  }
}
