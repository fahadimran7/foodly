import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';
import 'test_helpers.mocks.dart';

@GenerateMocks([], customMocks: [
  MockSpec<UserService>(returnNullOnMissingStub: true),
  MockSpec<NavigationService>(returnNullOnMissingStub: true),
  MockSpec<PlacesService>(returnNullOnMissingStub: true),
])
UserService getAndRegisterUserService(
    {bool hasLoggedInUser = false, User? currentUser}) {
  _removeRegistrationIfExists<UserService>();
  final service = MockUserService();
  when(service.hasLoggedInUser).thenReturn(hasLoggedInUser);
  when(service.currentUser).thenReturn(currentUser ?? User(id: 'default_user'));
  locator.registerSingleton<UserService>(service);
  return service;
}

NavigationService getAndRegisterNavigationService() {
  _removeRegistrationIfExists<NavigationService>();
  final service = MockNavigationService();
  locator.registerSingleton<NavigationService>(service);
  return service;
}

PlacesService getAndRegisterPlacesService() {
  _removeRegistrationIfExists<PlacesService>();
  final service = MockPlacesService();
  locator.registerSingleton<PlacesService>(service);
  return service;
}

void registerServices() {
  getAndRegisterUserService();
  getAndRegisterNavigationService();
  getAndRegisterPlacesService();
}

void unregisterServices() {
  locator.unregister<UserService>();
  locator.unregister<NavigationService>();
}

void _removeRegistrationIfExists<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}
