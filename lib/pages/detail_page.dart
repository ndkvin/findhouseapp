import 'package:findhouseapp/models/facility_mdoel.dart';
import 'package:findhouseapp/theme.dart';
import 'package:findhouseapp/widgets/facilitiy_item.dart';
import "package:flutter/material.dart";

class DetailPage extends StatelessWidget {

  int rating = 4;

  DetailPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.asset(
              "assets/images/city3.png",
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 33,
                right: 33,
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
                                  "Kuretakeso Hott",
                                  style: regulerTextStyle.copyWith(
                                    fontSize: 22,
                                  ),
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "\$52",
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
                                    color: index < rating ? Color(0XFFFF9376) : Color(0XFF989BA1),
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
                                number: 2,
                                name: "kitchen",
                              ),
                            ),
                            FacilityItem(
                              data: Facility(
                                image: "assets/images/badroom-icon.png",
                                number: 3,
                                name: "bedroom",
                              ),
                            ),FacilityItem(
                              data: Facility(
                                image: "assets/images/lemari-icon.png",
                                number: 3,
                                name: "almari",
                              ),
                            ),
                            
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                
              ]
            )
          ],
        )
      ),
    );
  }
}