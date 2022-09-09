// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs,  constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String AddressValueKey = 'address';

final Map<String, TextEditingController>
    _AddressSelectionViewTextEditingControllers = {};

final Map<String, FocusNode> _AddressSelectionViewFocusNodes = {};

final Map<String, String? Function(String?)?>
    _AddressSelectionViewTextValidations = {
  AddressValueKey: null,
};

mixin $AddressSelectionView on StatelessWidget {
  TextEditingController get addressController =>
      _getFormTextEditingController(AddressValueKey);
  FocusNode get addressFocusNode => _getFormFocusNode(AddressValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_AddressSelectionViewTextEditingControllers.containsKey(key)) {
      return _AddressSelectionViewTextEditingControllers[key]!;
    }
    _AddressSelectionViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _AddressSelectionViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_AddressSelectionViewFocusNodes.containsKey(key)) {
      return _AddressSelectionViewFocusNodes[key]!;
    }
    _AddressSelectionViewFocusNodes[key] = FocusNode();
    return _AddressSelectionViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void listenToFormUpdated(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          AddressValueKey: addressController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        AddressValueKey: _getValidationMessage(AddressValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _AddressSelectionViewTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey =
        validatorForKey(_AddressSelectionViewTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _AddressSelectionViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _AddressSelectionViewFocusNodes.values) {
      focusNode.dispose();
    }

    _AddressSelectionViewTextEditingControllers.clear();
    _AddressSelectionViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get addressValue => this.formValueMap[AddressValueKey] as String?;

  bool get hasAddress => this.formValueMap.containsKey(AddressValueKey);

  bool get hasAddressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey]?.isNotEmpty ?? false;

  String? get addressValidationMessage =>
      this.fieldsValidationMessages[AddressValueKey];
}

extension Methods on FormViewModel {
  setAddressValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[AddressValueKey] = validationMessage;
}
