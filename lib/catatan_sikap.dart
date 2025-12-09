import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class CatatanSikap extends StatelessWidget {
  const CatatanSikap({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Catatan Sikap Saya",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),
            const Text(
              "Lihat catatan sikap dan perilaku yang telah dilaporkan",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 30),
            
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF7E6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFFFFE8C2)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Icon(Icons.warning_amber_rounded,
                      color: Color(0xFFE7A52E), size: 28),
                  SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Perhatian\nJika ada catatan yang tidak sesuai, "
                      "silakan hubungi guru jurusan untuk klarifikasi.",
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                _summaryCard("Dalam Perbaikan", "1", Icons.bolt, double.infinity),
                const SizedBox(height: 16),
                _summaryCard("Sudah Berubah", "2", Icons.check_circle_outline, double.infinity),
                const SizedBox(height: 16), 
                _summaryCard("Total Catatan", "3", Icons.description, double.infinity),

              ],
            ),

            const SizedBox(height: 40),
            _catatanCard(
              nomor: 1,
              kategori: "Disiplin",
              catatan: "Sering terlambat masuk kelas.",
              status: "Dalam Perbaikan",
              lapor: "12 Nov 2024",
              update: "15 Nov 2024",
            ),

            _catatanCard(
              nomor: 2,
              kategori: "Kerapihan",
              catatan: "Sering tidak memakai atribut lengkap.",
              status: "Sudah Berubah",
              lapor: "05 Nov 2024",
              update: "10 Nov 2024",
            ),

            _catatanCard(
              nomor: 3,
              kategori: "Sikap",
              catatan: "Kurang sopan saat berbicara dengan teman.",
              status: "Sudah Berubah",
              lapor: "03 Nov 2024",
              update: "07 Nov 2024",
            ),
          ],
        ),
      ),
    );
  }
}

Widget _catatanCard({
  required int nomor,
  required String kategori,
  required String catatan,
  required String status,
  required String lapor,
  required String update,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 20),
    padding: const EdgeInsets.all(18),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 8,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Catatan $nomor",
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 12),

        _infoRow("Kategori", kategori),
        _infoRow("Catatan", catatan),
        _infoRow("Status", status),
        _infoRow("Dilaporkan", lapor),
        _infoRow("Update Terakhir", update),

        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            icon: const Icon(Icons.info_outline),
            label: const Text("Detail"),
          ),
        ),
      ],
    ),
  );
}

Widget _infoRow(String label, String value) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 6),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 120,
          child: Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Text(value)),
      ],
    ),
  );
}

Widget _summaryCard(
  String title,
  String value,
  IconData icon,
  double width,
) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(22),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(18),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.05),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, color: Colors.black54)),
        const SizedBox(height: 12),
        Row(
          children: [
            Text(
              value,
              style: const TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFFE8F2FF),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(icon, size: 28, color: Colors.blue),
            )
          ],
        ),
      ],
    ),
  );
}