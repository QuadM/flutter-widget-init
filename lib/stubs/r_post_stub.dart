// ignore: implementation_imports
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_post.dart';

class PostStub extends StatelessWidget {
  final String textContent;
  final String username;
  final DateTime dateTime;
  final String hashId;
  final String profileImageUrl;
  final List<String> images;
  PostStub(
      {super.key,
      this.images = const [],
      required this.dateTime,
      this.textContent = "",
      this.profileImageUrl = "",
      this.username = "user",
      this.hashId = "#12345"});

  @override
  Widget build(BuildContext context) {
    return PostWidget(
      postData: PostData(
          profileImageModel: ProfileImageModel(),
          username: username,
          hashId: hashId,
          dateTime: dateTime,
          upVotes: Vote(totalNum: 34556678786, witnessPercent: 65),
          downVotes: Vote(totalNum: 3456, witnessPercent: 100),
          comments: 34567568,
          shares: 5567,
          views: 100,
          innerPostList: [
            InnerPostData(
                mediaData: images.map((e) => MediaData(contentUrl: e)).toList(),
                textContent: textContent)
          ]),
    );
  }
}
