import 'package:pro_deals1/imports.dart';
import 'dart:ui';

class QrController extends GetxController {
  GlobalKey globalKey = GlobalKey();

  Future<void> captureAndSaveImage() async {
    try {
      RenderRepaintBoundary boundary =
          globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      var image = await boundary.toImage(pixelRatio: 2.0);
      ByteData? byteData = await image.toByteData(format: ImageByteFormat.png);
      Uint8List pngBytes = byteData!.buffer.asUint8List();

      final directory = await getTemporaryDirectory();
      final imagePath = '${directory.path}/${DateTime.now()}.png';
      File imgFile = File(imagePath);
      await imgFile.writeAsBytes(pngBytes);

      Share.shareXFiles([XFile(imgFile.path)], text: 'Check out this image!');
    } catch (e) {
      print(e.toString());
    }
  }
}
