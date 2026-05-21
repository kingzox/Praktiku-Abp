import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/history_kerangka.dart';
import 'registration_details_page.dart'; // <--- IMPORT HALAMAN DETAILS

class EventHistoryPage extends StatelessWidget {
  const EventHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  HistoryKerangka.historyHeader(),
                  const SizedBox(height: 32),

                  // --- DAFTAR RIWAYAT EVENT ---
                  HistoryKerangka.historyCard(
                    title: "as",
                    date: "25 APR 2026",
                    id: "212",
                    status: "pending",
                    onDetailPressed: () {
                      // BUKA HALAMAN REGISTRATION DETAILS
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationDetailsPage()),
                      );
                    },
                  ),
                  HistoryKerangka.historyCard(
                    title: "Tech Symposium",
                    date: "12 MEI 2026",
                    id: "554",
                    status: "approved", // Coba status hijau
                    onDetailPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationDetailsPage()),
                      );
                    },
                  ),
                  HistoryKerangka.historyCard(
                    title: "Web Workshop",
                    date: "01 JUN 2026",
                    id: "882",
                    status: "pending",
                    onDetailPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RegistrationDetailsPage()),
                      );
                    },
                  ),
                  
                  const SizedBox(height: 100),
                ],
              ),
            ),

            // --- TOMBOL BACK ---
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white, 
                  shape: BoxShape.circle, 
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)]
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppTheme.darkBlue),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}