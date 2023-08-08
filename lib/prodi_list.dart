import 'package:flutter/material.dart';
import 'package:jurusan_polnep/http_helper.dart';
import 'package:shimmer/shimmer.dart';

import 'jurusan.dart';

// ignore: must_be_immutable
class ProdiList extends StatelessWidget {
  Jurusan jurusan;
  ProdiList({super.key, required this.jurusan});

  bool isLoading = true;

  late HttpHelper helper;

  // late List jurusan;
  // late List prodi;
  // late int prodiCount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(jurusan.name ?? ''),
      ),
      body: ListView.builder(
        itemCount: jurusan.prodi!.length,
        itemBuilder: (BuildContext context, int id) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              title: Text(jurusan.prodi![id].name!),
            ),
          );
        },
      ),
    );
  }
}

Widget shimmerWidget() {
  return ListTile(
    title: Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 230,
          height: 16,
          color: Colors.white,
        ),
      ),
    ),
  );
}
