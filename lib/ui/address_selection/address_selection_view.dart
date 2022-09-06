import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/address_selection/address_selection_viewmodel.dart';

class AddressSelectionView extends StatelessWidget {
  const AddressSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      viewModelBuilder: () => AddressSelectionViewModel(),
      builder: (context, model, child) => const Scaffold(),
    );
  }
}
