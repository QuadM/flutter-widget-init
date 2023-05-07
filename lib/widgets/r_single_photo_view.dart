// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:init_widgets/models/SG_feed_model.dart';
import 'package:photo_view/photo_view.dart';

class SinglePhotoViewer extends StatefulWidget {
  final List<MediaData> images;
  const SinglePhotoViewer({
    Key? key,
    required this.images,
  }) : super(key: key);

  @override
  State<SinglePhotoViewer> createState() => SinglePhotoViewerState();
}

class SinglePhotoViewerState extends State<SinglePhotoViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: CarouselSlider.builder(
        options: CarouselOptions(
            viewportFraction: 1,
            scrollPhysics: const BouncingScrollPhysics(),
            height: MediaQuery.of(context).size.height * 0.3,
            enableInfiniteScroll: false),
        itemCount: widget.images.length,
        itemBuilder: (context, index, realIndex) {
          return buildItem(widget.images[index]);
        },
      ),
    );
  }
}

buildItem(MediaData image) => PhotoView(
      // initialScale: PhotoViewComputedScale.contained,
      minScale: PhotoViewComputedScale.contained,
      maxScale: PhotoViewComputedScale.contained * 5,
      imageProvider: NetworkImage(image.contentUrl),
    );
