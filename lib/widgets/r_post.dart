import 'package:flutter/material.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_inner_post.dart';
import 'package:init_widgets/widgets/r_profile_image.dart';

class PostWidget extends StatelessWidget {
  final PostData postData;

  const PostWidget({super.key, required this.postData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.01),
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
                Text(postData.getDate + postData.getTime),
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
                // Container(
                //   color: Colors.greenAccent,
                //   height: 300,
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     children: [
                //       const Spacer(),
                //       InkWell(
                //         hoverColor: Colors.black26,
                //         onTap: () {
                //           print("clicked upvote");
                //         },
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.1,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               const Icon(Icons.arrow_upward),
                //               Text(PostData.displayNumber(
                //                   postData.upVotes.totalNum)),
                //               Text("${postData.upVotes.witnessPercent}%")
                //             ],
                //           ),
                //         ),
                //       ),
                //       const Spacer(),
                //       Container(
                //         height: 1,
                //         width: MediaQuery.of(context).size.width * 0.08,
                //         color: Colors.red,
                //       ),
                //       const Spacer(),
                //       InkWell(
                //         hoverColor: Colors.black26,
                //         onTap: () {
                //           print("clicked downvote");
                //         },
                //         child: SizedBox(
                //           width: MediaQuery.of(context).size.width * 0.1,
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //               const Icon(Icons.arrow_downward),
                //               Text(PostData.displayNumber(
                //                   postData.downVotes.totalNum)),
                //               Text("${postData.downVotes.witnessPercent}%")
                //             ],
                //           ),
                //         ),
                //       ),
                //       const Spacer(),
                //     ],
                //   ),
                // )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Spacer(),
                InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked upvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_upward),
                      Text(PostData.displayNumber(postData.upVotes.totalNum)),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  hoverColor: Colors.black26,
                  onTap: () {
                    print("clicked downvote");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_downward),
                      Text(PostData.displayNumber(postData.downVotes.totalNum)),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (() => print("comment")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.mode_comment_outlined),
                      const SizedBox(width: 4.0),
                      Text(PostData.displayNumber(postData.comments)),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (() => print("share")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.shortcut_outlined),
                      const SizedBox(width: 4.0),
                      Text(PostData.displayNumber(postData.shares)),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: (() => print("views")),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.bar_chart_rounded),
                      const SizedBox(width: 4.0),
                      Text(PostData.displayNumber(postData.views)),
                    ],
                  ),
                ),
                Spacer(),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined),
                    Text("10.0%"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.transparent,
                    ),
                    Text("10.0%"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      color: Colors.transparent,
                    ),
                    Text("10.0%"),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
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
                Spacer(),
                Row(
                  children: [
                    Icon(Icons.remove_red_eye_outlined,
                        color: Colors.transparent),
                    Icon(Icons.remove_red_eye_outlined,
                        color: Colors.transparent),
                    Icon(Icons.remove_red_eye_outlined,
                        color: Colors.transparent),
                  ],
                ),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
