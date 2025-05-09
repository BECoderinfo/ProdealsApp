import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pro_deals1/utils/colors.dart';
import '../widget/floating_searchbar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String selectedCategory = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text(
          'Search',
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed('/Filter');
            },
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 28,
            ),
          ),
        ],
      ),
      body: Container(
        width: width,
        padding: const EdgeInsets.all(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(80),
                Text(
                  'All Categories',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: AppColor.black300,
                  ),
                ),
                const Gap(20),
                Expanded(
                  child: Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildCategoryChip('North Indian', Icons.local_dining),
                      _buildCategoryChip('Pizza', Icons.local_pizza),
                      _buildCategoryChip('Shake', Icons.local_cafe),
                      _buildCategoryChip('Desserts', Icons.cake),
                      _buildCategoryChip('Chocolate', Icons.ac_unit),
                    ],
                  ),
                ),
              ],
            ),
            buildFloatingSearchBar(context),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, IconData icon) {
    bool isSelected = selectedCategory == label;

    return ChoiceChip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 20, color: isSelected ? Colors.white : Colors.black),
          const Gap(4),
          Text(
            label,
            style: GoogleFonts.openSans(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
      selected: isSelected,
      backgroundColor: Colors.grey.shade200,
      selectedColor: AppColor.primary,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: (bool selected) {
        setState(() {
          selectedCategory = selected ? label : '';
        });
      },
    );
  }
}
