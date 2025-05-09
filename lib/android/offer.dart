import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gap/gap.dart';
import 'package:pro_deals1/utils/colors.dart';

class OffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offer'),
        backgroundColor: AppColor.primary,
        leading: IconButton(icon: Icon(Icons.arrow_back_ios_sharp), onPressed: () {
          Get.back();
        },),
      ),
      body: ListView(
        padding: EdgeInsets.all(8.0),
        children: [
          OfferCard(
            imageUrl: 'https://via.placeholder.com/150',
            name: 'Coffee Culture',
            location: 'Vesu',
            rating: 3.5,
            votes: 621,
            description: 'Rs.250 Off On A Minimum Billing Of Rs.1000',
          ),
          OfferCard(
            imageUrl: 'https://via.placeholder.com/150',
            name: 'Shiva Restaurant',
            location: 'Varacha',
            rating: 4.3,
            votes: 78,
            description: 'Buy 1 Get 1 Half Soup At Rs.126',
          ),
          OfferCard(
            imageUrl: 'https://via.placeholder.com/150',
            name: 'Tulsi Restaurant & Banquet',
            location: 'Adajan',
            rating: 4.3,
            votes: 96,
            description: '50% Off on buffet + 25% Off',
          ),
        ],
      ),
    );
  }
}

class OfferCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String location;
  final double rating;
  final int votes;
  final String description;

  OfferCard({
    required this.imageUrl,
    required this.name,
    required this.location,
    required this.rating,
    required this.votes,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColor.black300,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0, bottom: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(
                    imageUrl,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ),
                      ),
                      Text(
                        location,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star, color: AppColor.primary, size: 16),
                          SizedBox(width: 5),
                          Text(
                            '$rating',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: AppColor.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '($votes Votes)',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    description,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Gap(4),
                Container(
                  height: 30,
                  width: 1,
                  color: Colors.white,
                ),
                Gap(6),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Offer'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColor.white,
                      backgroundColor: AppColor.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
