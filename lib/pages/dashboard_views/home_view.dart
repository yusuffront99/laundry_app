import 'package:d_button/d_button.dart';
import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:laundry_app/datasources/promo_datasource.dart';
import 'package:laundry_app/datasources/shop_datasource.dart';
import 'package:laundry_app/models/promo_model.dart';
import 'package:laundry_app/models/shop_model.dart';

import '../../providers/home_provider.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  // ======= SEARCHING FEATURE
  static final edtSearch = TextEditingController();

  gotoSearchCity() {}
  getPromo() {
    PromoDataSource.readLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              setHomePromoStatus(ref, 'Bad request');
              break;
            case UnauthorisedFailure:
              setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          setHomePromoStatus(ref, 'Success');
          List data = result['data'];
          List<PromoModel> promos =
              data.map((e) => PromoModel.fromJson(e)).toList();
          ref.read(HomePromoListProvider.notifier).setData(promos);
          // ref.read(homePromoListProvider.notifier).setData(promos);
        },
      );
    });
  }

  getRecommendation() {
    ShopDataSource.readRecommendationLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              setHomeRecommendationStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              setHomeRecommendationStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              setHomeRecommendationStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              setHomeRecommendationStatus(ref, 'Bad request');
              break;
            case UnauthorisedFailure:
              setHomeRecommendationStatus(ref, 'Unauthorised');
              break;
            default:
              setHomeRecommendationStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          setHomePromoStatus(ref, 'Success');
          List data = result['data'];
          List<ShopModel> shops =
              data.map((e) => ShopModel.fromJson(e)).toList();
          ref.read(HomeRecommendationListProvider.notifier).setData(shops);
        },
      );
    });
  }

  @override
  void initState() {
    getPromo();
    getRecommendation();
    super.initState();
  }

  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'We\'are ready',
                style: GoogleFonts.ptSans(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              DView.spaceHeight(4),
              Text(
                'to clean your clothes',
                style: GoogleFonts.ptSans(
                  color: Colors.black54,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 1,
                ),
              ),
              DView.spaceHeight(20),
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_city,
                        color: Colors.green,
                        size: 20,
                      ),
                      DView.spaceWidth(4),
                      Text(
                        'Find by City',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  // ============= SEARCH FEATURE
                  DView.spaceHeight(8),
                  IntrinsicHeight(
                    /// (ii)  IntrinsicHeight berfungsi menyamakan tinggi dua atau lebih shape ke shape paling tertinggi
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.green[50],
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () => gotoSearchCity(),
                                  icon: const Icon(Icons.search),
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: edtSearch,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'Search...',
                                    ),
                                    onSubmitted: (value) => gotoSearchCity(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        // ============= SEARCH FEATURE

                        //  ====== TUNE BUTTON RIGHT
                        DView.spaceWidth(),
                        DButtonElevation(
                          onClick: () {},
                          mainColor: Colors.green,
                          splashColor: Colors.greenAccent,
                          width: 50,
                          radius: 10,
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                          ),
                        ),
                        //  ====== TUNE BUTTON RIGHT
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
