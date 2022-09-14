import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/address_selection/address_selection_viewmodel.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/block_button.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

import 'address_selection_view.form.dart';

@FormView(fields: [
  FormTextField(
    name: 'address',
  )
])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      onDispose: (model) => disposeForm(),
      viewModelBuilder: () => AddressSelectionViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kpscreenPaddingHorizontal,
                  right: kpscreenPaddingHorizontal,
                  bottom: kpscreenPaddingVertical),
              child: Column(
                children: [
                  verticalSpaceLarge,
                  const Text(
                    'Find restaurants near you',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: kH3Title,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalSpaceRegular,
                  const Text(
                    'Please enter your location or allow access to your location to find restaurants near you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kcMediumGreyColor, height: 1.4),
                  ),
                  verticalSpaceMedium,
                  TextField(
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      suffixIcon: IconButton(
                        onPressed: () => addressController.clear(),
                        icon: const Icon(Icons.clear),
                      ),
                      prefixIcon: const Icon(Icons.location_on_rounded),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        ),
                      ),
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          style: BorderStyle.solid,
                          color: kcPrimaryColor,
                        ),
                      ),
                      hintText: 'Enter a new address',
                      fillColor: kcLightGreyColor,
                      filled: true,
                    ),
                    controller: addressController,
                  ),
                  verticalSpaceRegular,
                  if (!model.hasSelectedPlace &&
                      !model.hasAddress &&
                      !model.isBusy)
                    Column(
                      children: const [
                        Text(
                          'We currently have no suggestions for you :(',
                          style: TextStyle(
                            color: kcMediumGreyColor,
                          ),
                        ),
                      ],
                    ),
                  if (model.hasAutoCompleteResults && !model.isBusy)
                    for (var autoCompleteResult in model.autoCompleteResults)
                      Column(
                        children: [
                          ListTile(
                              leading:
                                  const FaIcon(FontAwesomeIcons.locationArrow),
                              title: Text(autoCompleteResult.mainText ?? ''),
                              subtitle: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                    autoCompleteResult.secondaryText ?? ''),
                              ),
                              onTap: () {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');
                                model.setSelectedSuggestion(autoCompleteResult);
                                addressController.text =
                                    "${autoCompleteResult.mainText}";
                              }),
                          const Divider(
                            height: 3,
                            indent: 22,
                          )
                        ],
                      ),
                  if (model.isBusy)
                    Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          verticalSpaceMedium,
                          Text(
                            'Saving your address...',
                            style: TextStyle(color: kcMediumGreyColor),
                          ),
                          verticalSpaceRegular,
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(kcPrimaryColor),
                          )
                        ],
                      ),
                    ),
                  verticalSpaceMedium,
                  BlockButton(
                    onPressed: model.hasSelectedPlace
                        ? () => model.selectAddressSuggestion()
                        : () {},
                    title: 'Continue',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
