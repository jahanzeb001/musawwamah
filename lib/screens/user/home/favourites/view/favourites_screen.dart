import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:obaiah_mobile_app/screens/user/home/favourites/controller/favourites_controller.dart';
import 'package:obaiah_mobile_app/utils/constants/custom_error.dart';
import 'package:obaiah_mobile_app/utils/constants/no_data_message.dart';
import '../../../../../reusable_widgets/reusable_appbar.dart';
import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/spacing/gaps.dart';
import '../components/favourites_components.dart';

class FavoritesScreenView extends StatefulWidget {
  const FavoritesScreenView({Key? key}) : super(key: key);

  @override
  State<FavoritesScreenView> createState() => _FavoritesScreenViewState();
}

class _FavoritesScreenViewState extends State<FavoritesScreenView> {
  final favouritesController = Get.find<FavouritesController>();

  @override
  void initState() {
    favouritesController.loadData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ReusableAppBar(
            titleText: "favourites",
            onPressFunction: () {},
            textStyle: const TextStyle(
                fontFamily: "Tajawal",
                color: cOnyxColor,
                fontSize: 18,
                fontWeight: FontWeight.w700)),
        body: Obx(
          () => favouritesController.loading.value
              ? Center(
                  child: CircularProgressIndicator(
                  color: cPrimaryColor,
                ))
              : favouritesController.error.value != ""
                  ? Center(
                      child: Custom_Error(
                          onpressed: () {
                            favouritesController
                                .getMyFavourites(favouritesController.userId!);
                          },
                          error: favouritesController.error.value),
                    )
                  : favouritesController.myFavMOdel.value.data!.length == 0
                      ? Center(
                          child: NoDataMessage(
                          message: "No Data Found",
                        ))
                      : SafeArea(
                          child: Container(
                          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: context.height * 1,
                          width: context.width * 1,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: IconButton(
                                    onPressed: () {
                                      favouritesController.changeView();
                                    },
                                    icon: favouritesController.showInGrid.value
                                        ? const Icon(Icons.list)
                                        : const Icon(Icons.grid_view_rounded),
                                    color: cBlackColor,
                                  ),
                                ),
                                gapH10,
                                Flexible(
                                  child: favouritesController.showInGrid.value
                                      ? GridView.builder(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: favouritesController
                                              .myFavMOdel.value.data!.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  mainAxisExtent: 300,
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 4.0,
                                                  mainAxisSpacing: 4.0),
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return favouritesController
                                                        .myFavMOdel
                                                        .value
                                                        .data![index]
                                                        .isSold ==
                                                    1
                                                ? GridViewBlurComponent(
                                                    homeModel:
                                                        favouritesController
                                                            .myFavMOdel
                                                            .value
                                                            .data![index],
                                                  )
                                                : FavouritesGridViewInfoCard(
                                                    index: index,
                                                    homePageModel:
                                                        favouritesController
                                                            .myFavMOdel
                                                            .value
                                                            .data![index]);
                                          },
                                        )
                                      : Obx(() => ListView.separated(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: favouritesController
                                                .myFavMOdel.value.data!.length,
                                            separatorBuilder:
                                                (BuildContext context,
                                                        int index) =>
                                                    gapH15,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return favouritesController
                                                          .myFavMOdel
                                                          .value
                                                          .data![index]
                                                          .isSold ==
                                                      1
                                                  ? ListViewBlurComponent(
                                                      homeModel:
                                                          favouritesController
                                                              .myFavMOdel
                                                              .value
                                                              .data![index],
                                                    )
                                                  : FavoritesViewInfoCard(
                                                      index: index,
                                                      homePageModel:
                                                          favouritesController
                                                              .myFavMOdel
                                                              .value
                                                              .data![index],
                                                    );
                                            },
                                          )),
                                ),
                              ],
                            ),
                          ),
                        )),
        ));
  }
}
