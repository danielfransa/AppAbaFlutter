import 'dart:convert';

import 'package:aba_app/core/constants.dart';
import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipOval(
                child: Image.memory(
                  base64Decode(kBase64Image),
                  height: 200,
                  width: 200,
                  fit: BoxFit.cover,
                ),
              )
            ],
          ),
        ),
        const Text(
          'name',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(8.0, 2.0, 8.0, 10.0),
          child: Text(
            'email',
            style: TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
