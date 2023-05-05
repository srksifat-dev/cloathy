import 'package:cloathy/feature/home/screen/home_screen.dart';
import 'package:cloathy/feature/main_screen/screen/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingScreenSecond extends StatelessWidget {
  const OnboardingScreenSecond({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Image.asset(
                        "assets/images/onboarding-02.png")), //TODO: Place an Image
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "EXPLORING THE\nFASHION TRENDS",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Text(
                "We form an assortment that\nfollows fashion trends.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    style: ButtonStyle(
                        padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        )),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16))),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                    onPressed: () {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (context) => MainScreen()));
                    },
                    child: Text(
                      "Done",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
