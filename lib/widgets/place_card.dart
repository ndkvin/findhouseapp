import 'package:findhouseapp/models/place_model.dart';
import 'package:findhouseapp/pages/detail_page.dart';
import 'package:findhouseapp/theme.dart';
import "package:flutter/material.dart";

class PlaceCard extends StatelessWidget {
  PlaceModel data;
  
  PlaceCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DetailPage(data: data,)
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 30
        ),
        height: 110,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                height: 110,
                width: 130,
                child: Stack(
                  children: [
                    Image.network(
                      data.imageUrl,
                      width: 130,
                      height: 110,
                      fit: BoxFit.cover,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(36)
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                            Icon(
                              Icons.star_rounded,
                              color: orangeColor,
                              size: 13,
                            ),
                            Text(
                              data.rating.toString()+"/5",
                              style: regulerTextStyle.copyWith(
                                color: whiteColor,
                                fontSize: 13
                              )
                            )
                          ] 
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Container(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.name,
                    style: blackTextStyle.copyWith(
                      fontSize: 18
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$" + data.price.toString(),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16
                        ),
                      ),
                      Text(
                        " / month",
                        style: regulerTextStyle.copyWith(
                          fontSize: 14,
                          color: greyColor,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.address,
                    style: regulerTextStyle.copyWith(
                      fontSize: 14,
                      color: greyColor,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}