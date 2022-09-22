import 'dart:developer';

import 'package:stacked/stacked.dart';

class BottomSheetViewModel extends BaseViewModel {
  final Map<String, dynamic> choices;
  final Map<String, dynamic> _choiceList = {};

  get choiceList => _choiceList;

  BottomSheetViewModel({required this.choices});

  setDefaultChoice() {
    choices.forEach((key, value) {
      _choiceList[key] = value[0];
    });
  }

  setChoiceOption(choiceGroup, value) {
    print('$choiceGroup is and choice is $value');
    _choiceList[choiceGroup] = value;
    notifyListeners();
  }
}
