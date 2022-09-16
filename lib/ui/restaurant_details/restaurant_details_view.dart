import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_list_tab_scroller/scrollable_list_tab_scroller.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/restaurant_details/restaurant_details_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class RestaurantDetailsView extends StatefulWidget {
  const RestaurantDetailsView({Key? key}) : super(key: key);

  @override
  State<RestaurantDetailsView> createState() => _RestaurantDetailsViewState();
}

class _RestaurantDetailsViewState extends State<RestaurantDetailsView> {
  final data = {
    "Seafood": [
      "Item 1 (A)",
      "Item 2 (A)",
      "Item 3 (A)",
      "Item 4 (A)",
    ],
    "Appetizers": [
      "Item 1 (B)",
      "Item 2 (B)",
    ],
    "Beef & Lamb": [
      "Item 1 (C)",
      "Item 2 (C)",
      "Item 3 (C)",
      "Item 4 (C)",
      "Item 5 (C)",
    ],
    "Burgers": [
      "Item 1 (D)",
      "Item 2 (D)",
      "Item 3 (D)",
      "Item 4 (D)",
      "Item 5 (D)",
      "Item 6 (D)",
      "Item 7 (D)",
      "Item 8 (D)",
      "Item 9 (D)",
    ],
  };

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RestaurantDetailsViewModel>.reactive(
      viewModelBuilder: () => RestaurantDetailsViewModel(),
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: ListView(
            padding: const EdgeInsets.only(
                left: kpscreenPaddingHorizontal,
                right: kpscreenPaddingHorizontal),
            children: [
              verticalSpaceMedium,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                    onPressed: () {},
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
              const Text(
                'Mayfield Bakery & Cafe',
                style: TextStyle(
                  fontSize: kH3Title,
                  fontWeight: FontWeight.w600,
                ),
              ),
              verticalSpaceSmall,
              Row(
                children: const [
                  Text(
                    '\$\$',
                    style: TextStyle(
                      color: kcDarkGreyColor,
                      fontSize: kBodyTextNormal,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'Chinese',
                    style: TextStyle(
                      color: kcDarkGreyColor,
                      fontSize: kBodyTextNormal,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'American',
                    style: TextStyle(
                      color: kcDarkGreyColor,
                      fontSize: kBodyTextNormal,
                    ),
                  ),
                  horizontalSpaceSmall,
                  Text(
                    'Desi Food',
                    style: TextStyle(
                      color: kcDarkGreyColor,
                      fontSize: kBodyTextNormal,
                    ),
                  )
                ],
              ),
              verticalSpaceRegular,
              Row(
                children: const [
                  Text(
                    '4.3',
                    style: TextStyle(
                      fontSize: kBodyTextCaption,
                    ),
                  ),
                  Icon(
                    Icons.star_rate_rounded,
                    color: kcPrimaryColor,
                    size: 13,
                  ),
                  horizontalSpaceRegular,
                  Text(
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
                    children: const [
                      Text(
                        'Free',
                        style: TextStyle(
                          fontSize: kBodyTextNormal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
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
                    children: const [
                      Text(
                        '25',
                        style: TextStyle(
                          fontSize: kBodyTextNormal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpaceTiny,
                      Text(
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
                      side: const BorderSide(width: 1.0, color: kcPrimaryColor),
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
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (BuildContext context, int index) {
                    return horizontalSpaceRegular;
                  },
                  itemBuilder: (BuildContext context, int index) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://unsplash.com/photos/OfdDiqx8Cz8/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjYzMzI0NjQx&force=true&w=640',
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          fit: BoxFit.cover,
                          height:
                              screenHeightPercentage(context, percentage: 0.19),
                          width:
                              screenWidthPercentage(context, percentage: 0.38),
                        ),
                      ),
                      verticalSpaceSmall,
                      const Text(
                        'Cookie Sandwich',
                        style: TextStyle(
                          fontSize: kBodyTextNormal,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      verticalSpaceTiny,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [
                          Text(
                            '\$\$',
                            style: TextStyle(
                              fontSize: kBodyTextSmall1,
                              color: kcDarkGreyColor,
                            ),
                          ),
                          horizontalSpaceSmall,
                          Text(
                            'Chinese',
                            style: TextStyle(
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
              verticalSpaceMedium,
              SizedBox(
                height: screenHeightPercentage(context, percentage: 0.85),
                child: Expanded(
                  child: ScrollableListTabScroller(
                    tabBuilder:
                        (BuildContext context, int index, bool active) => Text(
                      data.keys.elementAt(index),
                      style: !active
                          ? const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: kH3Title,
                              color: kcDarkGreyColor,
                            )
                          : const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: kH3Title,
                              color: Colors.black,
                            ),
                    ),
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        verticalSpaceMedium,
                        Text(
                          data.keys.elementAt(index),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: kBodyTextLarge2,
                          ),
                        ),
                        ...data.values
                            .elementAt(index)
                            .asMap()
                            .map(
                              (index, value) => MapEntry(
                                index,
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 120,
                                        height: 120,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://unsplash.com/photos/OfdDiqx8Cz8/download?ixid=MnwxMjA3fDB8MXxhbGx8fHx8fHx8fHwxNjYzMzI0NjQx&force=true&w=640',
                                            progressIndicatorBuilder: (context,
                                                    url, downloadProgress) =>
                                                Center(
                                              child: CircularProgressIndicator(
                                                value:
                                                    downloadProgress.progress,
                                              ),
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      horizontalSpaceSmall,
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
                                              'Cookie Sandwich',
                                              style: TextStyle(
                                                fontSize: kBodyTextLarge1,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            verticalSpaceSmall,
                                            const Text(
                                              'Shortbread, chocolate turtle cookies, and red velvet.',
                                              style: TextStyle(
                                                color: kcDarkGreyColor,
                                                fontSize: kBodyTextNormal,
                                              ),
                                            ),
                                            verticalSpaceRegular,
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      '\$\$',
                                                      style: TextStyle(
                                                        fontSize:
                                                            kBodyTextSmall1,
                                                        color: kcDarkGreyColor,
                                                      ),
                                                    ),
                                                    horizontalSpaceSmall,
                                                    Text(
                                                      'Chinese',
                                                      style: TextStyle(
                                                        fontSize:
                                                            kBodyTextSmall1,
                                                        color: kcDarkGreyColor,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                const Text(
                                                  'USD 7.4',
                                                  style: TextStyle(
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
                              ),
                            )
                            .values
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
