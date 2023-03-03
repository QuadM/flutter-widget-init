// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:init_widgets/models/SG_feed_model.dart';

// ignore: must_be_immutable
class ProfileImage extends StatelessWidget {
  // -------------------------------widget
  //  profile image exists in main profile screen and avatar customization screen
  final ProfileImageModel
      img; //---------------------- img is a varibale of type ProfileImageModel
  final double size;
  // String imgurl;

  const ProfileImage({
    Key? key,
    required this.img,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double radius = size;
    return CircleAvatar(
      backgroundColor: img.background,
      radius: radius,
      child: Stack(
        children: <Widget>[
          Positioned(
              left: 0,
              top: 0,
              width: (radius * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(img.skinColor),
              )),

          Positioned(
              left: 0,
              top: 0,
              width: (radius * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(img.tShirt),
              )),
          Positioned(
              left: 0,
              top: 0,
              width: (radius * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(img.faceFeatures),
              )),
          Positioned(
              left: 0,
              top: 0,
              width: (radius * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(radius),
                child: Image.asset(img.hair),
              )),
          // if (img.glasses != "") ...[
          //   Positioned(
          //       left: 0,
          //       top: 0,
          //       width: (radius * 2),
          //       child: ClipRRect(
          //         borderRadius: BorderRadius.circular(radius),
          //         child: Image.asset(img.glasses),
          //       )),
          // ],
          if (img.accessories.isNotEmpty)
            ...img
                .accessories // destructuring accessories list [postisioned(), positioned(), positioned(), etc.] to make it postisioned(), positioned(), positioned(), etc.
                .map<Widget>(
                  (accessory) => Positioned(
                      left: 0,
                      top: 0,
                      width: (radius * 2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(radius),
                        child: Image.asset(accessory),
                      )),
                )
                .toList()
        ],
      ),
    );
  }
}


/* 

skin color
accessories
t-shirt
hair
male/female
background

*/
