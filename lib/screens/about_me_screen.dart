import 'package:flutter/material.dart';

class AboutMeScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Me")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(radius: 50),
            Text("Nama Lengkap"),
            Text("Nama Panggilan"),
            Text("Hobi: Coding & Food Hunting"),
            Text("@username"),
          ],
        ),
      ),
    );
  }
}