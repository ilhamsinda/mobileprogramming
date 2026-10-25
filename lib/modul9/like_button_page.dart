import 'package:flutter/material.dart';

class LikeButtonPage extends StatefulWidget {
  const LikeButtonPage({super.key});

  @override
  State<LikeButtonPage> createState() => _LikeButtonPageState();
}

class _LikeButtonPageState extends State<LikeButtonPage> {
  bool _isLiked = false;
  int _likeCount = 10;

  void _toggleLike() {
    setState(() {
      if (_isLiked) {
        _likeCount--;
        _isLiked = false;
      } else {
        _likeCount++;
        _isLiked = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Like Button'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _toggleLike,
              icon: Icon(
                _isLiked ? Icons.favorite : Icons.favorite_border,
                color: _isLiked ? Colors.red : Colors.grey,
                size: 48,
              ),
            ),
            Text('$_likeCount likes'),
          ],
        ),
      ),
    );
  }
}
