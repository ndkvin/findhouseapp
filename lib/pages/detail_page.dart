import 'package:findhouseapp/models/facility_mdoel.dart';
import 'package:findhouseapp/models/place_model.dart';
import 'package:findhouseapp/pages/404_page.dart';
import 'package:findhouseapp/theme.dart';
import 'package:findhouseapp/widgets/facilitiy_item.dart';
import "package:flutter/material.dart";
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {

  PlaceModel data;

  DetailPage({
    Key? key,
    required this.data
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    _launchUrl(String url) async {
      if(await canLaunch(url)) {
        await launch(url);
      } else {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => NotFoundPage(),
          )
        );
      }
    }

    return Scaffold(
      body: SafeArea(
        right: false,
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              data.imageUrl,
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 328,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)
                    )
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.name,
                                  style: regulerTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "\$${data.price}",
                                    style: regulerTextStyle.copyWith(
                                      color: purpleColor,
                                      fontSize: 16
                                    ),
                                    children: [
                                      TextSpan(
                                        text: " / month",
                                        style: purpleTextStyle.copyWith(
                                          fontSize: 16
                                        )
                                      )
                                    ]
                                  )
                                )
                              ],
                            ),
                            Wrap(
                              children: List.generate(5, (index) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                    left: 2
                                  ),
                                  child: Icon(
                                    Icons.star,
                                    color: index < data.rating ? Color(0XFFFF9376) : Color(0XFF989BA1),
                                    size: 20,
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Main Facilities",
                          style: regulerTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                        
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FacilityItem(
                              data: Facility(
                                image: "assets/images/bar.png",
                                number: data.numberOfKitchens,
                                name: "kitchen",
                              ),
                            ),
                            FacilityItem(
                              data: Facility(
                                image: "assets/images/badroom-icon.png",
                                number: data.numberOfBedrooms,
                                name: "bedroom",
                              ),
                            ),FacilityItem(
                              data: Facility(
                                image: "assets/images/lemari-icon.png",
                                number: data.numberOfBedrooms,
                                name: "almari",
                              ),
                            ),
                            
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Photos",
                          style: regulerTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 88,
                          child: ListView.builder(
                            itemCount: data.photos.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                  right: 5
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: Image.network(
                                    data.photos[index],
                                    height: 88,
                                    width: 110,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Location",
                          style: blackTextStyle.copyWith(
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  data.address,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14
                                  ),
                                ),
                                Text(
                                  data.city,
                                  style: greyTextStyle.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              onTap: () {              
                                _launchUrl(data.mapUrl);
                              },
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: const Color(0XFFF5F5F5),
                                  borderRadius: BorderRadius.circular(20)
                                ),
                                child: const Icon(
                                  Icons.location_pin,
                                  color: Color(0XFF3A3379),
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () {
                            _launchUrl("tel:+${data.phone}");
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.circular(20)
                            ),
                            child: Center(
                              child: Text(
                                "Book Now",
                                style: whiteTextStyle.copyWith(
                                  fontSize: 16
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 33,
                top: 24
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: Color(0XFF3A3379),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.bookmark_add_outlined,
                      size: 20,
                      color: Color(0XFF3A3379),
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}