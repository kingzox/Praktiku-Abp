import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/submit_kerangka.dart';
import 'login_page.dart'; // <--- 1. TAMBAHKAN IMPORT INI

class SubmitEventPage extends StatefulWidget {
  const SubmitEventPage({super.key});

  @override
  State<SubmitEventPage> createState() => _SubmitEventPageState();
}

class _SubmitEventPageState extends State<SubmitEventPage> {
  String? _selectedOrganizerType;
  String? _selectedCategory;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER ---
            const Text("Submit Event", style: TextStyle(fontSize: 28, fontWeight: FontWeight.w900, color: AppTheme.darkText, letterSpacing: -0.5)),
            const SizedBox(height: 4),
            RichText(
              text: const TextSpan(
                text: 'Share your event with the ',
                style: TextStyle(color: Colors.grey, fontSize: 14),
                children: [
                  TextSpan(text: 'Telkom University', style: TextStyle(color: AppTheme.primaryPink, fontWeight: FontWeight.bold)),
                  TextSpan(text: ' community'),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- KOTAK FORM PUTIH ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10, offset: const Offset(0, 5)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. Event Title
                  SubmitKerangka.inputField(label: "Event Title", hint: "Enter Event Title"),
                  const SizedBox(height: 20),

                  // 2. Dropdowns Row
                  Row(
                    children: [
                      Expanded(
                        child: SubmitKerangka.dropdownField(
                          label: "Organizer Type", 
                          hint: "Select type", 
                          value: _selectedOrganizerType,
                          items: ['Student Association', 'Lecturer', 'External'],
                          onChanged: (val) => setState(() => _selectedOrganizerType = val),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: SubmitKerangka.dropdownField(
                          label: "Event Category", 
                          hint: "Select category", 
                          value: _selectedCategory,
                          items: ['Seminar', 'Workshop', 'Competition', 'Gathering'],
                          onChanged: (val) => setState(() => _selectedCategory = val),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 3. EVENT SCHEDULE SECTION
                  const Text("EVENT SCHEDULE", style: TextStyle(fontWeight: FontWeight.w900, color: AppTheme.darkText, letterSpacing: 1.2, fontSize: 14)),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: SubmitKerangka.inputField(label: "Start Date", hint: "mm/dd/yyyy", icon: Icons.calendar_today_outlined)),
                      const SizedBox(width: 16),
                      Expanded(child: SubmitKerangka.inputField(label: "Start Time", hint: "--:-- --", icon: Icons.access_time)),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(child: SubmitKerangka.inputField(label: "End Date", hint: "mm/dd/yyyy", icon: Icons.calendar_today_outlined)),
                      const SizedBox(width: 16),
                      Expanded(child: SubmitKerangka.inputField(label: "End Time", hint: "--:-- --", icon: Icons.access_time)),
                    ],
                  ),
                  const SizedBox(height: 30),

                  // 4. DESCRIPTION + TOMBOL AI
                  SubmitKerangka.descriptionWithAIField(label: "Description", hint: "Describe your event..."),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- SISA FORM (Lokasi, Link, Poster dkk) ---
            Row(
              children: [
                Expanded(child: SubmitKerangka.inputField(label: "Location", hint: "Enter Location")),
                const SizedBox(width: 16),
                Expanded(child: SubmitKerangka.inputField(label: "Contact Person", hint: "Name (WhatsApp)")),
              ],
            ),
            const SizedBox(height: 20),

            SubmitKerangka.inputField(label: "Registration Link", hint: "https://..."),
            const SizedBox(height: 30),

            // Upload Poster
            SubmitKerangka.uploadBox(),
            const SizedBox(height: 40),

            // --- BUTTONS ---
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {},
                  child: const Text("Clear Form", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.bold)),
                ),
                const SizedBox(width: 16),
                
                // 👇 2. REVISI DI SINI: SEKARANG DIARAHKAN KE LOGIN PAGE 👇
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: AppTheme.primaryButton,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text("Submit Event", style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 120), // Spasi bawah buat menu kapsul
          ],
        ),
      ),
    );
  }
}