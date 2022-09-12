import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/featured_restaurants/featured_restaurants_viewmodel.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class FeaturedRestaurantsView extends StatelessWidget {
  const FeaturedRestaurantsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeaturedRestaurantsViewModel>.reactive(
      viewModelBuilder: () => FeaturedRestaurantsViewModel(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onModelReady: (model) => model.getLocationForCurrentUser(),
      builder: (context, model, child) {
        if (!model.isBusy) {
          return SafeArea(
            child: Column(
              children: [
                verticalSpaceSmall,
                _buildTopRow(model.currentLocation)
              ],
            ),
          );
        }

        return const AppLoading();
      },
    );
  }
}

Widget _buildTopRow(String location) {
  return Row(
    children: [
      const Spacer(
        flex: 2,
      ),
      Column(
        children: [
          verticalSpaceSmall,
          const Text(
            'DELIVERY TO',
            style: TextStyle(
              fontSize: 11,
              color: kcPrimaryColor,
              letterSpacing: 0.45,
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpaceTiny,
          Text(
            location,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 21,
            ),
          ),
        ],
      ),
      const Spacer(),
      TextButton(
        onPressed: () {},
        child: const Text(
          'Filter',
          style: TextStyle(
            color: kcMediumGreyColor,
          ),
        ),
      )
    ],
  );
}
