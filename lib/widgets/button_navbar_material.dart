import "package:flutter/material.dart";

class ButtonNavbarItem extends StatelessWidget {
  bool isSelected;
  String image;

  ButtonNavbarItem({
    Key? key,
    this.isSelected = false,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          image,
          width: 26,
        ),
        const Spacer(),
        isSelected ? Container(
          height: 3,
          width: 30,
          decoration: BoxDecoration(
            color: const Color(0XFF7F74EB),
            borderRadius: BorderRadius.circular(2),
          ),
        ) : Container(),
      ],
    );
  }
}