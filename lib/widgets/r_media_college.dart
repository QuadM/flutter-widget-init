import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:init_widgets/models/SG_feed_model.dart';

class MediaCollage extends StatelessWidget {
  final List<MediaData> media;
  const MediaCollage({super.key, this.media = const []});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.95,
      child: media.isEmpty
          ? Container()
          : media.length == 1
              ? Container(
                  child: mediaItem(
                      context: context, media[0], bl: 5, br: 5, tl: 5, tr: 5),
                )
              : media.length == 2
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 250,
                          child: mediaItem(
                            context: context,
                            media[0],
                            bl: 5,
                            tl: 5,
                          ),
                        ),
                        Container(
                            height: 250,
                            child: mediaItem(
                                context: context, media[1], br: 5, tr: 5)),
                      ],
                    )
                  : media.length == 3
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                mediaItem(context: context, media[0], tl: 5),
                                mediaItem(context: context, media[1], bl: 5),
                              ],
                            ),
                            Container(
                                height: 250,
                                child: mediaItem(
                                    context: context, media[2], br: 5, tr: 5))
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                mediaItem(
                                  context: context,
                                  media[0],
                                  tl: 5,
                                ),
                                mediaItem(
                                  context: context,
                                  media[1],
                                  bl: 5,
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                mediaItem(context: context, media[2], tr: 5),
                                media.length == 4
                                    ? mediaItem(
                                        context: context, media[3], br: 5)
                                    : Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          mediaItem(
                                            context: context,
                                            media[3],
                                            br: 5,
                                          ),
                                          Positioned.fill(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(1.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  bottomRight:
                                                      Radius.circular(5),
                                                ),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                          color:
                                                              Colors.black54),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Center(
                                            child: Text(
                                              "+${media.length - 4}",
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 24,
                                                shadows: [
                                                  Shadow(
                                                      color: Colors.white24,
                                                      offset: Offset.zero,
                                                      blurRadius: 5),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )
                              ],
                            )
                          ],
                        ),
    );
  }
}

/// tl_tr_br_bl : topLeft - topRight - bottomRight -bottomLeft  : 1 0 0 1 => topLeft && bottomLeft are curved
Widget mediaItem(
  MediaData mediaData, {
  required BuildContext context,
  double tl = 0,
  double tr = 0,
  double br = 0,
  double bl = 0,
}) {
  return Container(
    width: MediaQuery.of(context).size.width *
        ((tl + tr + bl + br == 4) ? 1 : 0.45),
    child: ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: tl != 0 ? Radius.circular(tl) : const Radius.circular(0),
        topRight: tr != 0 ? Radius.circular(tr) : const Radius.circular(0),
        bottomLeft: bl != 0 ? Radius.circular(bl) : const Radius.circular(0),
        bottomRight: br != 0 ? Radius.circular(br) : const Radius.circular(0),
      ),
      child: mediaData.type == "image"
          ? Image.network(
              mediaData.contentUrl,
              fit: BoxFit.cover,
            )
          : Stack(
              children: <Widget>[
                Positioned(
                  child: Image.network(
                    mediaData.thumbnailUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.center,
                    child: Icon(mediaData.type == "video"
                        ? Icons.play_circle
                        : Icons.mic),
                  ),
                ),
              ],
            ),
    ),
  );
}
