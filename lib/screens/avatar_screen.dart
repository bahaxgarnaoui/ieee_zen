import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Avatar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.grey[200],
                border: Border.all(
                  color: Colors.green,
                  width: 3,
                ),
              ),
              child: Icon(
                Icons.face,
                size: 100,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Your Personalized Avatar',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Add more avatar customization options here
          ],
        ),
      ),
    );
  }
}
