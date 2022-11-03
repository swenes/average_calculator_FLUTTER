class Ders {
  final String isim;
  final double harfDeger;
  final double krediDeger;

  Ders({required this.isim, required this.harfDeger, required this.krediDeger});

  @override
  String toString() {
    return "$isim $harfDeger $krediDeger";
  }
}
