import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/api/firestore_api.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/services/user_service.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.logger.dart';
import '../../app/app.router.dart';
import 'address_selection_view.form.dart';

class AddressSelectionViewModel extends FormViewModel {
  final log = getLogger('AddressSelectionViewModel');

  final _placesService = locator<PlacesService>();
  final _dialogService = locator<DialogService>();
  final _fireStoreApi = locator<FirestoreApi>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];
  PlacesAutoCompleteResult? _selectedResult;

  bool get hasSelectedPlace => _selectedResult != null;

  List<PlacesAutoCompleteResult> get autoCompleteResults =>
      _autoCompleteResults;

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (addressValue != '') {
      final placesResult = await _placesService.getAutoComplete(addressValue!);

      if (placesResult.isNotEmpty) {
        _autoCompleteResults = placesResult;
        notifyListeners();
      }
    }
  }

  Future<void> selectAddressSuggestion({
    PlacesAutoCompleteResult? autoCompleteResult,
  }) async {
    final selectedResult = autoCompleteResult ?? _selectedResult!;

    log.i('Selected $autoCompleteResult as suggestion');

    if (selectedResult.placeId == null) {
      _dialogService.showDialog(
        title: 'Invalid address',
        description:
            'We currently do not have service at the specified address. Please try again later or select a different address.',
      );
    } else {
      setBusy(true);

      final placeDetails = await _placesService.getPlaceDetails(
        selectedResult.placeId ?? '',
      );

      log.v('Place details: $placeDetails');

      final address = Address(
          placeId: placeDetails.placeId!,
          lattitude: placeDetails.lat ?? -1,
          longitude: placeDetails.lng ?? -1,
          city: placeDetails.city,
          postalCode: placeDetails.zip,
          state: placeDetails.state,
          street: placeDetails.streetLong ?? placeDetails.streetShort);

      final user = _userService.currentUser;

      final saveSuccess =
          await _fireStoreApi.saveAddress(address: address, user: user);

      if (!saveSuccess) {
        log.v('Address save failed. Notify user to try again...');
        _dialogService.showDialog(
          title: 'Address save failed',
          description:
              'We were not able to save the address you\'ve selected. Sorry for the inconvenience.',
        );
      } else {
        log.v('Address saved successfully. Redirecting to the home view');
        _navigationService.clearStackAndShow(Routes.homeView);
      }

      setBusy(false);
    }
  }

  void setSelectedSuggestion(PlacesAutoCompleteResult autoCompleteResult) {
    log.i('autoCompleteResult: $autoCompleteResults');
    _selectedResult = autoCompleteResult;

    _autoCompleteResults.clear();

    notifyListeners();
  }
}
