import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class PermintaanSaksiPage extends StatelessWidget {
  const PermintaanSaksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Permintaan Saksi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
            Text(
              'Kelola permintaan menjadi saksi dari siswa lain',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "Wednesday, 26 November 2025",
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 117, 202),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey.shade300),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "PENGIRIM",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "TANGGAL",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "KONFIRMASI",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: const BoxDecoration(color: Colors.white),
                    child: Center(
                      child: Column(
                        children: const [
                          Icon(Icons.group, size: 40, color: Colors.grey),
                          SizedBox(height: 8),
                          Text(
                            'Belum Ada Permintaan',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Belum ada yang mengirimi perintaan saksi kepada Anda',
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
