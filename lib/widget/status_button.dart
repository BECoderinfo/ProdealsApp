import 'package:pro_deals1/imports.dart';

class StatusButton extends StatelessWidget {
  final Color bColor;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  const StatusButton({
    super.key,
    this.bColor = Colors.transparent,
    this.backgroundColor = Colors.transparent,
    required this.textColor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          width: 1,
          color: bColor,
        ),
        color: backgroundColor,
      ),
      child: Text(
        "$text",
        style: TextStyle(
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
