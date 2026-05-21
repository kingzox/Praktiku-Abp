import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/register_kerangka.dart';
import 'edit_event_page.dart'; // <--- 1. PASTIKAN IMPORT INI ADA

class RegistrationDetailsPage extends StatelessWidget {
  const RegistrationDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // --- 1. HEADER NAVIGASI (BACK & EDIT SUBMISSION) ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlinedButton.icon(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 16,
                      color: AppTheme.darkBlue,
                    ),
                    label: const Text(
                      "Back",
                      style: TextStyle(
                        color: AppTheme.darkBlue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade300),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                  
                  // 👇 INI TOMBOL EDIT SUBMISSION YANG SUDAH AKTIF 👇
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const EditEventPage()),
                      );
                    },
                    icon: const Icon(Icons.edit, size: 14, color: Colors.white),
                    label: const Text(
                      "Edit Submission",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.darkBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      elevation: 0,
                    ),
                  ),
                ],
              ),

              // Garis pembatas atas
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(color: AppTheme.dividerColor, height: 1),
              ),

              // --- 2. KARTU PUTIH UTAMA (DENGAN HEADER STATUS) ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: AppTheme.white,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 10)),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Bagian Sub-Header Kartu & Status Badge PENDING
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "REGISTRATION DETAILS",
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: AppTheme.darkBlue),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "SUBMISSION ID: #REG-1",
                              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppTheme.badgePendingBg,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "PENDING",
                            style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: AppTheme.badgePendingText),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Divider(color: Colors.grey.shade100),
                    const SizedBox(height: 24),

                    // Modul Kerangka Lamamu
                    RegistrasiKerangka.eventTitle(
                      "as",
                      "Workshop",
                      "LECTURER",
                    ),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.organizerBox(
                      "asd",
                      "EVENT HOLDER",
                    ),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.scheduleBox(
                      "03 Apr 2026",
                      "04:14 AM",
                      "30 Apr 2026",
                      "04:14 AM",
                    ),
                    const SizedBox(height: 30),
                    RegistrasiKerangka.infoRow(
                      Icons.location_on,
                      "LOCATION",
                      "212",
                    ),
                    const SizedBox(height: 20),
                    RegistrasiKerangka.infoRow(
                      Icons.link,
                      "REGISTRATION LINK",
                      "http://127.0.0.1:8000/submit-event",
                      isLink: true,
                    ),
                    const SizedBox(height: 20),
                    RegistrasiKerangka.infoRow(
                      Icons.phone,
                      "CONTACT PERSON",
                      "13",
                    ),
                    const SizedBox(height: 30),

                    // Deskripsi Event
                    RegistrasiKerangka.sectionLabel("EVENT DESCRIPTION"),
                    const SizedBox(height: 12),
                    const Text(
                      "asd",
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.darkBlue,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 100), 
            ],
          ),
        ),
      ),
    );
  }
}