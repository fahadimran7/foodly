import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading_with_scaffold.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/no_glow_behaviour.dart';
import 'package:stacked_architecture/ui/restaurant_details/restaurant_details_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class RestaurantDetailsView extends StatelessWidget {
  const RestaurantDetailsView({Key? key, required this.restaurantDetails})
      : super(key: key);

  final Restaurant restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantDetailsViewModel>.reactive(
      viewModelBuilder: () => RestaurantDetailsViewModel(
        restaurantId: restaurantDetails.restaurantId,
      ),
      builder: (context, model, child) {
        if (!model.dataReady) {
          return const AppLoadingWithScaffold();
        } else {
          return ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: Scaffold(
              body: ListView(
                padding: const EdgeInsets.only(
                  top: globalContentPadding,
                  left: globalContentPadding,
                  right: globalContentPadding,
                ),
                children: [
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: model.navigateBack,
                        icon: const Icon(Icons.arrow_back_ios_sharp),
                      ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  SizedBox(
                    width: 220,
                    height: 200,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: CachedNetworkImage(
                        imageUrl: restaurantDetails.imageUrl,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Center(
                          child: CircularProgressIndicator(
                            value: downloadProgress.progress,
                          ),
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  Text(
                    restaurantDetails.name,
                    style: const TextStyle(
                      fontSize: kH3Title,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      for (final tag in restaurantDetails.tags)
                        Row(
                          children: [
                            Text(
                              tag,
                              style: const TextStyle(
                                color: kcDarkGreyColor,
                                fontSize: kBodyTextNormal,
                              ),
                            ),
                            horizontalSpaceSmall,
                          ],
                        )
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    children: [
                      Text(
                        restaurantDetails.rating,
                        style: const TextStyle(
                          fontSize: kBodyTextCaption,
                        ),
                      ),
                      const Icon(
                        Icons.star_rate_rounded,
                        color: kcPrimaryColor,
                        size: 13,
                      ),
                      horizontalSpaceRegular,
                      const Text(
                        '200+ ratings',
                        style: TextStyle(
                          fontSize: kBodyTextCaption,
                        ),
                      )
                    ],
                  ),
                  verticalSpaceRegular,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 21,
                        width: 21,
                        decoration: BoxDecoration(
                          color: kcPrimaryColor,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Icon(
                          Icons.attach_money_rounded,
                          color: Colors.white,
                          size: 17,
                        ),
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantDetails.offersFreeDelivery
                                ? 'Free'
                                : 'Paid',
                            style: const TextStyle(
                              fontSize: kBodyTextNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpaceTiny,
                          const Text(
                            'Delivery',
                            style: TextStyle(
                              fontSize: kBodyTextTiny,
                              color: kcDarkGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      horizontalSpaceRegular,
                      const Icon(
                        Icons.access_time_filled_rounded,
                        color: kcPrimaryColor,
                      ),
                      horizontalSpaceSmall,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            restaurantDetails.deliveryTime,
                            style: const TextStyle(
                              fontSize: kBodyTextNormal,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          verticalSpaceTiny,
                          const Text(
                            'Minutes',
                            style: TextStyle(
                              fontSize: kBodyTextTiny,
                              color: kcDarkGreyColor,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                              width: 1.0, color: kcPrimaryColor),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'TAKE AWAY',
                          style: TextStyle(
                              letterSpacing: 1.5, fontSize: kBodyTextTiny),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceRegular,
                  const Text(
                    'Featured Items',
                    style: TextStyle(
                      fontSize: kBodyTextLarge2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpaceRegular,
                  SizedBox(
                    width: double.infinity,
                    height: screenHeightPercentage(context, percentage: 0.26),
                    child: ListView.separated(
                      itemCount: model.featuredItems.length,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (BuildContext context, int index) {
                        return horizontalSpaceRegular;
                      },
                      itemBuilder: (BuildContext context, int index) =>
                          GestureDetector(
                        onTap: () => model.displayMenuDetails(
                          menuDetails: model.featuredItems[index],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: CachedNetworkImage(
                                imageUrl: model.featuredItems[index].imageUrl,
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                                fit: BoxFit.cover,
                                height: screenHeightPercentage(context,
                                    percentage: 0.19),
                                width: screenWidthPercentage(context,
                                    percentage: 0.38),
                              ),
                            ),
                            verticalSpaceSmall,
                            Text(
                              model.featuredItems[index].name,
                              style: const TextStyle(
                                fontSize: kBodyTextNormal,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            verticalSpaceTiny,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  '\$\$',
                                  style: TextStyle(
                                    fontSize: kBodyTextSmall1,
                                    color: kcDarkGreyColor,
                                  ),
                                ),
                                horizontalSpaceSmall,
                                Text(
                                  model.featuredItems[index].category,
                                  style: const TextStyle(
                                    fontSize: kBodyTextSmall1,
                                    color: kcDarkGreyColor,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  verticalSpaceMedium,
                  DefaultTabController(
                    length: model.menuMap.keys.length,
                    child: Column(
                      children: [
                        TabBar(
                          isScrollable: true,
                          unselectedLabelColor: kcDarkGreyColor,
                          indicatorColor: Colors.transparent,
                          labelColor: Colors.black,
                          labelStyle: const TextStyle(
                            fontSize: kH3Title,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                          unselectedLabelStyle: const TextStyle(
                            fontSize: kH3Title,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                          tabs: model.menuMap.keys
                              .map<Widget>(
                                (menuCategory) => Tab(
                                  text: menuCategory,
                                ),
                              )
                              .toList(),
                        ),
                        SizedBox(
                          height:
                              screenHeightPercentage(context, percentage: 0.85),
                          child: TabBarView(
                            children:
                                model.menuMap.values.map<Widget>((menuList) {
                              return ListView.builder(
                                itemBuilder: (context, index) {
                                  return MenuListCard(
                                    onTap: () => model.displayMenuDetails(
                                        menuDetails: menuList[index]),
                                    name: menuList[index].name,
                                    description: menuList[index].description,
                                    price: menuList[index].price,
                                    category: menuList[index].category,
                                    imageUrl: menuList[index].imageUrl,
                                  );
                                },
                                itemCount: menuList.length,
                              );
                            }).toList(),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

class MenuListCard extends StatelessWidget {
  const MenuListCard({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.category,
    required this.imageUrl,
    this.onTap,
  }) : super(key: key);

  final String name;
  final String description;
  final String price;
  final String category;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 120,
              height: 120,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      Center(
                    child: CircularProgressIndicator(
                      value: downloadProgress.progress,
                    ),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: kBodyTextLarge1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  verticalSpaceSmall,
                  Text(
                    description,
                    style: const TextStyle(
                      color: kcDarkGreyColor,
                      fontSize: kBodyTextSmall1,
                    ),
                  ),
                  verticalSpaceRegular,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            '\$\$',
                            style: TextStyle(
                              fontSize: kBodyTextSmall1,
                              color: kcDarkGreyColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            category,
                            style: const TextStyle(
                              fontSize: kBodyTextSmall1,
                              color: kcDarkGreyColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'USD $price',
                        style: const TextStyle(
                          color: kcPrimaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
