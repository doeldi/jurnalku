import 'package:flutter/material.dart';
import 'package:jurnalku/widgets/appbar.dart';
import 'package:jurnalku/widgets/appdrawer.dart';

class PermintaanSaksiPage extends StatelessWidget {
  const PermintaanSaksiPage({super.key});

  final List<Map<String, String>> dummyData = const [
    {
      "pengirim": "Abdul Hadi",
      "tanggal": "25 Nov 2025",
      "keterangan": "Meminta menjadi saksi untuk jurnal keterlambatan.",
    },
    {
      "pengirim": "M. Fazri Adityansah",
      "tanggal": "24 Nov 2025",
      "keterangan": "Meminta saksi untuk jurnal kedisiplinan.",
    },
    {
      "pengirim": "Zahran Fairuz R",
      "tanggal": "23 Nov 2025",
      "keterangan": "Meminta saksi kegiatan organisasi.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      drawer: const AppDrawer(name: "Abdul Hadi", kelas: "PPLG XII-4"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Permintaan Saksi',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Kelola permintaan menjadi saksi dari siswa lain',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                "Wednesday, 26 November 2025",
                style: TextStyle(
                  color: Color.fromARGB(255, 13, 117, 202),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ============= ExpansionTile List ===============
            Expanded(
              child: dummyData.isEmpty
                  ? const Center(
                      child: Text(
                        "Belum ada permintaan saksi",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: dummyData.length,
                      itemBuilder: (context, index) {
                        final item = dummyData[index];
                        return ExpansionTile(
                          title: Text(
                            item["pengirim"] ?? "-",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            item["tanggal"] ?? "-",
                            style: const TextStyle(color: Colors.grey),
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              child: Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        item["keterangan"] ?? "",
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 12),

                                      // Buttons
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text(
                                              "Tolak",
                                              style: TextStyle(
                                                  color: Colors.red),
                                            ),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.blue,
                                            ),
                                            child: const Text("Terima", style: TextStyle(color: Colors.white)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
