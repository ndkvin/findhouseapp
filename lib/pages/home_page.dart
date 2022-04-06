import 'package:findhouseapp/models/city_model.dart';
import 'package:findhouseapp/models/place_model.dart';
import 'package:findhouseapp/theme.dart';
import 'package:findhouseapp/widgets/city_card.dart';
import 'package:findhouseapp/widgets/place_card.dart';
import 'package:findhouseapp/widgets/tips_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 24,
            top: 24,
          ),
          child: ListView(
            children: [
              // * Header
              Text(
                'Explore Now',
                style: blackTextStyle.copyWith(
                  fontSize: 24
                ),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Mencari kosan yang cozy',
                style: greyTextStyle.copyWith(
                  fontSize: 16
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              // * Popular Cities
              Text(
                'Popular Cities',
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CityCard(
                      city: City(
                        image: 'assets/images/city1.png',
                        name: 'Jakarta',
                      ),
                    ),
                    CityCard(
                      city: City(
                        image: 'assets/images/city2.png',
                        name: 'Bandung',
                        isFav: true
                      ),
                    ),
                    CityCard(
                      city: City(
                        image: 'assets/images/city3.png',
                        name: 'Surabaya',
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Recommended Space",
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  PlaceCard(
                    data: PlaceModel(
                      image: "assets/images/place1.png",
                      location: "Bandung, Germany",
                      name: "Kuretakeso Hott" ,
                      price: 52,
                      rating: 4,
                    ),
                  ),
                  PlaceCard(
                    data: PlaceModel(
                      image: "assets/images/place2.png",
                      location: "Seattle, Bogor",
                      name: "Roemah Nenek" ,
                      price: 11,
                      rating: 5,
                    ),
                  ),
                  PlaceCard(
                    data: PlaceModel(
                      image: "assets/images/place3.png",
                      location: "Jakarta, Indonesia",
                      name: "Darrling How" ,
                      price: 20,
                      rating: 3,
                    ),
                  ),
                ],
              ),
              Text(
                "Tips & Guidance",
                style: regulerTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  TipsCard(),
                  TipsCard()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}