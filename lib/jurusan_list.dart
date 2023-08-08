import 'package:flutter/material.dart';
import 'package:jurusan_polnep/prodi_list.dart';
import 'package:shimmer/shimmer.dart';

import 'http_helper.dart';

class JurusanList extends StatefulWidget {
  const JurusanList({super.key});

  @override
  State<JurusanList> createState() => _JurusanListState();
}

class _JurusanListState extends State<JurusanList> {
  late HttpHelper helper;
  late List jurusan;
  late int jurusanCount;
  bool isLoading = true;

  Future initialize() async {
    setState(() {
      isLoading = true;
    });
    jurusan = [];
    jurusanCount = 0;

    jurusan = await helper.getJurusan();

    setState(() {
      jurusanCount = jurusan.length;
      jurusan = jurusan;
      isLoading = false;
    });
  }

  @override
  void initState() {
    helper = HttpHelper();
    initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jurusan Polnep'),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return initialize();
        },
        child: ListView.builder(
          itemCount: isLoading ? 10 : jurusanCount,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 2,
              child: isLoading
                  ? shimmerWidget()
                  : ListTile(
                      onTap: () {
                        MaterialPageRoute route = MaterialPageRoute(
                          builder: (_) => ProdiList(
                            jurusan: jurusan[index],
                          ),
                        );
                        Navigator.push(context, route);
                      },
                      title: Text(
                        'Jurusan ${jurusan[index].name}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      subtitle: Text(
                        'Jumlah Prodi : ${jurusan[index].prodi.length}',
                      ),
                    ),
            );
          },
        ),
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
    subtitle: Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Container(
          width: 190,
          height: 8,
          color: Colors.white,
        ),
      ),
    ),
  );
}
