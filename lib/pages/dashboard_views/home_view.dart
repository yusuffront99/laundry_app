import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/config/failure.dart';
import 'package:laundry_app/datasources/promo_datasource.dart';
import 'package:laundry_app/datasources/shop_datasource.dart';
import 'package:laundry_app/models/promo_model.dart';
import 'package:laundry_app/models/shop_model.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  getPromo() {
    PromoDataSource.readLimit().then((value) {
      value.fold(
        (failure) {
          switch (failure.runtimeType) {
            case ServerFailure:
              // setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              // setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              // setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              // setHomePromoStatus(ref, 'Bad request');
              break;
            case UnauthorisedFailure:
              // setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              // setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          // setHomePromoStatus(ref, 'Success');
          List data = result['data'];
          List<PromoModel> promos =
              data.map((e) => PromoModel.fromJson(e)).toList();
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
              // setHomePromoStatus(ref, 'Server Error');
              break;
            case NotFoundFailure:
              // setHomePromoStatus(ref, 'Error Not Found');
              break;
            case ForbiddenFailure:
              // setHomePromoStatus(ref, 'You don\'t have access');
              break;
            case BadRequestFailure:
              // setHomePromoStatus(ref, 'Bad request');
              break;
            case UnauthorisedFailure:
              // setHomePromoStatus(ref, 'Unauthorised');
              break;
            default:
              // setHomePromoStatus(ref, 'Request Error');
              break;
          }
        },
        (result) {
          // setHomePromoStatus(ref, 'Success');
          List data = result['data'];
          List<ShopModel> shops =
              data.map((e) => ShopModel.fromJson(e)).toList();
          // ref.read(homePromoListProvider.notifier).setData(promos);
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView();
  }
}