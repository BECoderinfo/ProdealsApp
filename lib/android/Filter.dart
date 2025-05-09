import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String _selectedSortBy = 'Popular';
  String? _selectedCategory;
  String? _selectedOption;
  String? _selectedDistance;
  String? _selectedLocation;
  String? _selectedRating;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primary,
        title: Text('Apply Filter'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sort by',
              style: TextStyle(
                color: AppColor.black300,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildRadioListTile('Popular', 'Popular', Icons.star),
            _buildRadioListTile('Location', 'Nearest to me', Icons.location_on),
            _buildRadioListTile('Discount', 'High to low', Icons.price_check),
            _buildRadioListTile('Price', 'Low to high', Icons.attach_money),
            _buildRadioListTile('Prices', 'High to low', Icons.attach_money),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildExpansionTile('Categories', _selectedCategory, Icons.category, (value) {
                      setState(() {
                        _selectedCategory = value;
                      });
                    }),
                    const SizedBox(height: 10),
                    _buildExpansionTile('Options', _selectedOption, Icons.settings, (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    }),
                    const SizedBox(height: 10),
                    _buildExpansionTile('Distance', _selectedDistance, Icons.map, (value) {
                      setState(() {
                        _selectedDistance = value;
                      });
                    }),
                    const SizedBox(height: 10),
                    _buildExpansionTile('Location', _selectedLocation, Icons.location_pin, (value) {
                      setState(() {
                        _selectedLocation = value;
                      });
                    }),
                    const SizedBox(height: 10),
                    _buildExpansionTile('Rating', _selectedRating, Icons.star_rate, (value) {
                      setState(() {
                        _selectedRating = value;
                      });
                    }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomButton(
              'Reset',
              AppColor.white,
              AppColor.primary,
                  () {
                setState(() {
                  _selectedSortBy = 'Popular';
                  _selectedCategory = null;
                  _selectedOption = null;
                  _selectedDistance = null;
                  _selectedLocation = null;
                  _selectedRating = null;
                });
              },
              width / 2.3,
            ),
            _buildBottomButton(
              'Apply',
              AppColor.white,
              AppColor.primary,
                  () {
                // Handle the apply action
              },
              width / 2.3,
              backgroundColor: AppColor.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioListTile(String value, String title, IconData icon) {
    return RadioListTile<String>(
      value: value,
      groupValue: _selectedSortBy,
      title: Row(
        children: [
          Icon(icon, color: AppColor.primary),
          const SizedBox(width: 10),
          Text(title),
        ],
      ),
      onChanged: (selectedValue) {
        setState(() {
          _selectedSortBy = selectedValue!;
        });
      },
    );
  }

  Widget _buildExpansionTile(String title, String? selectedValue, IconData icon, void Function(String?) onChanged) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: Row(
          children: [
            Icon(icon, color: AppColor.primary),
            const SizedBox(width: 10),
            Text(
              title,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
        children: [
          for (String category in _categories) // Use dynamic data if available
            RadioListTile<String>(
              value: category,
              groupValue: selectedValue,
              onChanged: onChanged,
              title: Row(
                children: [
                  Icon(Icons.check_box, color: AppColor.primary),
                  const SizedBox(width: 10),
                  Text(category),
                ],
              ),
            ),
        ],
      ),
    );
  }

  List<String> get _categories => [
    'Cuisines',
    'Bakery & Dessert',
    'Fashion & Design',
    'Sports & Outdoors',
    'Beauty & Saloon',
    'Gift & Card',
    'Activity',
  ];

  Widget _buildBottomButton(
      String text,
      Color textColor,
      Color borderColor,
      VoidCallback onPressed,
      double width, {
        Color? backgroundColor,
      }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          borderRadius: BorderRadius.circular(6),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: GoogleFonts.openSans(
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
