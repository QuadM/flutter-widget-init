import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:init_widgets/widgets/r_media_college.dart';

class InnerPost extends StatelessWidget {
  final String postText;
  final List<MediaData> images;
  const InnerPost({super.key, this.postText = "", this.images = const []});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 8,
      child: Container(
        // color: Colors.green,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 8.0),
            Text(postText),
            const SizedBox(height: 8.0),
            if (images.isNotEmpty) MediaCollage(media: images),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
