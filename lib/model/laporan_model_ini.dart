import 'dart:convert';

class LaporanModel {
  String? name, deskripsi, namaTempat, alamat;

  LaporanModel(
      {this.name,
      required this.deskripsi,
      required this.namaTempat,
      required this.alamat});

  Map<String, dynamic> toJson() => {
        'name': name,
        'deskripsi': deskripsi,
        'namaTempat': namaTempat,
        'alamat': alamat
      };
}
