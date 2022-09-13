import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/editors_pick_restaurant_card.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/featured_restaurant_card.dart';
import 'package:stacked_architecture/ui/featured_restaurants/components/featured_screen_header.dart';
import 'package:stacked_architecture/ui/featured_restaurants/featured_restaurants_viewmodel.dart';
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
          final featuredRestaurants =
              model.featuredRestaurants as List<FeaturedRestaurant>;
          final editorsPickRestaurants =
              model.editorsPickRestaurants as List<EditorsPickRestaurant>;

          return SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    verticalSpaceSmall,
                    FeaturedScreenHeader(location: model.currentLocation),
                    verticalSpaceTiny,
                    const Divider(),
                    verticalSpaceSmall,
                    _buildBannerCard(
                        context, 'assets/images/banner-top-2.jpeg'),
                    verticalSpaceRegular,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Featured Partners',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('See all'))
                      ],
                    ),
                    verticalSpaceRegular,
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: featuredRestaurants.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
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
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.5,
                          ),
                        ),
                        TextButton(
                            onPressed: () {}, child: const Text('See all'))
                      ],
                    ),
                    verticalSpaceRegular,
                    SizedBox(
                      height: 300,
                      width: double.infinity,
                      child: ListView.separated(
                        itemCount: editorsPickRestaurants.length,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (BuildContext context, int index) {
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
    height: screenWidthPercentage(context, percentage: 0.45),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      image: DecorationImage(
        image: AssetImage(imageUrl),
        fit: BoxFit.cover,
      ),
    ),
  );
}
