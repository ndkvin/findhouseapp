import 'package:findhouseapp/models/city_model.dart';
import 'package:findhouseapp/models/place_model.dart';
import 'package:findhouseapp/models/tips_model.dart';
import 'package:findhouseapp/providers/space_provider.dart';
import 'package:findhouseapp/theme.dart';
import 'package:findhouseapp/widgets/button_navbar_material.dart';
import 'package:findhouseapp/widgets/city_card.dart';
import 'package:findhouseapp/widgets/place_card.dart';
import 'package:findhouseapp/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var spaceProvider = Provider.of<SpaceProvider>(context);

  
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
              FutureBuilder(
                future: spaceProvider.getRecomendedSpace(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.hasData) {
                    List<PlaceModel> datas = snapshot.data;
                    return Column(
                      children: datas.map((data) => PlaceCard(data: data)).toList()
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
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
                  TipsCard(
                    data: Tips(
                      date: "20 Apr",
                      image: "assets/images/cg.png",
                      name: "City Guidelines"
                    )
                  ),
                  TipsCard(
                    data: Tips(
                      date: "11 Dec",
                      image: "assets/images/jf.png",
                      name: "Jakarta Fairship"
                    )
                  ),
                ],
              ),
              
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 65,
        width: MediaQuery.of(context).size.width - (2*24),
        margin: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        decoration: BoxDecoration(
          color: Color(0XFFF6F7F8),
          borderRadius: BorderRadius.circular(23)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ButtonNavbarItem(
              isSelected: true,
              image: "assets/icons/homegray.png"
            ),
            ButtonNavbarItem(
              image: "assets/icons/mail.png"
            ),
            ButtonNavbarItem(
              image: "assets/icons/Icon_card_solid.png"
            ),
            ButtonNavbarItem(
              image: "assets/icons/like.png"
            ),
          ],
        ),
      ),
    );
  }
}