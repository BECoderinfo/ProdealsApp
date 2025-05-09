import '../imports.dart';

class confirm extends StatelessWidget {
  const confirm({super.key});

  @override
  Widget build(BuildContext context) {
    double hit = MediaQuery.of(context).size.height;
    double wid = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: hit,
        width: wid,
        color: AppColor.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: hit / 3,
              width: wid / 2,
              child: SvgPicture.asset('assets/images/svg/confirm.svg'),
            ),
            const Gap(10),
            Text(
              'Successfully',
              style: GoogleFonts.poppins(
                color: AppColor.black300,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              'Your account has been\ncreated.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: AppColor.black300,
                fontSize: 16,
                fontWeight: FontWeight.w200,
              ),
            ),
            const Gap(30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: GestureDetector(
                onTap: () {
                  currentPageIndex.value = 0;
                  Get.toNamed('/navigation');
                },
                child: Container(
                  height: 50,
                  width: wid,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.primary,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        blurRadius: 2,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Text(
                    'Continue',
                    style: GoogleFonts.roboto(
                      color: AppColor.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
