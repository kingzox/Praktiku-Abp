import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/home_kerangka.dart'; 

class BrowseEventPage extends StatefulWidget {
  const BrowseEventPage({super.key});

  @override
  State<BrowseEventPage> createState() => _BrowseEventPageState();
}

class _BrowseEventPageState extends State<BrowseEventPage> {
  // Tambahin kategori 'Training' biar pas sama gambarmu
  final List<String> _categories = ['All', 'Seminar', 'Workshop', 'Competition', 'Training'];
  String _selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background putih bersih
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- 1. JUDUL & SUB-JUDUL ---
              const Text("Browse Events", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
              const SizedBox(height: 4),
              const Text(
                "Discover exciting events at Telkom University",
                style: TextStyle(fontSize: 14, color: Colors.blueGrey),
              ),
              const SizedBox(height: 24),

              // --- 2. SEARCH BAR (KOLOM PENCARIAN) ---
              TextField(
                decoration: InputDecoration(
                  hintText: "Cari judul, lokasi, atau deskripsi...",
                  hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                  contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(color: AppTheme.primaryPink),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),

              // --- 3. KATEGORI (GESER HORIZONTAL TANPA GARIS JELEK) ---
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(), // <-- Ini yang bikin garis scrollbar hilang dan mulus
                child: Row(
                  children: _categories.map((category) {
                    bool isActive = _selectedCategory == category;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedCategory = category),
                      child: Container(
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                          color: isActive ? AppTheme.primaryPink : AppTheme.lightGreyBg,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          category,
                          style: TextStyle(
                            color: isActive ? Colors.white : Colors.blueGrey,
                            fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 32),

              // --- 4. REKOMENDASI & LIST EVENT ---
              const Text("Rekomendasi Khusus Untukmu", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
              const SizedBox(height: 16),
              
              // Panggil eventCard dari home_kerangka (pastikan tetap lempar context)
              HomeKerangka.eventCard(
                context: context, 
                title: "Satrio Gacor", 
                organizer: "fregerg",
                date: "Tue, May 12, 2026",
                location: "zimbabwe",
                isRecommended: true,
              ),
              const SizedBox(height: 10),
              
              const Center(
                child: Text("SEMUA EVENT", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12, color: Colors.grey)),
              ),
              const SizedBox(height: 16),
              
              HomeKerangka.eventCard(
                context: context, 
                title: "Ragnamok", 
                organizer: "HMF",
                date: "Mon, May 11, 2026",
                location: "ASDMK",
                isRecommended: false,
              ),
              
              const SizedBox(height: 120), // Spasi kosong bawah biar gak ketutup menu navigasi
            ],
          ),
        ),
      ),
    );
  }
}