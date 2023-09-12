import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laundry_app/models/promo_model.dart';
import 'package:laundry_app/models/shop_model.dart';

final HomeCategoryProvider = StateProvider.autoDispose((ref) => 'All');
final HomePromoStatusProvider = StateProvider.autoDispose((ref) => 'All');
final HomeRecommendationStatusProvider =
    StateProvider.autoDispose((ref) => 'All');

setHomeCategory(WidgetRef ref, String newCategory) {
  ref.read(HomeCategoryProvider.notifier).state = newCategory;
}

setHomePromoStatus(WidgetRef ref, String newStatus) {
  ref.read(HomePromoStatusProvider.notifier).state = newStatus;
}

setHomeRecommendationStatus(WidgetRef ref, String newStatus) {
  ref.read(HomeRecommendationStatusProvider.notifier).state = newStatus;
}

// ======= PROVIDERS
final HomePromoListProvider =
    StateNotifierProvider.autoDispose<HomePromoList, List<PromoModel>>(
        (ref) => HomePromoList([]));
// ======= PROVIDERS

// === SPECIALLY FOR MODEL SHOW DATA (JAMAK / )
// ====== *** PROMO ***
class HomePromoList extends StateNotifier<List<PromoModel>> {
  HomePromoList(super.state);

  // ===== CREATE, UPDATE, DELETE & READ DATA USING INITAL
  setData(List<PromoModel> newData) {
    state = newData;
  }
}

// ====== *** PROMO ***
class HomerRecommendationList extends StateNotifier<List<ShopModel>> {
  HomerRecommendationList(super.state);

  // ===== CREATE, UPDATE, DELETE & READ DATA USING INITAL
  setData(List<ShopModel> newData) {
    state = newData;
  }
}
