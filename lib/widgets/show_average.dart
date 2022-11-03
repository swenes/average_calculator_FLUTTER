import 'package:average_calculator/constants/app_constants.dart';
import 'package:flutter/material.dart';

class ShowAverage extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const ShowAverage(
      {super.key, required this.ortalama, required this.dersSayisi});

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(dersSayisi > 0 ? '$dersSayisi Ders Girildi' : 'Ders Seçiniz',
            style: Constants.normalStyle),
        Text(ortalama >= 0 ? ortalama.toStringAsFixed(2) : '0.0',
            style: Constants.ortalamaStyle),
        Text('Ortalama', style: Constants.normalStyle),
      ],
    );
  }
}
