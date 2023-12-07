import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

class LikeButtonWidget extends StatefulWidget {
  static const routeName = '/LikeButtonPage';

  @override
  _LikeButtonWidgetState createState() => _LikeButtonWidgetState();
}

class _LikeButtonWidgetState extends State<LikeButtonWidget> {
  final int likeCount = 999;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Material(
        child: Column(
          children: <Widget>[
            Expanded(
              child: LayoutBuilder(
                builder: (c, data) {
                  final crossAxisCount = data.maxWidth ~/ 160.0 + 1;
                  return GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: crossAxisCount),
                    children: <Widget>[
                      LikeButton(
                        size: 20,
                        likeCount: likeCount,
                        countBuilder: (int? count, bool isLiked, String text) {
                          var color = isLiked ? Colors.pinkAccent : Colors.grey;
                          Widget result;
                          if (count == 0) {
                            result = Text(
                              "love",
                              style: TextStyle(color: color),
                            );
                          } else
                            result = Text(
                              count! >= 1000
                                  ? (count / 1000.0).toStringAsFixed(1) + "k"
                                  : text,
                              style: TextStyle(color: color),
                            );
                          return result;
                        },
                        likeCountAnimationType: likeCount < 1000
                            ? LikeCountAnimationType.part
                            : LikeCountAnimationType.none,
                        likeCountPadding: EdgeInsets.only(left: 15.0),
                        onTap: onLikeButtonTapped,
                      ),
                      LikeButton(
                        likeCountPadding: EdgeInsets.only(bottom: 15.0),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }
}
