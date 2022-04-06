import 'package:findhouseapp/models/tips_model.dart';
import 'package:findhouseapp/theme.dart';
import "package:flutter/material.dart";

class TipsCard extends StatelessWidget {
  Tips data;

  TipsCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(
        bottom: 30
      ),
      child: Row(
        children: [
          ClipRRect(
            child: Image.asset(
              data.image,
              width: 80,
              height: 80,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                data.name,
                style: regulerTextStyle.copyWith(
                  fontSize: 18
                )
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Updated "+data.date,
                style: greyTextStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: IconButton(
              onPressed: () { },
              icon: Icon(Icons.chevron_right)
            ),
          )
        ],
      ),
    );
  }
}