import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_architecture/models/application_models.dart';
import 'package:stacked_architecture/ui/dumb_widgets/buttons/block_button.dart';
import 'package:stacked_architecture/ui/dumb_widgets/layout/no_glow_behaviour.dart';
import 'package:stacked_architecture/ui/shared/bottom_sheet_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.locator.dart';
import '../../enums/bottom_sheet_type.dart';
import '../../extensions/string_extensions.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.floating: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(
          request: sheetRequest,
          completer: completer,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class _FloatingBoxBottomSheet extends StatelessWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  const _FloatingBoxBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BottomSheetViewModel>.reactive(
      viewModelBuilder: () => BottomSheetViewModel(
        choices: request.data.choices ?? {},
      ),
      onModelReady: (model) => model.setDefaultChoice(),
      builder: (context, model, child) {
        final menuDetails = request.data as Menu;

        return ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: menuDetails.imageUrl,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                          fit: BoxFit.fitWidth,
                          height:
                              screenHeightPercentage(context, percentage: 0.35),
                          width: screenWidthPercentage(context, percentage: 1),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => completer(SheetResponse(confirmed: false)),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(30)),
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(
                            left: 16,
                            top: 36,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  verticalSpaceMedium,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          menuDetails.name.trim(),
                          style: TextStyle(
                            fontSize: kH2Title,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey[900],
                          ),
                        ),
                        verticalSpaceSmall,
                        Text(
                          menuDetails.description,
                          style: const TextStyle(
                              color: kcMediumGreyColor,
                              fontSize: kBodyTextSmall2),
                        ),
                        verticalSpaceRegular,
                        Row(
                          children: [
                            const Text(
                              '\$\$',
                              style: TextStyle(
                                fontSize: kBodyTextSmall2,
                                color: kcMediumGreyColor,
                              ),
                            ),
                            horizontalSpaceSmall,
                            Text(
                              menuDetails.category,
                              style: const TextStyle(
                                fontSize: kBodyTextSmall2,
                                color: kcMediumGreyColor,
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        if (menuDetails.choices != null)
                          Column(
                            children: _buildChoiceListView(
                                menuDetails.choices!, model, context),
                          ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(255, 236, 236, 236)),
                              child: const Icon(
                                Icons.minimize,
                              ),
                            ),
                            horizontalSpaceRegular,
                            const Text(
                              '01',
                              style: TextStyle(
                                  fontSize: kBodyTextLarge2,
                                  fontWeight: FontWeight.w500),
                            ),
                            horizontalSpaceRegular,
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color:
                                      const Color.fromARGB(255, 236, 236, 236)),
                              child: const Icon(
                                Icons.add,
                              ),
                            ),
                          ],
                        ),
                        verticalSpaceMedium,
                        verticalSpaceSmall,
                        BlockButton(
                          onPressed: () {},
                          title: 'ADD TO ORDER (\$${menuDetails.price})',
                        ),
                        verticalSpaceMedium
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

_buildChoiceListView(Map<String, dynamic> choices, model, context) {
  List<Widget> listOfWidgets = [];
  choices.forEach((choiceType, choiceOptions) {
    listOfWidgets.add(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choice of ${choiceType.capitalize()}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: const Color(0xffEF9920).withOpacity(0.2),
                  borderRadius: BorderRadius.circular(5)),
              child: const Text(
                'REQUIRED',
                style: TextStyle(
                    color: Color(0xffEF9920),
                    fontSize: kBodyTextCaption,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
        verticalSpaceRegular,
        for (final choice in choiceOptions)
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceSmall,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    fit: FlexFit.loose,
                    child: RadioListTile(
                      dense: true,
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        choice,
                        style: const TextStyle(
                          fontSize: kBodyTextNormal,
                        ),
                      ),
                      onChanged: (dynamic value) {
                        model.setChoiceOption(
                          choiceType,
                          value,
                        );
                      },
                      value: choice,
                      groupValue: model.choiceList[choiceType],
                    ),
                  ),
                ],
              ),
              verticalSpaceSmall,
              const Divider()
            ],
          ),
        verticalSpaceMedium
      ],
    ));
  });

  return listOfWidgets;
}
