import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/no_glow_behaviour.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/page_top_bar_secondary.dart';
import 'package:stacked_architecture/ui/restaurants_list/components/restaurant_list_card.dart';
import 'package:stacked_architecture/ui/restaurants_list/restaurant_list_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView(
      {Key? key, required this.restaurantsList, required this.appBarText})
      : super(key: key);
  final List<dynamic> restaurantsList;
  final String appBarText;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantListViewModel>.reactive(
      viewModelBuilder: () => RestaurantListViewModel(),
      builder: (context, model, child) => ScrollConfiguration(
        behavior: NoGlowBehaviour(),
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: globalContentPadding, right: globalContentPadding),
              child: Column(
                children: [
                  PageTopBarSecondary(
                    title: appBarText,
                    onBackPressed: model.navigateBack,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: restaurantsList.length,
                      itemBuilder: (context, index) {
                        return RestaurantListCard(
                          handleOnTap: () => model.navigateToDetailsView(
                              restaurantDetails: restaurantsList[index]),
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
      ),
    );
  }
}
