import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/models/promo_model.dart';
import 'package:laundry_app/models/shop_model.dart';

final homeCategoryProvider = StateProvider.autoDispose((ref) => 'All');
final homePromoStatusProvider = StateProvider.autoDispose((ref) => 'All');
final homeRecommendationStatusProvider =
    StateProvider.autoDispose((ref) => 'All');

setHomeCategory(WidgetRef ref, String newCategory) {
  ref.read(homeCategoryProvider.notifier).state = newCategory;
}

setHomePromoStatus(WidgetRef ref, String newStatus) {
  ref.read(homePromoStatusProvider.notifier).state = newStatus;
}

setHomeRecommendationStatus(WidgetRef ref, String newStatus) {
  ref.read(homeRecommendationStatusProvider.notifier).state = newStatus;
}

// === eSPECIALLY FOR MODEL SHOW DATA (JAMAK / )

// ======= PROVIDERS
final homePromoListProvider =
    StateNotifierProvider.autoDispose<HomePromoList, List<PromoModel>>(
        (ref) => HomePromoList([]));

// ====== *** PROMO ***
class HomePromoList extends StateNotifier<List<PromoModel>> {
  HomePromoList(super.state);

  // ===== CREATE, UPDATE, DELETE & READ DATA USING INITAL
  setData(List<PromoModel> newData) {
    state = newData;
  }
}

// ======= PROVIDERS
final homeRecommendationListProvider =
    StateNotifierProvider.autoDispose<HomeRecommendationList, List<ShopModel>>(
        (ref) => HomeRecommendationList([]));

// ====== *** PROMO ***
class HomeRecommendationList extends StateNotifier<List<ShopModel>> {
  HomeRecommendationList(super.state);

  // ===== CREATE, UPDATE, DELETE & READ DATA USING INITAL
  setData(List<ShopModel> newData) {
    state = newData;
  }
}
