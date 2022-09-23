import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/app/app.locator.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading.dart';
import 'package:stacked_architecture/ui/search_restaurants/search_restaurants_view.form.dart';
import 'package:stacked_architecture/ui/search_restaurants/search_restaurants_viewmodel.dart';
import 'package:stacked_architecture/ui/shared/styles.dart';
import 'package:stacked_architecture/ui/shared/ui_helpers.dart';

@FormView(fields: [
  FormTextField(name: 'search'),
])
class SearchRestaurantsView extends StatelessWidget
    with $SearchRestaurantsView {
  SearchRestaurantsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SearchRestaurantsViewModel>.reactive(
      viewModelBuilder: () => SearchRestaurantsViewModel(),
      onDispose: (model) => disposeForm(),
      builder: (context, model, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              left: globalContentPadding,
              right: globalContentPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                verticalSpaceSmall,
                const Text(
                  'Search',
                  style: TextStyle(
                    fontSize: kH2Title,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                verticalSpaceRegular,
                TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                          style: BorderStyle.solid, color: kcPrimaryColor),
                    ),
                    fillColor: kcLightGreyColor,
                    filled: true,
                    labelText: 'Search Foodly',
                  ),
                  controller: searchController,
                  onChanged: (value) => model.filterResults(value),
                ),
                verticalSpaceMedium,
                verticalSpaceTiny,
                if (searchController.text == '')
                  Column(
                    children: const [
                      Text(
                        'Top Restaurants',
                        style: TextStyle(
                            fontSize: kBodyTextNormal,
                            fontWeight: FontWeight.w500),
                      ),
                      verticalSpaceSmall,
                    ],
                  ),
                model.isBusy
                    ? const AppLoading()
                    : Expanded(
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisExtent: 270,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 1,
                          ),
                          itemCount: searchController.text == ''
                              ? model.data.length
                              : model.searchResults.length,
                          itemBuilder: (BuildContext ctx, index) {
                            final restaurantDetails =
                                searchController.text == ''
                                    ? model.data[index]
                                    : model.searchResults[index];
                            return GestureDetector(
                              onTap: () =>
                                  model.navigateToRestaurantDetailsView(
                                      restaurantDetails: restaurantDetails),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: CachedNetworkImage(
                                      imageUrl: restaurantDetails.imageUrl,
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                          value: downloadProgress.progress,
                                        ),
                                      ),
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: 180,
                                    ),
                                  ),
                                  verticalSpaceSmall,
                                  Text(
                                    restaurantDetails.name,
                                    style: const TextStyle(
                                      fontSize: kBodyTextLarge2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  verticalSpaceSmall,
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
                                        restaurantDetails.tags[0],
                                        style: const TextStyle(
                                          fontSize: kBodyTextSmall2,
                                          color: kcMediumGreyColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      )
              ],
            ),
          ),
        );
      },
    );
  }
}
