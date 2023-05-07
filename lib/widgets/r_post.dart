import 'package:flutter/material.dart';
import 'package:init_widgets/helpers/helperMethods.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_inner_post.dart';
import 'package:init_widgets/widgets/r_profile_image.dart';

class PostWidget extends StatelessWidget {
  final PostData postData;

  const PostWidget({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Container(
        padding: EdgeInsets.only(
            top: 10,
            right: MediaQuery.of(context).size.width * 0.01,
            left: MediaQuery.of(context).size.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,

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
                      postData.username,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    Text(
                      postData.hashId,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                const Text("•"),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (postData.getDate != "") Text(postData.getDate),
                    Text(postData.getTime),
                  ],
                ),
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
                        color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                ),
                const SizedBox(
                  width: 10,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InnerPost(
                  postText: postData.innerPostList[0].textContent,
                  images: postData.innerPostList[0].mediaData,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked upvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_upward),
                      Text(displayNumber(postData.upVotes.totalNum)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked downvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_downward),
                      Text(displayNumber(postData.downVotes.totalNum)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (() => print("comment")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.mode_comment_outlined),
                      const SizedBox(width: 4.0),
                      Text(displayNumber(postData.comments)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (() => print("share")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shortcut_outlined),
                      const SizedBox(width: 4.0),
                      Text(displayNumber(postData.shares)),
                    ],
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: (() => print("views")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bar_chart_rounded),
                      const SizedBox(width: 4.0),
                      Text(displayNumber(postData.views)),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
            Container(
              color: Colors.blue.shade50,
              child: Row(
                children: [
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.transparent,
                      ),
                      Text("10.0%"),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.transparent,
                      ),
                      Text("10.0%"),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.transparent,
                      ),
                      Text("10.0%"),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.transparent,
                      ),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    children: const [
                      Icon(Icons.remove_red_eye_outlined,
                          color: Colors.transparent),
                      Icon(Icons.remove_red_eye_outlined, color: Colors.white),
                      Icon(Icons.remove_red_eye_outlined,
                          color: Colors.transparent),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
