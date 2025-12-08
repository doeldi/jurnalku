import 'package:flutter/material.dart';
import 'package:jurnalku/dashboard_page.dart';
import 'package:jurnalku/explore_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();

  static Widget _buildFeatureCard({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withOpacity(0.15),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                Text(
                  description,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Banner-Web.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Masuk untuk memulai Jurnalku",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 30),
                  const Text("Username atau NIS"),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Masukkan username atau NIS',
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFF0D47A1), width: 2),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("Password"),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 40,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Masukkan password',
                        filled: true,
                        fillColor: const Color(0xFFF9FAFB),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0), width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFFE2E8F0), width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Color(0xFF0D47A1), width: 2),
                        ),
                        suffixIcon: const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0D47A1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text(
                        "Masuk",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Center(
                    child: Text(
                      "Lupa password? Hubungi guru laboran.",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Menyatukan Upaya untuk Kemajuan Siswa",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Center(
                    child: Text(
                      "Jurnalku adalah aplikasi cerdas yang membantu guru dan siswa dalam memantau dan mengelola kompetensi keahlian siswa secara efektif.",
                      style: TextStyle(fontSize: 13),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Login._buildFeatureCard(
                    icon: Icons.school,
                    title: "Dirancang untuk Sekolah Kami",
                    description:
                        "Dikembangkan khusus untuk memenuhi kebutuhan sekolah kami dengan fokus pada kemajuan siswa kami.",
                    color: Colors.yellow,
                  ),
                  Login._buildFeatureCard(
                    icon: Icons.track_changes,
                    title: "Pemantauan yang Terstruktur",
                    description:
                        "Memudahkan guru dalam menyusun dan memantau daftar kompetensi keahlian yang harus dikuasai siswa.",
                    color: Colors.purple,
                  ),
                  Login._buildFeatureCard(
                    icon: Icons.smart_display,
                    title: "Fitur Praktis dan Bermanfaat",
                    description:
                        "Termasuk reminder otomatis, grafik perkembangan, dan analisis mendalam untuk efektivitas belajar.",
                    color: Colors.blue,
                  ),
                  Login._buildFeatureCard(
                    icon: Icons.how_to_reg,
                    title: "Pengajuan Kompetensi oleh Siswa",
                    description:
                        "Siswa dapat mengajukan kompetensi yang telah dikuasai untuk diverifikasi oleh guru.",
                    color: Colors.orange,
                  ),
                  Login._buildFeatureCard(
                    icon: Icons.verified,
                    title: "Validasi dan Tanda Tangan Guru",
                    description:
                        "Setiap kompetensi yang disetujui akan diberikan tanda terima dan tanda tangan guru sebagai bukti.",
                    color: Colors.green,
                  ),
                  Login._buildFeatureCard(
                    icon: Icons.analytics,
                    title: "Pantauan Real-Time dan Transparan",
                    description:
                        "Monitoring langsung, menciptakan lingkungan belajar yang efisien.",
                    color: Colors.pinkAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              color: const Color(0xFF0D47A1),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.email, color: Colors.white),
                      SizedBox(width: 16),
                      Icon(Icons.phone, color: Colors.white),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "© GEN-28 PPLG SMK Wikrama Bogor. All rights reserved.",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 42,
        child: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ExplorePage(),
              ),
            );
          },
          backgroundColor: const Color(0xFF0D47A1),
          icon: const Icon(Icons.explore, color: Colors.white),
          label: const Text(
            'Jelajahi Siswa',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
