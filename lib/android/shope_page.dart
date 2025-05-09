import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/utils/colors.dart';

import '../widget/offer_card.dart';

class shope_page extends StatefulWidget {
  const shope_page({super.key});

  @override
  State<shope_page> createState() => _shope_pageState();
}

class _shope_pageState extends State<shope_page>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  PageController page = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shope'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: SizedBox(
        height: hit,
        width: wid,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: (tabController.index == 0)
                  ? Expanded(
                      key: ValueKey<int>(0),
                      flex: 6,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: hit / 2.3,
                              width: wid,
                              child: Stack(
                                children: [
                                  Container(
                                    height: hit / 3,
                                    width: wid,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage('assets/images/CC.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 16,
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      height: hit / 4,
                                      width: wid - 32,
                                      decoration: BoxDecoration(
                                        color: AppColor.white,
                                        borderRadius: BorderRadius.circular(10),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 3,
                                            color:
                                                AppColor.gray.withOpacity(0.5),
                                            offset: const Offset(1, 1),
                                          ),
                                        ],
                                      ),
                                      padding: const EdgeInsets.all(6),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Cofee Culture',
                                                style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                ),
                                              ),
                                              const Text('- Range ₹200 - ₹400'),
                                            ],
                                          ),
                                          Text(
                                            'The Ristorante Lounge',
                                            style: GoogleFonts.openSans(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                ),
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Open Now',
                                                  style: GoogleFonts.openSans(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 16,
                                                    color: AppColor.white,
                                                  ),
                                                ),
                                              ),
                                              const Gap(4),
                                              Text(
                                                '10:00 AM -11:00 PM',
                                                style: GoogleFonts.openSans(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16,
                                                ),
                                              )
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.toNamed('/location');
                                            },
                                            child: const Row(
                                              children: [
                                                Icon(Icons.location_on),
                                                Gap(4),
                                                Text(
                                                    'Khodiyar Nivas, Vesu, Surat'),
                                              ],
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Icon(
                                                Icons.wifi_calling_3_sharp,
                                                color: AppColor.primary,
                                              ),
                                              const Gap(4),
                                              const Text('+91 223 234 6789'),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : SizedBox(
                      key: ValueKey<int>(1),
                    ),
            ),
            Expanded(
              flex: 1,
              child: TabBar(
                onTap: (value) {
                  page.jumpToPage(value);
                },
                controller: tabController,
                labelColor: AppColor.primary,
                dividerColor: Colors.transparent,
                indicatorColor: AppColor.primary,
                tabs: [
                  Tab(
                    text: 'About',
                  ),
                  Tab(
                    text: 'Offers',
                  ),
                  Tab(
                    text: 'Gallery',
                  ),
                  Tab(
                    text: 'Menu',
                  ),
                ],
              ),
            ),
            Gap(6),
            Expanded(
              flex: (tabController.index == 0) ? 5 : 14,
              child: PageView(
                controller: page,
                onPageChanged: (value) {
                  setState(() {
                    tabController.index = value;
                  });
                },
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SizedBox(
                            width: wid,
                            child: const Text(
                                'Coffee Culture The Ristorante Lounge is located off road in the heart of the heart of the main highstreet in the city...Read More '),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Cuisines :',
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Cafe, Mexican, Fusion',
                            style: GoogleFonts.openSans(),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Special Diets :',
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Vegetarian',
                            style: GoogleFonts.openSans(),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Best Selling Items :',
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'coffees, unique mocktails, pizzas',
                            style: GoogleFonts.openSans(),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                            'Features :',
                            style: GoogleFonts.openSans(
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: wid / 2 - 16,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.delivery_dining_sharp,
                                      color: AppColor.primary,
                                    ),
                                    const Gap(10),
                                    Text('Delivery'),
                                  ],
                                ),
                              ),
                              Container(
                                height: 30,
                                width: wid / 2 - 16,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.ac_unit,
                                      color: AppColor.primary,
                                    ),
                                    const Gap(10),
                                    Text('Air Conditioned'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Container(
                            height: 30,
                            width: wid / 2 - 16,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.tv,
                                  color: AppColor.primary,
                                ),
                                const Gap(10),
                                Text('Live Screening'),
                              ],
                            ),
                          ),
                        ),
                        const Gap(10),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        OfferCard(
                          offerText: "Get Flat 20% Off on any order",
                          validityText: "Valid on: All days",
                          expirationDate: "December 31, 2024",
                          offerCode: "SAVE10",
                        ),
                        OfferCard2(
                          offerText: "Get ₹200 items in ₹170",
                          validityText: "Valid on: All days",
                          expirationDate: "December 31, 2024",
                          offerCode: "SAVE20",
                          price: '170',
                        ),
                        OfferCard2(
                          offerText: "Get ₹300 items in ₹250",
                          validityText: "Valid on: All days",
                          expirationDate: "December 31, 2024",
                          offerCode: "SAVE30",
                          price: '250',
                        ),
                        OfferCard(
                          offerText: "Get Flat 10% Off on any order",
                          validityText: "Valid on: All days",
                          expirationDate: "December 31, 2024",
                          offerCode: "SAVE40",
                        ),
                        OfferCard2(
                          offerText: "Get ₹230 items in ₹200",
                          validityText: "Valid on: All days",
                          expirationDate: "December 31, 2024",
                          offerCode: "SAVE50",
                          price: '200',
                        ),
                      ],
                    ),
                  ),
                  MasonryGridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cc1.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cc2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cc3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cc4.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  MasonryGridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/menu1.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/menu2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/menu3.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/cc2.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
