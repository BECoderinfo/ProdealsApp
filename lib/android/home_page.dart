import 'package:pro_deals1/imports.dart';
import '../widget/android_drawer.dart';
import '../widget/shimmerLoding.dart';

class home_page extends GetView<HomePageController> {
  const home_page({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;

    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (hController) {
        return Scaffold(
          appBar: AppBar(
            title: GestureDetector(
              onTap: hController.cityList.isEmpty
                  ? null
                  : hController.openCityListSheet,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => hController.cityList.isEmpty
                      ? Text('...')
                      : Text('${hController.cityName.value}')),
                  Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
            backgroundColor: AppColor.primary,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () => hController.cityName.value.isEmpty
                    ? null
                    : Get.toNamed('/Search',
                        arguments: hController.cityName.value),
              ),
            ],
          ),
          drawer: drawer1(hit, wid),
          body: SingleChildScrollView(
            // ScrollView directly wraps the content
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildBannerSlider(hit, hController),
                const Gap(10),
                _buildCategorySection(hit, wid),
                const Gap(20),
                _buildSlider2(hController, wid),
                const Gap(20),
                _buildPopularBusinessTitle(),
                const Gap(10),
                _buildPopularBusinessSection(hController, wid),
                const Gap(10),
              ],
            ),
          ),
          floatingActionButton: _buildFAB(),
        );
      },
    );
  }

  Widget _buildBannerSlider(double hit, HomePageController hController) {
    return Obx(() {
      if (hController.isErrorInBannerLoading.value) {
        return const SizedBox.shrink(); // Skip on error
      }

      // ✅ Return shimmer until loading completes
      return ShimmerLoading(
        isLoading: !hController.isBannerLoaded.value,
        child: hController.slider1BannerList.isEmpty
            ? ClipRRect(
                child: Image.asset(
                  'assets/images/cc2.png',
                  fit: BoxFit.cover,
                  height: hit / 3.5,
                ),
              )
            : AnimatedBuilder(
                animation: hController.slider1Index,
                builder: (context, child) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          enlargeCenterPage: false,
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            hController.slider1Index.value = index;
                          },
                        ),
                        items: hController.slider1BannerList.map((item) {
                          return Center(
                            child: Image.memory(
                              Uint8List.fromList(item.image!.data!),
                              fit: BoxFit.fill,
                              height: hit / 3.4,
                            ),
                          );
                        }).toList(),
                      ),
                      Positioned(
                        bottom: 10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: hController.slider1BannerList
                              .asMap()
                              .entries
                              .map((entry) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 10.0,
                                height: 10.0,
                                margin: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: hController.slider1Index.value ==
                                          entry.key
                                      ? AppColor.primary
                                      : Colors.grey,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  );
                },
              ),
      );
    });
  }

  Widget _buildCategorySection(double hit, double wid) {
    return Obx(() {
      final isLoading = controller.categoryList.isEmpty;
      final categoriesToShow = isLoading
          ? List.filled(6, null)
          : controller.categoryList.length > 6
              ? controller.categoryList.sublist(0, 6)
              : controller.categoryList;

      // Constants
      const crossAxisCount = 3;
      const mainAxisSpacing = 12.0;
      const childAspectRatio = 0.8;

      // Calculate child width based on screen width and spacing
      final totalHorizontalPadding =
          32.0 + (crossAxisCount - 1) * mainAxisSpacing;
      final itemWidth = (wid - totalHorizontalPadding) / crossAxisCount;

      // Calculate height of each child based on aspect ratio
      final itemHeight = itemWidth / childAspectRatio;

      // Total Grid height = (2 items * itemHeight) + spacing between rows
      final gridHeight = (2 * itemHeight) + mainAxisSpacing;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => Get.toNamed('/Categories'),
                  child: Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColor.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SizedBox(
              height: gridHeight,
              child: GridView.count(
                crossAxisCount: crossAxisCount,
                mainAxisSpacing: mainAxisSpacing,
                crossAxisSpacing: 12,
                childAspectRatio: childAspectRatio,
                physics: const NeverScrollableScrollPhysics(),
                children: List.generate(categoriesToShow.length, (index) {
                  final category = categoriesToShow[index];
                  return ShimmerLoading(
                    isLoading: isLoading,
                    child: category == null
                        ? _buildCategoryPlaceholderCard(hit, wid)
                        : _buildCategoryCard(category, hit, wid, index),
                  );
                }),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _buildCategoryPlaceholderCard(double hit, double wid) {
    return Container(
      height: hit / 4.5, // Match same fixed height
      width: wid / 3.3,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  Widget _buildCategoryCard(category, double hit, double wid, int index) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(
          '/category_detail_screen',
          arguments: category.category ?? "",
        );
      },
      child: Container(
        height: hit / 4.5, // Fixed height
        width: wid / 3.3, // Optional: keep consistent width
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [BoxShadow(color: Colors.grey, blurRadius: 1)],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      category.category ?? "",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        color:
                            Colors.primaries[index % Colors.primaries.length],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(8),
                    ),
                    child: Image.memory(
                      Uint8List.fromList(category.image!.data!),
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: (hit / 6) / 3.4,
              width: wid / 3.6,
              decoration: BoxDecoration(
                color: Colors.primaries[index % Colors.primaries.length],
                shape: BoxShape.circle,
              ),
            ),
            Container(
              height: (hit / 6) / 3.9,
              width: wid / 3.6,
              alignment: Alignment.center,
              child: ClipOval(
                child: Image.memory(
                  Uint8List.fromList(category.icon!.data!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFoodTypeSection(HomePageController hController) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Obx(() {
        if (hController.isErrorInFoodTypeLoading.value) {
          return _buildErrorIndicator("Something went wrong please try again.");
        }
        if (!hController.isFoodTypeLoaded.value) {
          return CustomCircularIndicator(color: AppColor.primary);
        }
        if (hController.foodTypeList.isEmpty) return Gap(0);

        return SizedBox(
          height: 100,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: hController.foodTypeList.length,
            itemBuilder: (context, index) {
              var foodType = hController.foodTypeList[index];
              return Column(
                children: [
                  Expanded(
                    child: ClipOval(
                      child: Image.memory(
                        Uint8List.fromList(foodType.image!.data!),
                        height: 80,
                        width: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Gap(5),
                  SizedBox(
                    width: 100,
                    child: Text(
                      foodType.foodType ?? "",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gap(16),
          ),
        );
      }),
    );
  }

  Widget _buildSlider2(HomePageController hController, double wid) {
    return Obx(() {
      if (hController.isErrorInBannerLoading.value) {
        return const SizedBox.shrink(); // Don't show on error
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ShimmerLoading(
          isLoading: !hController.isBannerLoaded.value,
          child: hController.slider2BannerList.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/Rectangle_backg.png',
                    // replace with your default image path
                    fit: BoxFit.cover,
                    height: 138,
                  ),
                )
              : CarouselSlider(
                  options: CarouselOptions(
                      viewportFraction: 1, autoPlay: true, height: 140),
                  items: hController.slider2BannerList.map((item) {
                    return Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.memory(
                          Uint8List.fromList(item.image!.data!),
                          fit: BoxFit.cover,
                          height: 140,
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ),
      );
    });
  }

  Widget _buildPopularBusinessTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Popular Businesses',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Gap(0),
          // GestureDetector(
          //   onTap: () => Get.toNamed('/Categories'),
          //   child: Text(
          //     'See All',
          //     style: TextStyle(
          //       fontSize: 14,
          //       fontWeight: FontWeight.bold,
          //       color: AppColor.primary,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildPopularBusinessSection(
      HomePageController hController, double wid) {
    return Obx(() {
      final isLoading = !hController.isBusinessLoaded.value;
      final isError = hController.isErrorInBusinessLoading.value;
      final isEmpty = hController.businessList.isEmpty;

      if (isError) {
        return _buildErrorIndicator("Something went wrong, please try again.");
      }

      final List<BusinessListModel?> businesses =
          isLoading ? List.filled(4, null) : hController.businessList;

      if (!isLoading && isEmpty) {
        return _buildErrorIndicator("Businesses not found.");
      }

      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
          itemCount: businesses.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          separatorBuilder: (context, index) => const Gap(10),
          itemBuilder: (context, index) {
            final business = businesses[index];
            return ShimmerLoading(
              isLoading: isLoading,
              child: business == null
                  ? _buildBusinessPlaceholderCard()
                  : GestureDetector(
                      onTap: () {
                        Get.toNamed('/and_restaurant_details',
                                arguments: {'rId': business.sId ?? ""})
                            ?.then((_) =>
                                Get.delete<AndroidBusinessDetailController>());
                      },
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: const Color(0xfff9f9f9),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColor.gray,
                              blurRadius: 2,
                              offset: const Offset(0.5, 0.5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.memory(
                                  Uint8List.fromList(
                                      business.mainImage!.data!.data!),
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      business.businessName ?? "",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      business.address ?? "",
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      "⭐ ${business.averageRating?.toStringAsFixed(1) ?? "0.0"}",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
            );
          },
        ),
      );
    });
  }

  Widget _buildBusinessPlaceholderCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  Widget _buildErrorIndicator(String message) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(child: Text(message)),
    );
  }

  Widget _buildFAB() {
    bool isPremium =
        UserDataStorageServices.readData(key: UserStorageDataKeys.isPremium) ==
            true;
    return isPremium
        ? Gap(0)
        : Theme(
            data: ThemeData(useMaterial3: false),
            child: FloatingActionButton(
              onPressed: () => Get.toNamed("/Premium"),
              backgroundColor: AppColor.primary,
              child: SvgPicture.asset('assets/icons/Vector.svg'),
            ),
          );
  }
}

extension on String {
  toStringAsFixed(int i) {
    return double.parse(this).toStringAsFixed(i);
  }
}
