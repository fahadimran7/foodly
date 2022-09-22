import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_architecture/ui/dumb_widgets/app_flow/app_loading_with_scaffold.dart';
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
      onModelReady: (model) {
        listenToFormUpdated(model);
        model.getDataFromServer();
      },
      onDispose: (model) => disposeForm(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const AppLoadingWithScaffold();
        } else if (model.hasError) {
          return const Scaffold(
            body: Center(
              child: Text('Something went wrong. Sorry for the inconvinience.'),
            ),
          );
        } else {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: globalContentPadding,
                  right: globalContentPadding,
                ),
                child: Column(
                  children: [
                    verticalSpaceMedium,
                    verticalSpaceSmall,
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
                        labelText: 'Search Restaurants',
                      ),
                      controller: searchController,
                      onChanged: (value) => model.filterResults(value),
                    ),
                    verticalSpaceMedium,
                    // Add featured restaurants here
                    Expanded(
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
                            ? model.restaurantList.length
                            : model.searchResults.length,
                        itemBuilder: (BuildContext ctx, index) {
                          final restaurantDetails = searchController.text == ''
                              ? model.restaurantList[index]
                              : model.searchResults[index];
                          return GestureDetector(
                            onTap: () => model.navigateToRestaurantDetailsView(
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
            ),
          );
        }
      },
    );
  }
}
