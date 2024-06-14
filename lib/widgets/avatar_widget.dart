import 'dart:convert';

import 'package:flutter/material.dart';

class AvatarWidget extends StatelessWidget {
  const AvatarWidget({
    super.key,
    this.innerRadius = 30.0,
    this.outherRadius = 32,
    required this.dataImage,
  });

  final double innerRadius;
  final double outherRadius;
  final String dataImage;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: const Color(0xFF0DAB72),
      radius: outherRadius,
      child: CircleAvatar(
        radius: innerRadius,
        backgroundImage: MemoryImage(
          base64Decode(dataImage),
        ),
      ),
    );
  }
}
