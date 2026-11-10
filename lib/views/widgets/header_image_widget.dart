import 'package:flutter/material.dart';

class HeaderImageWidget extends StatelessWidget {
  final String imageAsset;
  final String tagLabel;

  const HeaderImageWidget({
    super.key,
    required this.imageAsset,
    this.tagLabel = 'Sibu Esplanade Landmark',
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Image.asset(
            imageAsset,
            height: 240,
            width: double.infinity,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                height: 240,
                color: Colors.indigo.shade900,
                child: const Center(
                  child: Icon(Icons.directions_boat, size: 80, color: Colors.white70),
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 16,
          left: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.65),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              tagLabel,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}