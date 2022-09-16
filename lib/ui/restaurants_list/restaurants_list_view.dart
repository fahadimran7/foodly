import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/page_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/restaurants_list/components/restaurant_list_card.dart';
import 'package:stacked_architecture/ui/restaurants_list/restaurant_list_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({Key? key, required this.restaurantsList})
      : super(key: key);
  final List<dynamic> restaurantsList;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantListViewModel>.reactive(
      viewModelBuilder: () => RestaurantListViewModel(),
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
                left: kpscreenPaddingHorizontal,
                right: kpscreenPaddingHorizontal),
            child: Column(
              children: [
                PageTopBarSecondary(
                  title: 'Featured Partners',
                  onBackPressed: model.navigateBack,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: restaurantsList.length,
                    itemBuilder: (context, index) {
                      return RestaurantListCard(
                        restaurantDetails: restaurantsList[index],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
