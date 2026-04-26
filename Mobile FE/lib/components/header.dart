import 'package:flutter/material.dart';

class UniventHeader extends StatelessWidget {
  const UniventHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // 1. Menampilkan Gambar Logo
              Image.asset('assets/images/logo_univent.png', height: 40),

              const SizedBox(width: 10),
              // 3. Menampilkan Teks Univent
              const Text(
                "Univent",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFE2B6E),
                ),
              ),
            ],
          ),

          // Tautan Navigasi
          if (MediaQuery.of(context).size.width > 768)
            Row(
              children: [
                _buildNavLink("Home", isSelected: true),
                _buildNavLink("Events"),
                _buildNavLink("Submit Event"),
              ],
            ),

          // Tombol Login
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFE2B6E),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 4,
            ),
            child: const Text("Login"),
          ),
        ],
      ),
    );
  }
  Widget _buildNavLink(String title, {bool isSelected = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? const Color(0xFFFE2B6E) : Colors.black87,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
          fontSize: 16,
        ),
      ),
    );
  }
}
