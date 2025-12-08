import 'package:flutter/material.dart';
import 'package:jurnalku/progres_page.dart';

class ProgressAkademikCard extends StatelessWidget {
  const ProgressAkademikCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 6,
              offset: const Offset(0, 3),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Progress Akademik",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // LIST ITEM
            _buildItem("Selesai", Colors.blue, "1"),
            _buildItem("Pending", Colors.blue.shade300, "0"),
            _buildItem("Belum", Colors.cyan, "0"),
            _buildItem("Hari Ini", Colors.green, "0"),

            const SizedBox(height: 20),

            // Tombol
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProgressBelajarPage(),
                        ));
                  },
                  child: Text(
                    "Lihat Progress Kamu",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue.shade700,
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_right_alt, color: Colors.blue, size: 20),
              ],
            )
          ],
        ),
      ),
    );
  }

  // List builder
  Widget _buildItem(String title, Color dotColor, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(Icons.circle, size: 10, color: dotColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14),
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
