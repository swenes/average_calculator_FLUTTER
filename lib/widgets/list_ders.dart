import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:flutter/material.dart';

import '../model/ders.dart';

class DersListesi extends StatelessWidget {
  const DersListesi({super.key, required this.onDismiss});
  final Function onDismiss;
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.isNotEmpty
        ? ListView.builder(
            itemCount: DataHelper.tumEklenenDersler.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (direction) {
                  onDismiss(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                        title: Text(tumDersler[index].isim),
                        leading: CircleAvatar(
                          backgroundColor: tumDersler[index].harfDeger > 0
                              ? Colors.greenAccent.shade700
                              : Colors.red,
                          child: tumDersler[index].harfDeger > 0
                              ? Text(
                                  (tumDersler[index].isim.substring(0, 1)),
                                  style: Constants.titleStyle
                                      .copyWith(color: Colors.white),
                                )
                              : Text(
                                  ("FF"),
                                  style: Constants.titleStyle
                                      .copyWith(color: Colors.white),
                                ),
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Kredi: ${tumDersler[index].krediDeger}"),
                            const Text("<--->"),
                            Text("Harf Notu: ${tumDersler[index].harfDeger} "),
                          ],
                        )),
                  ),
                ),
              );
            },
          )
        : Center(
            child: Text(
            'Lütfen Ders Ekleyiniz',
            style: Constants.titleStyle.copyWith(fontSize: 24),
          ));
  }
}
