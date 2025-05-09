import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../utils/colors.dart';

class OfferCard extends StatelessWidget {
  final String offerText;
  final String validityText;
  final String expirationDate;
  final String offerCode;

  const OfferCard({
    Key? key,
    required this.offerText,
    required this.validityText,
    required this.expirationDate,
    required this.offerCode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 150,
        // Reduced height
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.black300,
        ),
        padding: const EdgeInsets.all(12),
        // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  offerText,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 14, // Adjusted font size
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                Spacer(),
                Text(
                  '20% Off',
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
            const Gap(8), // Reduced gap
            Text(
              validityText,
              style: TextStyle(
                color: AppColor.white,
                fontSize: 13, // Adjusted font size
              ),
            ),
            const Gap(6), // Reduced gap
            Text(
              "Expires on: $expirationDate",
              style: TextStyle(
                color: AppColor.white.withOpacity(0.8),
                fontSize: 12, // Adjusted font size
              ),
            ), // Reduced gap
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle button press (e.g., show offer details)
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primary,
                    side: BorderSide(color: AppColor.primary),
                    minimumSize: Size(100, 30),
                    // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: const Text('Show Details'),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press (e.g., open details or redeem offer)
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.primary,
                    // Text color
                    minimumSize: Size(100, 30),
                    // Adjusted size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('redeem'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class OfferCard2 extends StatelessWidget {
  final String offerText;
  final String validityText;
  final String expirationDate;
  final String offerCode;
  final String price;

  const OfferCard2({
    Key? key,
    required this.offerText,
    required this.validityText,
    required this.expirationDate,
    required this.offerCode,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        height: 150,
        // Reduced height
        width: width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColor.black300,
        ),
        padding: const EdgeInsets.all(12),
        // Reduced padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    offerText,
                    style: TextStyle(
                      color: AppColor.white,
                      fontSize: 14, // Adjusted font size
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '₹ $price',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const Gap(8), // Reduced gap
            Text(
              validityText,
              style: TextStyle(
                color: AppColor.white,
                fontSize: 13, // Adjusted font size
              ),
            ),
            const Gap(6), // Reduced gap
            Text(
              "Expires on: $expirationDate",
              style: TextStyle(
                color: AppColor.white.withOpacity(0.8),
                fontSize: 12, // Adjusted font size
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle button press (e.g., show offer details)
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.primary,
                    side: BorderSide(color: AppColor.primary),
                    minimumSize: Size(100, 30), // Border color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                  child: const Text('Show Details'),
                ),
                const Gap(10),
                ElevatedButton(
                  onPressed: () {
                    // Handle button press (e.g., open details or redeem offer)
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: AppColor.white,
                    backgroundColor: AppColor.primary, // Text color
                    minimumSize: Size(100, 30), // Adjusted size
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
