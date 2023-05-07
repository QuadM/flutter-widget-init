import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:init_widgets/helpers/helperMethods.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/util/util.dart';
import 'package:init_widgets/widgets/r_inner_post.dart';
import 'package:init_widgets/widgets/r_post_comment.dart';
import 'package:init_widgets/widgets/r_profile_image.dart';
import 'package:init_widgets/widgets/r_single_photo_view.dart';

class MultiImageThreadScreen extends StatefulWidget {
  ThreadData threadData;

  MultiImageThreadScreen({super.key, required this.threadData});

  @override
  State<MultiImageThreadScreen> createState() => _MultiImageThreadScreenState();
}

class _MultiImageThreadScreenState extends State<MultiImageThreadScreen> {
  TextEditingController commentController = TextEditingController(text: "");
  bool isCommentTyping = false;
  @override
  Widget build(BuildContext context) {
    final mWidth = MediaQuery.of(context).size.width;
    final mHieght = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SinglePhotoViewer(
          images: widget.threadData.innerPostList[0].mediaData,
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Row(
                      children: [
                        ProfileImage(img: ProfileImageModel(), size: 30),
                        const SizedBox(width: 8.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.threadData.username,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text(
                              widget.threadData.hashId,
                              style: const TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        const SizedBox(width: 10),
                        const Text("•"),
                        const SizedBox(width: 10),
                        Text(widget.threadData.getDate +
                            widget.threadData.getTime),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(width: 2.0, color: Colors.blue),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(9999),
                            ),
                          ),
                          child: const Text(
                            "view updates",
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InnerPost(
                        postText:
                            widget.threadData.innerPostList[0].textContent,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: mWidth * 0.2,
                        child: InkWell(
                          hoverColor: Colors.black26,
                          onTap: () {
                            print("clicked upvote");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_upward),
                              Text(displayNumber(
                                  widget.threadData.upVotes.totalNum)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mWidth * 0.2,
                        child: InkWell(
                          hoverColor: Colors.black26,
                          onTap: () {
                            print("clicked downvote");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.arrow_downward),
                              Text(displayNumber(
                                  widget.threadData.downVotes.totalNum)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mWidth * 0.2,
                        child: InkWell(
                          onTap: (() => print("comment")),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.mode_comment_outlined),
                              const SizedBox(width: 4.0),
                              Text(displayNumber(
                                  widget.threadData.comments.totalNum)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mWidth * 0.2,
                        child: InkWell(
                          onTap: (() => print("share")),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.shortcut_outlined),
                              const SizedBox(width: 4.0),
                              Text(displayNumber(widget.threadData.shares)),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: mWidth * 0.2,
                        child: InkWell(
                          onTap: (() => print("views")),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.bar_chart_rounded),
                              const SizedBox(width: 4.0),
                              Text(displayNumber(widget.threadData.views)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.blue.shade50,
                    child: Row(
                      children: [
                        SizedBox(
                          width: mWidth * 0.2,
                          child: Text(
                            "${widget.threadData.upVotes.witnessPercent}%",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: mWidth * 0.2,
                          child: Text(
                            "${widget.threadData.downVotes.witnessPercent}%",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: mWidth * 0.2,
                          child: Text(
                            "${widget.threadData.comments.witnessPercent}%",
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: mWidth * 0.2,
                        ),
                        SizedBox(
                          width: mWidth * 0.2,
                          child: const Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: mWidth,
                    height: mHieght * 0.08,
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            controller: commentController,
                            maxLines: 10,
                            scrollController:
                                ScrollController(initialScrollOffset: 1),
                            keyboardType: TextInputType.multiline,
                            decoration: kTextFieldDecoration.copyWith(
                                contentPadding: const EdgeInsets.only(
                                    top: 8, left: 50, right: 50),
                                hintText: "Comment",
                                hintStyle: TextStyle(color: Colors.black45)),
                          ),
                        ),
                        Positioned(
                          left: 13,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.camera_alt_outlined),
                            onPressed: () {
                              print("camera is pressed");
                            },
                          ),
                        ),
                        Positioned(
                          right: 13,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.subdirectory_arrow_right),
                            onPressed: () {
                              print(json.encode(
                                  {"value": commentController.value.text}));
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  ...widget.threadData.comments.commentContentList.map<Widget>(
                      (comment) => PostComment(commentData: comment))
                ],
              ),
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
            ),
          ),
        ),
      ],
    );
  }
}
