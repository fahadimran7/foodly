import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

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
