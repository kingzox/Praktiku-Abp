import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/submit_kerangka.dart'; // <-- Panggil dari folder kerangka

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
            const Text("Submit Event", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppTheme.darkText)),
            const SizedBox(height: 8),
            const Text(
              "Share your event with the Telkom University Purwokerto community. All fields marked with * are required.",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 30),

            // --- FORM FIELDS ---
            SubmitKerangka.inputField(label: "Event Title", hint: "Enter Event Title"),
            const SizedBox(height: 20),
            
            SubmitKerangka.inputField(label: "Organizer Name", hint: "Enter Organizer Title"),
            const SizedBox(height: 20),

            // Dropdowns Row
            Row(
              children: [
                Expanded(
                  child: SubmitKerangka.dropdownField(
                    label: "Organizer Type", 
                    hint: "Select Type", 
                    value: _selectedOrganizerType,
                    items: ['Student Association', 'Lecturer', 'External'],
                    onChanged: (val) => setState(() => _selectedOrganizerType = val),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: SubmitKerangka.dropdownField(
                    label: "Event Category", 
                    hint: "Select Category", 
                    value: _selectedCategory,
                    items: ['Seminar', 'Workshop', 'Competition', 'Gathering'],
                    onChanged: (val) => setState(() => _selectedCategory = val),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // --- EVENT SCHEDULE CARD ---
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.lightGreyBg, // Disesuaikan ke warna abu-abu terang AppTheme
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("EVENT SCHEDULE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blueGrey, letterSpacing: 1.2, fontSize: 12)),
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
                ],
              ),
            ),
            const SizedBox(height: 30),

            // --- DESCRIPTION ---
            SubmitKerangka.inputField(label: "Description", hint: "Describe your event...", maxLines: 4),
            const SizedBox(height: 20),

            // --- LOCATION & CONTACT ---
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

            // --- EVENT POSTER UPLOAD ---
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
                ElevatedButton(
                  onPressed: () {},
                  style: AppTheme.primaryButton,
                  child: const Text("Submit Event", style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}