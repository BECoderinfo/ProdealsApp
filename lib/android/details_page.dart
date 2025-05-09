import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';
import 'package:pro_deals1/utils/colors.dart';

import '../widget/offer_card.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int quantity = 1;
  double price = 5.10;
  double discountPrice = 7.0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('offers'),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColor.primary,
                ),
              ),
              title: Text("Hamburger"),
              subtitle: Row(
                children: [
                  RatingBarIndicator(
                    rating: 4.5,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 20.0,
                    direction: Axis.horizontal,
                  ),
                  const Gap(8),
                  Text("4.5"),
                ],
              ),
            ),
            Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OfferCard(
                      offerText: "Get Flat 20% Off on any order",
                      validityText: "Valid on: All days",
                      expirationDate: "December 31, 2024",
                      offerCode: "SAVE20",
                    ),
                    OfferCard2(
                      offerText: "Get ₹200 items in ₹170",
                      validityText: "Valid on: All days",
                      expirationDate: "December 31, 2024",
                      offerCode: "SAVE20",
                      price: '170',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQuantityButton(IconData icon, {bool isAddButton = false}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isAddButton) {
            quantity++;
          } else {
            if (quantity > 1) {
              quantity--;
            }
          }
        });
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.circular(6),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          color: isAddButton ? AppColor.primary : Colors.black,
        ),
      ),
    );
  }
}
