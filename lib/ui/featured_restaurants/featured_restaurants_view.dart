import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/editors_pick_restaurant_card.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/featured_restaurant_card.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/featured_screen_header.dart';
import 'package:stacked_architecture/ui/featured_restaurants/featured_restaurants_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
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
      onModelReady: (model) => model.initialize(),
      builder: (context, model, child) {
        if (!model.isBusy) {
          final featuredRestaurants =
              model.featuredRestaurants as List<Restaurant>;
          final editorsPickRestaurants =
              model.editorsPickRestaurants as List<Restaurant>;

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: kpscreenPaddingHorizontal,
                  right: kpscreenPaddingHorizontal),
              child: Column(
                children: [
                  verticalSpaceSmall,
                  FeaturedScreenHeader(location: model.currentLocation),
                  verticalSpaceTiny,
                  const Divider(),
                  verticalSpaceSmall,
                  Expanded(
                    child: ListView(
                      children: [
                        SizedBox(
                          height:
                              screenHeightPercentage(context, percentage: 0.26),
                          child: PageView.builder(
                            controller: model.pageController,
                            itemCount: 3,
                            pageSnapping: true,
                            onPageChanged: (page) => model.setCurrentPage(page),
                            itemBuilder: (context, pagePosition) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: _buildBannerCard(
                                    context, model.imagesList[pagePosition]),
                              );
                            },
                          ),
                        ),
                        verticalSpaceRegular,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Featured Partners',
                              style: TextStyle(
                                fontSize: kH4Title,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  model.navigateToFeaturedRestaurantsListView(),
                              child: const Text('See all'),
                            )
                          ],
                        ),
                        verticalSpaceRegular,
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.separated(
                            itemCount: featuredRestaurants.length > 5
                                ? 5
                                : featuredRestaurants.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return horizontalSpaceRegular;
                            },
                            itemBuilder: (BuildContext context, int index) =>
                                FeaturedRestaurantCard(
                              restaurantDetails: featuredRestaurants[index],
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Best Picks \nRestaurants by team',
                              style: TextStyle(
                                fontSize: kH4Title,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.5,
                              ),
                            ),
                            TextButton(
                                onPressed: () => model
                                    .navigateToEditorsPickRestaurantsListView(),
                                child: const Text('See all'))
                          ],
                        ),
                        verticalSpaceRegular,
                        SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: ListView.separated(
                            itemCount: editorsPickRestaurants.length,
                            scrollDirection: Axis.horizontal,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return horizontalSpaceRegular;
                            },
                            itemBuilder: (BuildContext context, int index) =>
                                EditorsPickRestaurantCard(
                              restaurantDetails: editorsPickRestaurants[index],
                            ),
                          ),
                        ),
                        _buildBannerCard(context, 'assets/images/Banner.png'),
                        verticalSpaceMedium
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        return const AppLoading();
      },
    );
  }
}

Widget _buildBannerCard(context, imageUrl) {
  return Container(
    width: screenWidthPercentage(context, percentage: 1),
    height: screenHeightPercentage(context, percentage: 0.25),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  );
}
