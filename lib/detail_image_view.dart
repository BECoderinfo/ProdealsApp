import 'package:pro_deals1/imports.dart';

class DetailImageView extends GetView<DetailImageViewController> {
  const DetailImageView({super.key});

  @override
  Widget build(BuildContext context) {
    final DetailImageViewController imageViewController =
        Get.put(DetailImageViewController());
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Image Viewer",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
        backgroundColor: const Color(0xFFD6AA26),
      ),
      body: PhotoViewGallery.builder(
        itemCount: imageViewController.images.length,
        builder: (BuildContext context, int index) {
          return PhotoViewGalleryPageOptions(
            imageProvider: MemoryImage(Uint8List.fromList(
                imageViewController.images[index].data!.data!)),
            minScale: PhotoViewComputedScale.contained,
            maxScale: PhotoViewComputedScale.covered * 2,
          );
        },
        scrollPhysics: BouncingScrollPhysics(),
        pageController: imageViewController.pageController,
      ),
    );
  }
}
