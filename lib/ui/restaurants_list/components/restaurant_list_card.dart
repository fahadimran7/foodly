import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';

class RestaurantListCard extends StatelessWidget {
  const RestaurantListCard({Key? key, this.restaurantDetails})
      : super(key: key);
  final dynamic restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          height: screenWidthPercentage(context, percentage: 0.45),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: restaurantDetails.imageUrl,
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
        verticalSpaceSmall,
        Text(
          restaurantDetails.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        verticalSpaceSmall,
        Row(
          children: _buildTagRow(restaurantDetails.tags),
        ),
        verticalSpaceSmall,
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.star_rate_rounded,
              color: kcPrimaryColor,
              size: 22,
            ),
            Text(restaurantDetails.rating),
            horizontalSpaceSmall,
            const Icon(
              Icons.access_time_filled_rounded,
              size: 18,
              color: Colors.black38,
            ),
            horizontalSpaceTiny,
            Text('${restaurantDetails.deliveryTime} min'),
            horizontalSpaceSmall,
            Container(
              padding: const EdgeInsets.all(2),
              height: 19,
              width: 19,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(20)),
              child: const Icon(
                Icons.attach_money_rounded,
                size: 16,
                color: Colors.white,
              ),
            ),
            horizontalSpaceTiny,
            Text(restaurantDetails.offersFreeDelivery ? 'Free' : 'Paid')
          ],
        ),
        verticalSpaceRegular
      ],
    );
  }
}

_buildTagRow(List<String> tags) {
  var index = 0;
  final tagList = <Widget>[];

  for (final tag in tags) {
    tagList.add(
      Row(
        children: [
          Text(
            tag,
            style: const TextStyle(
              color: kcMediumGreyColor,
              fontSize: 16,
            ),
          ),
          horizontalSpaceSmall,
          if (index != tags.length - 1) _buildDot(),
          if (index != tags.length - 1) horizontalSpaceSmall,
        ],
      ),
    );
    index++;
  }

  return tagList;
}

_buildDot() {
  return Container(
    height: 5,
    width: 5,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), color: Colors.black38),
  );
}
