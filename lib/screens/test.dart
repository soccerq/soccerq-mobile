import 'package:flutter/material.dart';
import 'package:soccerq_mobile/misc/constants/app_assets.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height,
              color: const Color(0xffEE6C4F),
              width: MediaQuery.of(context).size.width,
            ),
            const Align(
                alignment: Alignment.topRight,
                child: RotatedBox(
                    quarterTurns: 1,
                    child: Text(
                      "SoccerQ",
                      style: TextStyle(fontSize: 150, color: Color(0xffF39884)),
                    ))),
            Align(
              alignment: Alignment.topCenter,
              // Align to the right side
              child: Transform.scale(
                scale: 2, // Enlarge the image by 1.5 times
                child: const Image(
                  // fit: BoxFit.fill,
                  image: AssetImage(
                    AppAssets.splashImage,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                // height: 10,
                width: 300,
                child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                    side: BorderSide(color: Colors.white)))),
                    child: const Text(
                      "Login",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
