import 'package:jurusan_polnep/prodi.dart';

class Jurusan {
  int? id;
  String? name;
  List<Prodi>? prodi;

  Jurusan({this.id, this.name, this.prodi});

  Jurusan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['prodi'] != null) {
      prodi = <Prodi>[];
      json['prodi'].forEach((v) {
        prodi!.add(Prodi.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (prodi != null) {
      data['prodi'] = prodi!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
