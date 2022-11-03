import 'package:average_calculator/constants/app_constants.dart';
import 'package:average_calculator/helper/data_helper.dart';
import 'package:average_calculator/model/ders.dart';
import 'package:average_calculator/widgets/harf_dropdown_widget.dart';
import 'package:average_calculator/widgets/kredi_dropdown_widget.dart';
import 'package:average_calculator/widgets/list_ders.dart';
import 'package:average_calculator/widgets/show_average.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double secilenHarfDegeri = 4;
  double secilenKrediDegeri = 1;
  String girilenDersAdi = '';

  @override
  Widget build(BuildContext context) {
    debugPrint('scafolld print');
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Constants.title,
            style: Constants.titleStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: ShowAverage(
                    ortalama: DataHelper.ortalamaHesaplayici(),
                    dersSayisi: DataHelper.tumEklenenDersler.length),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onDismiss: (index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
              padding: Constants.yatayPadding8, child: _buildTextFormField()),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: Constants.yatayPadding8,
                  child: HarfDropDownWidget(
                    onHarfSecildi: (harf) {
                      secilenHarfDegeri = harf;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                    padding: Constants.yatayPadding8,
                    child: KrediDropdownWidget(
                      onKrediSecildi: (kredi) {
                        secilenKrediDegeri = kredi;
                      },
                    )),
              ),
              IconButton(
                onPressed: () {
                  dersEkleveOrtalamaHesapla();
                },
                icon: const Icon(Icons.arrow_forward_ios_outlined),
                color: Constants.anaRenk,
                iconSize: 30,
              ),
            ],
          ),
          const SizedBox(height: 8), // divider koy buraya daha tatlı olur.
        ],
      ),
    );
  }

  _buildTextFormField() {
    return TextFormField(
      onFieldSubmitted: (value) {
        dersEkleveOrtalamaHesapla();
      },
      onSaved: (value) {
        setState(() {
          girilenDersAdi = value!;
        });
      },
      validator: (s) {
        if (s!.isEmpty) {
          return 'Ders Adını Giriniz';
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
          suffixIcon: const Icon(Icons.menu_book_sharp),
          label: const Center(child: Text('Ders Seçimi')),
          border: OutlineInputBorder(
              borderRadius: Constants.borderRadius,
              borderSide: BorderSide.none),
          filled: true,
          fillColor: Constants.anaRenk.shade100.withOpacity(0.2)),
    );
  }

  void dersEkleveOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
          isim: girilenDersAdi.toString(),
          harfDeger: secilenHarfDegeri,
          krediDeger: secilenKrediDegeri);

      setState(() {
        DataHelper.dersEkle(eklenecekDers);
      });
    }
  }
}
