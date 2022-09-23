import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class FeaturedMenuCard extends StatelessWidget {
  const FeaturedMenuCard({
    Key? key,
    required this.restaurantDetails,
    required this.menuDetails,
    required this.onTap,
  }) : super(key: key);

  final Restaurant restaurantDetails;
  final Menu menuDetails;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(
        menuDetails: menuDetails,
        restaurantName: restaurantDetails.name,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: CachedNetworkImage(
              imageUrl: menuDetails.imageUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                ),
              ),
              fit: BoxFit.cover,
              height: screenHeightPercentage(context, percentage: 0.19),
              width: screenWidthPercentage(context, percentage: 0.38),
            ),
          ),
          verticalSpaceSmall,
          Text(
            menuDetails.name,
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
                menuDetails.category,
                style: const TextStyle(
                  fontSize: kBodyTextSmall1,
                  color: kcDarkGreyColor,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
