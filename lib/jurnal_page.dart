import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

enum DailyStatus { done, empty, absent }

class JurnalPage extends StatelessWidget {
  JurnalPage({super.key});

  late final Map<int, DailyStatus> dailyStatus = {
    for (int i = 1; i <= 30; i++)
      i: i % 2 == 1
          ? DailyStatus.done
          : i == 30
              ? DailyStatus.empty
              : DailyStatus.absent
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildHeader(context),
            const SizedBox(height: 24),
            buildPembiasaanHarian(),
            const SizedBox(height: 32),
            buildPekerjaan(),
            const SizedBox(height: 32),
            buildMateri(),
            const SizedBox(height: 32),
            buildPoin(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // =====================  HEADER  =====================
  Widget buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jurnal Pembiasaan',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1E293B),
                letterSpacing: -0.5,
              ),
            ),
            SizedBox(height: 4),
            Text(
              'NOVEMBER - 2025',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF64748B),
              ),
            ),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF1E3A8A),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            splashRadius: 20,
          ),
        ),
      ],
    );
  }

  // =====================  KALENDER  =====================
  Widget buildPembiasaanHarian() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "A. Pembiasaan harian",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),

        // Legend
        const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green, size: 12),
            SizedBox(width: 4),
            Text("Sudah diisi   "),
            Icon(Icons.remove_circle, color: Colors.grey, size: 12),
            SizedBox(width: 4),
            Text("Belum diisi   "),
            Icon(Icons.cancel, color: Colors.red, size: 12),
            SizedBox(width: 4),
            Text("Tidak diisi"),
          ],
        ),
        const SizedBox(height: 16),

        buildCalendar(),
      ],
    );
  }

  Widget buildCalendar() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        mainAxisSpacing: 6,
        crossAxisSpacing: 6,
        childAspectRatio: 1,
      ),
      itemCount: 30,
      itemBuilder: (context, index) {
        final day = index + 1;
        DailyStatus status = dailyStatus[day] ?? DailyStatus.empty;

        IconData icon;
        Color color;
        Color bg;

        switch (status) {
          case DailyStatus.done:
            icon = Icons.check_circle;
            color = Colors.green;
            bg = const Color(0xFFE7F7EA);
            break;
          case DailyStatus.absent:
            icon = Icons.cancel;
            color = Colors.red;
            bg = const Color(0xFFFCE7E7);
            break;
          default:
            icon = Icons.remove_circle;
            color = Colors.grey;
            bg = Colors.white;
        }

        return Container(
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$day", style: const TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 2),
              Icon(icon, size: 16, color: color),
            ],
          ),
        );
      },
    );
  }

  // =====================  TABLE PEKERJAAN  =====================
  Widget buildPekerjaan() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "B. Pekerjaan yang dilakukan",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              headerRow(["Pekerjaan", "Tgl", "Saksi"]),
              dataRow("Belum ada pekerjaan yang diinput.", "", ""),
              addRow("+ Tambah Pekerjaan"),
            ],
          ),
        ),
      ],
    );
  }

  // =====================  TABLE MATERI  =====================
  Widget buildMateri() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "C. Materi yang dipelajari",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              headerRow(["Materi", "Sts", "Tgl"]),
              dataRow("Belum ada materi yang diinput.", "", ""),
              addRow("+ Tambah Materi"),
            ],
          ),
        ),
        const SizedBox(height: 4),
        const Row(
          children: [
            Icon(Icons.circle, color: Colors.green, size: 12),
            SizedBox(width: 4),
            Text("A : Approved   "),
            Icon(Icons.circle, color: Colors.yellow, size: 12),
            SizedBox(width: 4),
            Text("P : Pending   "),
            Icon(Icons.circle, color: Colors.red, size: 12),
            SizedBox(width: 4),
            Text("R : Revisi"),
          ],
        ),
      ],
    );
  }

  // =====================  TABLE POIN  =====================
  Widget buildPoin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "D. Poin",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
          ),
          child: Column(
            children: [
              headerRow(["Kategori Poin", "M1", "M2", "M3", "M4"]),
              dataRow("(5) Project/update progress", "0", "0", "0", "0"),
              dataRow("(1-5) Poin pertanyaan materi", "0", "0", "0", "0"),
              dataRow("Jumlah poin minggu ini", "0", "0", "0", "0"),
              dataRow("Jumlah poin pembiasaan", "0", "0", "0", "0"),
              dataRow("Total keseluruhan poin", "0", "0", "0", "0"),
            ],
          ),
        ),
      ],
    );
  }

  // =====================  TABLE ROW HELPERS  =====================
  static Widget headerRow(List<String> cols) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: cols
            .map(
              (e) => Expanded(
                child: Text(
                  e,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 13,
                      color: Colors.black87),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  static Widget dataRow(String c1, String c2, String c3,
      [String? c4, String? c5]) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200),
        ),
      ),
      child: Row(
        children: [
          Expanded(
              child: Text(
            c1,
            style: const TextStyle(fontSize: 13),
          )),
          Expanded(
              child: Text(
            c2,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          )),
          Expanded(
              child: Text(
            c3,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          )),
          if (c4 != null)
            Expanded(
                child: Text(
              c4,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            )),
          if (c5 != null)
            Expanded(
                child: Text(
              c5,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            )),
        ],
      ),
    );
  }

  static Widget addRow(String label) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: GestureDetector(
        onTap: () {},
        child: Text(
          label,
          style: const TextStyle(
              color: Color(0xFF2563EB),
              fontWeight: FontWeight.w600,
              fontSize: 13),
        ),
      ),
    );
  }
}
