import 'package:findhouseapp/pages/home_page.dart';
import 'package:findhouseapp/theme.dart';
import "package:flutter/material.dart";

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/404.png",
              height: 86,
              width: 300,
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Where are you going?",
              style: blackTextStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Seems like the page that you were",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300
              ),
            ),
            Text(
              "requested is already gone",
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.w300
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const HomePage(),
                  ),
                );
              },
              child: Container(
                height: 50,
                width: 210,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: purpleColor,
                ),
                child: Center(
                  child: Text(
                    "Back to Home",
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    )
                  ),
                )
              ),
            )
          ],
        )
      )
    );
  }
}