import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/ui/dumb_widgets/block_button.dart';
import 'package:stacked_architecture/ui/onboarding/components/onboarding_page_content.dart';
import 'package:stacked_architecture/ui/onboarding/onboarding_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OnboardingViewModel>.reactive(
      viewModelBuilder: () => OnboardingViewModel(),
      builder: (context, model, child) {
        AnimatedContainer buildDot({int? index}) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.only(right: 5),
            height: 6,
            width: model.currentPage == index ? 20 : 6,
            decoration: BoxDecoration(
              color: model.currentPage == index
                  ? primaryGreen
                  : const Color.fromARGB(255, 219, 219, 219),
              borderRadius: BorderRadius.circular(3),
            ),
          );
        }

        return Scaffold(
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(
                  height: 120,
                ),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: PageView.builder(
                      onPageChanged: (value) {
                        model.setCurrentPage(value);
                      },
                      itemCount: model.splashData.length,
                      itemBuilder: (context, index) => OnboardingPageContent(
                        title: model.splashData[index]["title"],
                        image: model.splashData[index]["image"],
                        text: model.splashData[index]['text'],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            model.splashData.length,
                            (index) => buildDot(index: index),
                          ),
                        ),
                        const Spacer(),
                        BlockButton(
                          onPressed: model.navigateToLogin,
                          title: 'GET STARTED',
                        ),
                        const Spacer()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
