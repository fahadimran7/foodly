// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, unused_import, non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../models/application_models.dart';
import '../ui/address_selection/address_selection_view.dart';
import '../ui/create_account/create_account_view.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view.dart';
import '../ui/onboarding/onboarding_view.dart';
import '../ui/restaurant_details/restaurant_details_view.dart';
import '../ui/restaurants_list/restaurants_list_view.dart';
import '../ui/startup/startup_view.dart';
import '../ui/update_password/update_password_view.dart';
import '../ui/user_profile/user_profile_view.dart';

class Routes {
  static const String startupView = '/';
  static const String addressSelectionView = '/address-selection-view';
  static const String createAccountView = '/create-account-view';
  static const String onboardingView = '/onboarding-view';
  static const String loginView = '/login-view';
  static const String homeView = '/home-view';
  static const String restaurantsListView = '/restaurants-list-view';
  static const String restaurantDetailsView = '/restaurant-details-view';
  static const String userProfileView = '/user-profile-view';
  static const String updatePasswordView = '/update-password-view';
  static const all = <String>{
    startupView,
    addressSelectionView,
    createAccountView,
    onboardingView,
    loginView,
    homeView,
    restaurantsListView,
    restaurantDetailsView,
    userProfileView,
    updatePasswordView,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startupView, page: StartupView),
    RouteDef(Routes.addressSelectionView, page: AddressSelectionView),
    RouteDef(Routes.createAccountView, page: CreateAccountView),
    RouteDef(Routes.onboardingView, page: OnboardingView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes.restaurantsListView, page: RestaurantsListView),
    RouteDef(Routes.restaurantDetailsView, page: RestaurantDetailsView),
    RouteDef(Routes.userProfileView, page: UserProfileView),
    RouteDef(Routes.updatePasswordView, page: UpdatePasswordView),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const StartupView(),
        settings: data,
      );
    },
    AddressSelectionView: (data) {
      var args = data.getArgs<AddressSelectionViewArguments>(
        orElse: () => AddressSelectionViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => AddressSelectionView(key: args.key),
        settings: data,
      );
    },
    CreateAccountView: (data) {
      var args = data.getArgs<CreateAccountViewArguments>(
        orElse: () => CreateAccountViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => CreateAccountView(key: args.key),
        settings: data,
      );
    },
    OnboardingView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const OnboardingView(),
        settings: data,
      );
    },
    LoginView: (data) {
      var args = data.getArgs<LoginViewArguments>(
        orElse: () => LoginViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => LoginView(key: args.key),
        settings: data,
      );
    },
    HomeView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const HomeView(),
        settings: data,
      );
    },
    RestaurantsListView: (data) {
      var args = data.getArgs<RestaurantsListViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RestaurantsListView(
          key: args.key,
          restaurantsList: args.restaurantsList,
          appBarText: args.appBarText,
        ),
        settings: data,
      );
    },
    RestaurantDetailsView: (data) {
      var args = data.getArgs<RestaurantDetailsViewArguments>(nullOk: false);
      return CupertinoPageRoute<dynamic>(
        builder: (context) => RestaurantDetailsView(
          key: args.key,
          restaurantDetails: args.restaurantDetails,
        ),
        settings: data,
      );
    },
    UserProfileView: (data) {
      var args = data.getArgs<UserProfileViewArguments>(
        orElse: () => UserProfileViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => UserProfileView(key: args.key),
        settings: data,
      );
    },
    UpdatePasswordView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const UpdatePasswordView(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// AddressSelectionView arguments holder class
class AddressSelectionViewArguments {
  final Key? key;
  AddressSelectionViewArguments({this.key});
}

/// CreateAccountView arguments holder class
class CreateAccountViewArguments {
  final Key? key;
  CreateAccountViewArguments({this.key});
}

/// LoginView arguments holder class
class LoginViewArguments {
  final Key? key;
  LoginViewArguments({this.key});
}

/// RestaurantsListView arguments holder class
class RestaurantsListViewArguments {
  final Key? key;
  final List<dynamic> restaurantsList;
  final String appBarText;
  RestaurantsListViewArguments(
      {this.key, required this.restaurantsList, required this.appBarText});
}

/// RestaurantDetailsView arguments holder class
class RestaurantDetailsViewArguments {
  final Key? key;
  final Restaurant restaurantDetails;
  RestaurantDetailsViewArguments({this.key, required this.restaurantDetails});
}

/// UserProfileView arguments holder class
class UserProfileViewArguments {
  final Key? key;
  UserProfileViewArguments({this.key});
}

/// ************************************************************************
/// Extension for strongly typed navigation
/// *************************************************************************

extension NavigatorStateExtension on NavigationService {
  Future<dynamic> navigateToStartupView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.startupView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToAddressSelectionView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.addressSelectionView,
      arguments: AddressSelectionViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToCreateAccountView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.createAccountView,
      arguments: CreateAccountViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToOnboardingView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.onboardingView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToLoginView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.loginView,
      arguments: LoginViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToHomeView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.homeView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRestaurantsListView({
    Key? key,
    required List<dynamic> restaurantsList,
    required String appBarText,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.restaurantsListView,
      arguments: RestaurantsListViewArguments(
          key: key, restaurantsList: restaurantsList, appBarText: appBarText),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToRestaurantDetailsView({
    Key? key,
    required Restaurant restaurantDetails,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.restaurantDetailsView,
      arguments: RestaurantDetailsViewArguments(
          key: key, restaurantDetails: restaurantDetails),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUserProfileView({
    Key? key,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.userProfileView,
      arguments: UserProfileViewArguments(key: key),
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }

  Future<dynamic> navigateToUpdatePasswordView({
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo(
      Routes.updatePasswordView,
      id: routerId,
      preventDuplicates: preventDuplicates,
      parameters: parameters,
      transition: transition,
    );
  }
}
