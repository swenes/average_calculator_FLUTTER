import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class HarfDropDownWidget extends StatefulWidget {
  final Function onHarfSecildi;
  const HarfDropDownWidget({super.key, required this.onHarfSecildi});

  @override
  State<HarfDropDownWidget> createState() => _HarfDropDownWidgetState();
}

class _HarfDropDownWidgetState extends State<HarfDropDownWidget> {
  double secilenHarfDeger = 4;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: Constants.dropDownPadding,
        decoration: BoxDecoration(
          color: Constants.anaRenk.shade100.withOpacity(0.2),
          borderRadius: Constants.borderRadius,
        ),
        child: Column(
          children: [
            Text(
              'Harf Notu',
              style: Constants.normalStyle.copyWith(fontSize: 12),
            ),
            DropdownButton<double>(
              elevation: 16,
              iconEnabledColor: Constants.anaRenk.shade400,
              underline: const SizedBox(),
              value: secilenHarfDeger,
              items: DataHelper.tumDersHarfleri(),
              onChanged: (value) {
                setState(() {
                  secilenHarfDeger = value!;
                  widget.onHarfSecildi(secilenHarfDeger);
                });
              },
            ),
          ],
        ));
  }
}
