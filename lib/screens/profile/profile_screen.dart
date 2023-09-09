import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://i.pravatar.cc/300",
          placeholder: (context, url) => const Center(
              child: CircularProgressIndicator()), // Placeholder widget
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
