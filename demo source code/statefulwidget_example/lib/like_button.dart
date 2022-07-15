import 'package:flutter/material.dart';

class LikeButton extends StatefulWidget {
  // 1
  final Function(bool) didTapButton;
  // 2
  const LikeButton(this.didTapButton, {Key? key}) : super(key: key);

  @override
  State<LikeButton> createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            isLiked = !isLiked;
            // 3
            widget.didTapButton(isLiked);
          });
        },
        iconSize: 50,
        icon: Icon(isLiked ? Icons.thumb_up_alt : Icons.thumb_up_off_alt));
  }
}
