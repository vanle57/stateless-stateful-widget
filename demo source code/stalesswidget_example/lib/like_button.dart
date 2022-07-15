import 'package:flutter/material.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          print('Liked');
        },
        iconSize: 50,
        icon: const Icon(Icons.thumb_up_off_alt));
  }
}
