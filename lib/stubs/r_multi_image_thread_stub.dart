// ignore: implementation_imports
import 'package:flutter/cupertino.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_multi_image_thread.dart';
import 'package:init_widgets/widgets/r_post.dart';

class MultiImageThreadStub extends StatelessWidget {
  final String textContent;
  final String username;
  final DateTime dateTime;
  final String hashId;
  final String profileImageUrl;
  final List<String> images;
  MultiImageThreadStub(
      {super.key,
      this.images = const [],
      required this.dateTime,
      this.textContent = "",
      this.profileImageUrl = "",
      this.username = "user",
      this.hashId = "#12345"});

  @override
  Widget build(BuildContext context) {
    return MultiImageThreadScreen(
      threadData: ThreadData(
          profileImageModel: ProfileImageModel(),
          username: username,
          hashId: hashId,
          dateTime: dateTime,
          upVotes: Vote(totalNum: 342556678786, witnessPercent: 65),
          downVotes: Vote(totalNum: 222456, witnessPercent: 100),
          comments: CommentData(commentContentList: [
            CommentContent(
              username: username,
              hashId: hashId,
              profileImageModel: ProfileImageModel(),
              innerPostData: InnerPostData(
                  mediaData:
                      images.map((e) => MediaData(contentUrl: e)).toList(),
                  textContent: textContent),
              dateTime: dateTime,
              upVotes: Vote(totalNum: 34556678786, witnessPercent: 65),
              downVotes: Vote(totalNum: 3456, witnessPercent: 100),
            ),
            CommentContent(
                username: username,
                hashId: hashId,
                profileImageModel: ProfileImageModel(),
                innerPostData: InnerPostData(textContent: textContent),
                dateTime: dateTime,
                upVotes: Vote(totalNum: 34556678786, witnessPercent: 65),
                downVotes: Vote(totalNum: 3456, witnessPercent: 100),
                isWitness: true),
            CommentContent(
              username: username,
              hashId: hashId,
              profileImageModel: ProfileImageModel(),
              innerPostData: InnerPostData(
                  mediaData:
                      images.map((e) => MediaData(contentUrl: e)).toList(),
                  textContent: textContent),
              dateTime: dateTime,
              upVotes: Vote(totalNum: 34556678786, witnessPercent: 65),
              downVotes: Vote(totalNum: 3456, witnessPercent: 100),
            ),
          ], totalNum: 120034, witnessPercent: 13),
          shares: 551167,
          views: 3213213212100,
          innerPostList: [
            InnerPostData(
                mediaData: images.map((e) => MediaData(contentUrl: e)).toList(),
                textContent: textContent)
          ]),
    );
  }
}
