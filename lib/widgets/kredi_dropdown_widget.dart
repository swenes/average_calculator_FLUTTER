import 'package:flutter/material.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({super.key, required this.onKrediSecildi});

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
  double secilenKrediDeger = 1;

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
            'Kredi',
            style: Constants.normalStyle.copyWith(fontSize: 12),
          ),
          DropdownButton<double>(
            elevation: 16,
            iconEnabledColor: Constants.anaRenk.shade400,
            underline: Container(),
            value: secilenKrediDeger,
            items: DataHelper.tumKrediler(),
            onChanged: (value) {
              setState(() {
                secilenKrediDeger = value!;
                widget.onKrediSecildi(value);
              });
            },
          )
        ],
      ),
    );
  }
}
