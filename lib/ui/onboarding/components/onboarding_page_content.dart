import 'package:flutter/material.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class OnboardingPageContent extends StatelessWidget {
  const OnboardingPageContent({
    Key? key,
    this.text,
    this.image,
    this.title,
  }) : super(key: key);
  final String? text, image, title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(
          image!,
          width: screenWidthPercentage(context, percentage: 0.8),
          height: screenWidthPercentage(context, percentage: 0.8),
        ),
        verticalSpaceLarge,
        Text(
          title!,
          style: const TextStyle(
            fontSize: kH2Title,
            fontWeight: FontWeight.w800,
          ),
        ),
        verticalSpaceRegular,
        SizedBox(
          width: screenWidthPercentage(context, percentage: 0.75),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.black54, fontSize: kBodyTextSmall2),
          ),
        ),
      ],
    );
  }
}
