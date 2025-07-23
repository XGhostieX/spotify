import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Cover extends StatelessWidget {
  final String cover;
  const Cover({super.key, required this.cover});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: CachedNetworkImage(
        height: MediaQuery.of(context).size.height / 2.2,
        width: double.infinity,
        fit: BoxFit.cover,
        imageUrl: cover,
        errorWidget: (context, url, error) =>
            const Center(child: Icon(Icons.error_rounded)),
      ),
    );
  }
}
