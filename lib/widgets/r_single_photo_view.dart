import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:photo_view/photo_view.dart';

class SinglePhotoViewer extends StatefulWidget {
  const SinglePhotoViewer({super.key});

  @override
  State<SinglePhotoViewer> createState() => SinglePhotoViewerState();
}

class SinglePhotoViewerState extends State<SinglePhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: PhotoView(
        initialScale: PhotoViewComputedScale.contained,
        minScale: PhotoViewComputedScale.contained,
        maxScale: PhotoViewComputedScale.contained * 4,
        imageProvider: NetworkImage(
            "https://media.istockphoto.com/id/1363597434/photo/the-pyramids-of-giza-in-egypt.jpg?b=1&s=170667a&w=0&k=20&c=-tBWkAKhOvoEVP0nKcOQvouc_glWBuj8lf8qPT_1_tE="),
      ),
    );
  }
}
