import '../imports.dart';

class successfully extends StatelessWidget {
  const successfully({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Create Business",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.offNamedUntil(
                '/dashboard',
                (route) => false,
              );
            },
            icon: const Icon(Icons.arrow_back)),
        backgroundColor: const Color(0xFFD6AA26),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            SvgPicture.asset("assets/images/svg/confirm.svg"),
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Successfully",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Gap(15),
            const Text(
              "Your Account Has been\nCreated.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14),
            ),
            Gap(40),
            GestureDetector(
              onTap: () {
                Get.offNamedUntil(
                  '/dashboard',
                  (route) => false,
                );
              },
              child: Container(
                height: 50,
                width: 230,
                decoration: BoxDecoration(
                  color: const Color(0xFFD6AA26),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    "Countinue",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
