import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/restaurants_list/components/restaurant_list_card.dart';

import '../shared/ui_helpers.dart';

class RestaurantsListView extends StatelessWidget {
  const RestaurantsListView({Key? key, required this.restaurantsList})
      : super(key: key);
  final List<dynamic> restaurantsList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
            verticalSpaceRegular,
            _buildTopRow(onBackPressed: () {}),
            verticalSpaceMedium,
            Expanded(
              child: ListView.builder(
                  itemCount: restaurantsList.length,
                  itemBuilder: (context, index) {
                    return RestaurantListCard(
                      restaurantDetails: restaurantsList[index],
                    );
                  }),
            )
          ],
        ),
      ),
    ));
  }
}

Widget _buildTopRow({required Function onBackPressed}) {
  return Row(
    children: [
      IconButton(
        padding: EdgeInsets.zero,
        alignment: Alignment.centerLeft,
        onPressed: () => onBackPressed(),
        icon: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
      const Spacer(
        flex: 2,
      ),
      const Text(
        'Featured Restaurants',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      const Spacer(
        flex: 3,
      )
    ],
  );
}
