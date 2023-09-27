import 'package:flutter/material.dart';
import 'package:flutter_bloc_http_get/model/user_model.dart';

class DetailScreen extends StatelessWidget {
  final Data userData;
  const DetailScreen({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              maxRadius: 60,
              backgroundImage: NetworkImage(userData.avatar!),
            ),
            SizedBox(height: 10),
            Text(userData.firstName!+' '+userData.lastName!),
            SizedBox(height: 10),
            Text(userData.email!)
          ],
        ),
      ),
    );
  }
}
