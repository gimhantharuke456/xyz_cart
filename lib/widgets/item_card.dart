import 'package:flutter/material.dart';
import 'package:xyz_cart/utils/constants.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: itemImageUrl,
                placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator()), // Placeholder widget
                errorWidget: (context, url, error) =>
                    const Icon(Icons.error), // Error widget
              ),
              const Positioned(
                top: 0,
                left: 0,
                child: Chip(
                  backgroundColor: primaryColor,
                  label: Text(
                    "40% off",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const Text(
          "Angurukku Fresh",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const Text("Indonosean grapes"),
        const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 14,
            ),
            children: [
              TextSpan(
                text: "\$24",
              ),
              TextSpan(
                  text: "  \$22",
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
