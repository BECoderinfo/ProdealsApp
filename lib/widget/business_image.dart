import 'package:pro_deals1/imports.dart';

class BusinessImage {
  static Widget mainStoreImageWidget() {
    return Container(
      height: 40,
      width: 40,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: ClipOval(
          child: UserDataStorageServices.readData(
                      key: UserStorageDataKeys.businessImage) ==
                  null
              ? Image.asset(
                  'assets/images/profile_image.png',
                  key: ValueKey('errorImage'),
                  fit: BoxFit.cover,
                )
              : Image.memory(
                  Uint8List.fromList(
                    UserDataStorageServices.readData(
                            key: UserStorageDataKeys.businessImage)
                        .where((element) =>
                            element is int ||
                            element is String ||
                            element is double)
                        .map<int>((element) {
                      if (element is String) {
                        return int.tryParse(element) ?? 0;
                      } else if (element is double) {
                        return element.toInt();
                      }
                      return element as int;
                    }).toList(),
                  ),
                  fit: BoxFit.cover,
                  height: 40,
                  width: 40,
                  key: ValueKey('memoryImage'),
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset(
                      'assets/images/profile_image.png',
                      key: ValueKey('errorImage'),
                      fit: BoxFit.cover,
                    );
                  },
                ),
        ),
      ),
    );
  }
}
