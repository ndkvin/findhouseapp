import 'package:findhouseapp/models/facility_mdoel.dart';
import 'package:findhouseapp/theme.dart';
import "package:flutter/material.dart";

class FacilityItem extends StatelessWidget {

  Facility data;

  FacilityItem({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 61,
      width: 83,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            data.image,
            height: 32,
            width: 32,
          ),
          Text.rich(
            TextSpan(
              text: data.number.toString(),
              style: purpleTextStyle.copyWith(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              children: [
                TextSpan(
                  text: " " + data.name,
                  style: greyTextStyle.copyWith(
                    fontSize: 14,
                  )
                )
              ]
            ),
          )
        ],
      ),
    );
  }
}