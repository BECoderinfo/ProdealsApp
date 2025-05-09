import 'package:pro_deals1/imports.dart';

class My_TextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final String hintText;
  final TextInputType? kType;
  final void Function(String)? onFieldSubmitted;
  final void Function()? onTap;
  final bool? readOnly;

  const My_TextFiled({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.kType,
    this.readOnly,
    this.onTap,
    this.onFieldSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      maxLines: 1,
      readOnly: readOnly ?? false,
      onTap: onTap,
      onFieldSubmitted: onFieldSubmitted,
      keyboardType: kType ?? TextInputType.name,
      controller: controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.red),
        ),
        hintText: hintText,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColor.red),
        ),
      ),
    );
  }
}

Widget textFiled(TextEditingController controller) {
  return TextField(
    maxLines: 1,
    controller: controller,
    decoration: const InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
      ),
    ),
  );
}
