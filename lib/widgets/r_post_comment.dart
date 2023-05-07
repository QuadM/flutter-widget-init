import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:init_widgets/helpers/helperMethods.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_inner_post.dart';
import 'package:init_widgets/widgets/r_profile_image.dart';

class PostComment extends StatelessWidget {
  final CommentContent commentData;
  const PostComment({super.key, required this.commentData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.01,
          right: MediaQuery.of(context).size.width * 0.01,
          top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: commentData.isWitness ? Colors.blue.shade50 : Colors.white,

        // ignore: prefer_const_literals_to_create_immutables
        boxShadow: [
          const BoxShadow(
              color: Color(0x0a000000), offset: Offset.zero, blurRadius: 5),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ProfileImage(img: ProfileImageModel(), size: 30),
              const SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    commentData.username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    commentData.hashId,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              const Text("•"),
              const SizedBox(width: 10),
              Text(commentData.getDate + commentData.getTime),
              if (commentData.isWitness) ...const [
                Spacer(
                  flex: 2,
                ),
                Icon(
                  Icons.remove_red_eye,
                  color: Colors.blue,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "Witness",
                  style: TextStyle(color: Colors.blue),
                ),
                Spacer()
              ]
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InnerPost(
                postText: commentData.innerPostData.textContent,
                images: commentData.innerPostData.mediaData,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked upvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_upward),
                      Text(displayNumber(commentData.upVotes.totalNum)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked downvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_downward),
                      Text(displayNumber(commentData.downVotes.totalNum)),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.15,
                child: InkWell(
                  onTap: (() => print("views")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bar_chart_rounded),
                      const SizedBox(width: 4.0),
                      Text(displayNumber(commentData.views)),
                    ],
                  ),
                ),
              ),
              const Spacer()
            ],
          ),
          Container(
            color: Colors.blue.shade50,
            child: Row(
              children: [
                const Spacer(),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Text(
                    "${commentData.upVotes.witnessPercent}%",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: Text(
                    "${commentData.downVotes.witnessPercent}%",
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.15,
                  child: const Icon(
                    Icons.remove_red_eye,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          Center(
              child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 1,
            color: Colors.black45,
          ))
        ],
      ),
    );
  }
}
