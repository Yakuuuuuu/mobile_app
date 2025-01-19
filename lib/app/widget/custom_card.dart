import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String time;
  final String content;
  final String hashtag;
  final String imagePath;
  final int likes;
  final int comments;
  final int shares;

  const PostCard({
    super.key,
    required this.username,
    required this.time,
    required this.content,
    required this.hashtag,
    required this.imagePath,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  @override
  Widget build(BuildContext context) {
    // Screen dimensions
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Card(
      margin: EdgeInsets.all(screenWidth * 0.04), // Dynamic margin
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04), // Dynamic padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: const AssetImage('assets/images/avatar.png'),
                  radius: screenWidth * 0.07, // Dynamic avatar size
                ),
                SizedBox(width: screenWidth * 0.03), // Dynamic spacing
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045, // Dynamic font size
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: screenWidth * 0.035, // Dynamic font size
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02), // Dynamic spacing
            Text(
              content,
              style: TextStyle(
                fontSize: screenWidth * 0.04, // Dynamic font size
              ),
            ),
            SizedBox(height: screenHeight * 0.01), // Dynamic spacing
            Text(
              hashtag,
              style: TextStyle(
                color: Colors.blue,
                fontSize: screenWidth * 0.04, // Dynamic font size
              ),
            ),
            SizedBox(height: screenHeight * 0.02), // Dynamic spacing
            Image.asset(
              imagePath,
              width: double.infinity,
              height: screenHeight * 0.3, // 30% of screen height
              fit: BoxFit.cover,
            ),
            SizedBox(height: screenHeight * 0.02), // Dynamic spacing
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconWithText(
                  icon: Icons.thumb_up,
                  text: likes.toString(),
                  iconSize: screenWidth * 0.05, // Dynamic icon size
                  fontSize: screenWidth * 0.035, // Dynamic font size
                ),
                IconWithText(
                  icon: Icons.comment,
                  text: comments.toString(),
                  iconSize: screenWidth * 0.05,
                  fontSize: screenWidth * 0.035,
                ),
                IconWithText(
                  icon: Icons.share,
                  text: shares.toString(),
                  iconSize: screenWidth * 0.05,
                  fontSize: screenWidth * 0.035,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String text;
  final double iconSize;
  final double fontSize;

  const IconWithText({
    super.key,
    required this.icon,
    required this.text,
    required this.iconSize,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: iconSize,
          color: Colors.grey,
        ),
        SizedBox(width: iconSize * 0.3), // Proportional spacing
        Text(
          text,
          style: TextStyle(
            color: Colors.grey,
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
