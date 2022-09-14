import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/models/application_models.dart';
import '../../shared/styles.dart';
import '../../shared/ui_helpers.dart';

class FeaturedRestaurantCard extends StatelessWidget {
  const FeaturedRestaurantCard({Key? key, required this.restaurantDetails})
      : super(key: key);
  final FeaturedRestaurant restaurantDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 220,
          height: 180,
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
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        verticalSpaceTiny,
        Text(
          '${restaurantDetails.area ?? ''}, ${restaurantDetails.city}',
          style: const TextStyle(color: kcMediumGreyColor, fontSize: 15),
        ),
        verticalSpaceSmall,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 4.0,
                  horizontal: 8,
                ),
                child: Text(
                  restaurantDetails.rating,
                  style: const TextStyle(
                    fontSize: kBodyTextCaption,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            horizontalSpaceSmall,
            Text(
              '${restaurantDetails.deliveryTime} min',
              style: const TextStyle(
                fontSize: kBodyTextCaption,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(167, 0, 0, 0),
              ),
            ),
            horizontalSpaceSmall,
            Text(
              restaurantDetails.offersFreeDelivery
                  ? 'Free Delivery'
                  : 'Paid Delivery',
              style: const TextStyle(
                fontSize: kBodyTextCaption,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(167, 0, 0, 0),
              ),
            )
          ],
        )
      ],
    );
  }
}
