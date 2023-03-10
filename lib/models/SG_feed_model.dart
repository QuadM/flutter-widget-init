// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

List<String> weekdays = [
  "Sat",
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
];
List<String> months = [
  "Jan",
  "Feb",
  "Mar",
  "Apr",
  "May",
  "Jun",
  "Jul",
  "Aug",
  "Sep",
  "Oct",
  "Nov",
  "Dec",
];

class PostData {
  List<PostLabel> postLabelList;
  List<InnerPostData> innerPostList;
  ProfileImageModel profileImageModel;
  Vote upVotes;
  Vote downVotes;
  DateTime dateTime;
  String username;
  String hashId;
  int shares;
  int comments;
  int views;

  PostData({
    required this.profileImageModel,
    this.username = "",
    this.hashId = "",
    required this.upVotes,
    required this.downVotes,
    required this.dateTime,
    this.innerPostList = const [],
    this.postLabelList = const [],
    this.shares = 0,
    this.comments = 0,
    this.views = 0,
  });

  String get getDate {
    if (DateTime.now().year - dateTime.year >= 1) {
      return "${dateTime.year} ${months[dateTime.month - 1]} ${dateTime.day} • ";
    }
    if (DateTime.now().month - dateTime.month >= 1) {
      return "${months[dateTime.month - 1]}  ${dateTime.day} • ";
    }
    return DateTime.now().weekday - dateTime.weekday >= 1
        ? "${weekdays[dateTime.weekday]} • "
        : "";
  }

  static String displayNumber(int num) {
    return num > 1000000000000
        ? "${(num / 1000000000000).toStringAsFixed(1)}T"
        : num > 1000000000
            ? "${(num / 1000000000).toStringAsFixed(1)}B"
            : num > 1000000
                ? "${(num / 1000000).toStringAsFixed(1)}M"
                : num > 1000
                    ? "${(num / 1000).toStringAsFixed(1)}K"
                    : num.toString();
  }

  String get getTime {
    return "${dateTime.hour == 0 || dateTime.hour == 12 ? '12' : dateTime.hour % 12}:${dateTime.minute > 10 ? dateTime.minute : '0${dateTime.minute}'} ${dateTime.hour >= 12 ? 'PM' : 'AM'}";
  }
}

class InnerPostData {
  String textContent;
  List<MediaData> mediaData;
  InnerPostData({this.mediaData = const [], this.textContent = ""});
}

class Vote {
  int totalNum;
  double witnessPercent;
  Vote({this.totalNum = 0, this.witnessPercent = 0});
}

class PostLabel {
  Color color;
  String content;
  PostLabel({
    required this.color,
    required this.content,
  });
}

class MediaData {
  final String type;
  final String contentUrl;
  final String thumbnailUrl;

  MediaData(
      {this.type = "image",
      this.contentUrl = "",
      this.thumbnailUrl =
          "https://upload.wikimedia.org/wikipedia/commons/thumb/5/50/Black_colour.jpg/1536px-Black_colour.jpg"});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'contentUrl': contentUrl,
      'thumbnailUrl': thumbnailUrl
    };
  }

  factory MediaData.fromMap(Map<String, dynamic> map) {
    return MediaData(
        type: map['type'] as String,
        contentUrl: map['contentUrl'] as String,
        thumbnailUrl: map['thumbnailUrl'] as String);
  }

  String toJson() => json.encode(toMap());

  factory MediaData.fromJson(String source) =>
      MediaData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ProfileImageModel {
  Color background; // not used currently
  String skinColor;
  String tShirt;
  String hair;
  bool glasses;
  String faceFeatures;
  List<String> accessories;

  ProfileImageModel({
    this.background = Colors.amberAccent,
    this.skinColor = "assets/quadm_avatar_components/skin_light.png",
    this.tShirt = "assets/quadm_avatar_components/t_shirt_gray_2.png",
    this.hair = "assets/quadm_avatar_components/hair_female_1.png",
    this.glasses = false,
    this.faceFeatures = "assets/quadm_avatar_components/face_feature_1.png",
    this.accessories = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'background': background,
      'skinColor': skinColor,
      'tShirt': tShirt,
      'hair': hair,
      'glasses': glasses,
      'faceFeatures': faceFeatures,
      'accessories': accessories,
    };
  }

  factory ProfileImageModel.fromMap(Map<String, dynamic> map) {
    return ProfileImageModel(
      background: map['background'] as Color,
      skinColor: map['skinColor'] as String,
      tShirt: map['tShirt'] as String,
      hair: map['hair'] as String,
      glasses: map['glasses'] as bool,
      faceFeatures: map['faceFeatures'] as String,
      accessories: List<String>.from(map['accessories'] as List<dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProfileImageModel.fromJson(String source) =>
      ProfileImageModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ProfileImageModel(background: $background, skinColor: $skinColor, tShirt: $tShirt, hair: $hair, glasses: $glasses, faceFeatures: $faceFeatures, accessories: $accessories)';
  }

  @override
  bool operator ==(covariant ProfileImageModel other) {
    if (identical(this, other)) return true;

    return other.background == background &&
        other.skinColor == skinColor &&
        other.tShirt == tShirt &&
        other.hair == hair &&
        other.glasses == glasses &&
        other.faceFeatures == faceFeatures &&
        listEquals(other.accessories, accessories);
  }

  @override
  int get hashCode {
    return background.hashCode ^
        skinColor.hashCode ^
        tShirt.hashCode ^
        hair.hashCode ^
        glasses.hashCode ^
        faceFeatures.hashCode ^
        accessories.hashCode;
  }

  ProfileImageModel copyWith({
    Color background = Colors.amberAccent,
    String skinColor = "assets/quadm_avatar_components/skin_light.png",
    String tShirt = "assets/quadm_avatar_components/t_shirt_gray_2.png",
    String hair = "assets/quadm_avatar_components/hair_female_1.png",
    String faceFeatures = "assets/quadm_avatar_components/face_feature_1.png",
    bool glasses = false,
    List<String> accessories = const [],
  }) {
    return ProfileImageModel(
      background: background,
      skinColor: skinColor,
      tShirt: tShirt,
      hair: hair,
      glasses: glasses,
      faceFeatures: faceFeatures,
      accessories: accessories,
    );
  }
}
