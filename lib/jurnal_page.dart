import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

enum DailyStatus { done, empty, absent }

class JurnalPage extends StatelessWidget {
  JurnalPage({super.key});

  final List<Map<String, String>> pekerjaanDummy = [
    {
      "pekerjaan": "Membersihkan ruang kelas",
      "tanggal": "12 Nov 2025",
      "saksi": "Pak Andi",
    },
    {
      "pekerjaan": "Menyiapkan alat praktikum",
      "tanggal": "15 Nov 2025",
      "saksi": "Bu Rina",
    },
  ];

  final List<Map<String, String>> materiDummy = [
    {
      "materi": "OOP Dasar",
      "status": "A", // A = approved
      "tanggal": "05 Nov 2025",
    },
    {
      "materi": "Membuat REST API",
      "status": "P", // Pending
      "tanggal": "12 Nov 2025",
    },
    {
      "materi": "Debugging aplikasi",
      "status": "R", // Revisi
      "tanggal": "18 Nov 2025",
    },
  ];

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
      ],
    );
  }

  // ===================== PEMBIASAAN HARIAN =====================
  Widget buildPembiasaanHarian() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "A. Pembiasaan harian",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 8),
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

  // Grid kalender
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

  // ===================== PEKERJAAN DUMMY =====================
  Widget buildPekerjaan() {
    return ExpansionTile(
      title: const Text(
        "B. Pekerjaan yang dilakukan",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      children: [
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ...pekerjaanDummy.map((p) {
                return ListTile(
                  leading: const Icon(Icons.work_outline),
                  title: Text(p["pekerjaan"]!),
                  subtitle:
                      Text("Tanggal: ${p['tanggal']} | Saksi: ${p['saksi']}"),
                );
              }).toList(),
              const Divider(height: 0),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.add, color: Colors.blue),
                title: const Text("Tambah Pekerjaan",
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // ===================== MATERI DUMMY =====================
  Widget buildMateri() {
    return ExpansionTile(
      title: const Text(
        "C. Materi yang dipelajari",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      children: [
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              ...materiDummy.map((m) {
                Color statusColor = Colors.grey;
                if (m["status"] == "A") statusColor = Colors.green;
                if (m["status"] == "P") statusColor = Colors.yellow;
                if (m["status"] == "R") statusColor = Colors.red;

                return ListTile(
                  leading: Icon(Icons.menu_book_outlined, color: statusColor),
                  title: Text(m["materi"]!),
                  subtitle:
                      Text("Status: ${m['status']} | Tanggal: ${m['tanggal']}"),
                );
              }),
              const Divider(height: 0),
              ListTile(
                onTap: () {},
                leading: const Icon(Icons.add, color: Colors.blue),
                title: const Text("Tambah Materi",
                    style: TextStyle(color: Colors.blue)),
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),
        // Legend status
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

  // ===================== POIN =====================
  Widget buildPoin() {
    return ExpansionTile(
      title: const Text(
        "D. Poin",
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
      ),
      children: [
        Card(
          elevation: 1,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            children: [
              poinTile("Project / Update Progress", "0"),
              poinTile("Poin pertanyaan materi", "0"),
              poinTile("Jumlah poin minggu ini", "0"),
              poinTile("Jumlah poin pembiasaan", "0"),
              poinTile("Total keseluruhan poin", "0"),
            ],
          ),
        ),
      ],
    );
  }

  Widget poinTile(String label, String value) {
    return ListTile(
      title: Text(label),
      trailing: CircleAvatar(
        radius: 14,
        backgroundColor: Colors.blue.shade50,
        child: Text(
          value,
          style: const TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
