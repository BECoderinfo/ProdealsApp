import 'package:get/get.dart';
import 'package:pro_deals1/imports.dart';
import '../../model_class/rating_model.dart';

class RatingsController extends GetxController {
  var isLoading = true.obs;
  var ratings = <RatingModel>[].obs;
  var filteredRatings = <RatingModel>[].obs;
  var selectedStarFilter = 0.obs; // 0 = all, 1-5 = filter by star

  @override
  void onInit() {
    super.onInit();
    String bId =
        UserDataStorageServices.readData(key: UserStorageDataKeys.businessId) ??
            "";
    fetchRatings(bId: bId);
  }

  Future<void> fetchRatings({required String bId}) async {
    try {
      isLoading.value = true;
      var response =
          await ApiService.getApi(Apis.getRatingByBusinessId(bId: bId));

      if (response != null) {
        ratings.clear();
        response['ratings']
            .map((e) => ratings.add(RatingModel.fromJson(e)))
            .toList();

        applyFilter(); // Sort & filter after loading
      }
    } catch (e) {
      ShowToast.errorSnackbar(title: "Error", msg: "$e");
    } finally {
      isLoading.value = false;
    }
  }

  void applyFilter() {
    // Sort by updated date descending
    var sorted = [...ratings];
    sorted.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));

    // Filter by selected stars
    if (selectedStarFilter.value == 0) {
      filteredRatings.value = sorted;
    } else {
      filteredRatings.value =
          sorted.where((r) => r.rating == selectedStarFilter.value).toList();
    }
  }

  void updateFilter(int star) {
    selectedStarFilter.value = star;
    applyFilter();
  }

  double get averageRating {
    if (ratings.isEmpty) return 0;
    return ratings.map((e) => e.rating).reduce((a, b) => a + b) /
        ratings.length;
  }
}
