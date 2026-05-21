import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/contact_kerangka.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Background abu-abu muda
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Contact Us",
          style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- HEADER TEKS ---
            const Text(
              "Have questions or feedback? We'd love to hear from you!",
              style: TextStyle(fontSize: 14, color: Colors.blueGrey, height: 1.5),
            ),
            const SizedBox(height: 32),

            // --- 1. KARTU INFORMASI KONTAK (GET IN TOUCH) ---
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Get In Touch", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
                  const SizedBox(height: 24),
                  
                  ContactKerangka.infoCard(
                    icon: Icons.location_on_outlined,
                    iconColor: Colors.redAccent,
                    bgColor: Colors.red.shade50,
                    title: "Address",
                    subtitle: "Jl. D.I. Panjaitan No. 128, Purwokerto, Banyumas, Jawa Tengah",
                  ),
                  ContactKerangka.infoCard(
                    icon: Icons.phone_outlined,
                    iconColor: Colors.green,
                    bgColor: Colors.green.shade50,
                    title: "WhatsApp",
                    subtitle: "087824253296",
                  ),
                  ContactKerangka.infoCard(
                    icon: Icons.mail_outline,
                    iconColor: AppTheme.primaryPink,
                    bgColor: AppTheme.lightPinkBg,
                    title: "Email Address",
                    subtitle: "univenttelkom@gmail.com",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // --- 2. KARTU FORMULIR PESAN ---
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Send a Message", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
                  const SizedBox(height: 24),

                  ContactKerangka.formLabel("Your Name"),
                  ContactKerangka.inputField(hint: "yogahogantara"), // Sesuai desainmu
                  const SizedBox(height: 20),

                  ContactKerangka.formLabel("Email Address"),
                  ContactKerangka.inputField(hint: "yogahogantara@gmail.com"),
                  const SizedBox(height: 20),

                  ContactKerangka.formLabel("Message"),
                  ContactKerangka.inputField(hint: "Write your message here", maxLines: 5),
                  const SizedBox(height: 32),

                  // Tombol Send Message
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Logika kirim pesan
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Pesan berhasil dikirim!")));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryPink,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 0,
                      ),
                      child: const Text("Send Message", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // --- 3. SUPPORT HOURS BADGE ---
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey.shade200),
                ),
                child: Text(
                  "SUPPORT HOURS: 08:00 - 17:00 WIB",
                  style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.blueGrey.shade400, letterSpacing: 1),
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}