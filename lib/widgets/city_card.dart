import 'package:findhouseapp/models/city_model.dart';
import 'package:findhouseapp/theme.dart';
import 'package:flutter/material.dart';

class CityCard extends StatelessWidget {
  City city;

  CityCard({
    Key? key,
    required this.city
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 10
      ),
      height: 150,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: whiteColor,
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.image,
                  height: 102,
                  width: 120,
                  fit: BoxFit.cover,
                ),
                city.isFav ? Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 30,
                    width: 50,
                    decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(36)
                      )
                    ),
                    child: Center(
                      child: Icon(
                        Icons.star_rounded,
                        color: orangeColor,
                        size: 16,
                      ),
                    ),
                  ),
                ) : Container(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                city.name,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}