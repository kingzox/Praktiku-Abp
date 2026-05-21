import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EventDetailPage extends StatelessWidget {
  const EventDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppTheme.primaryPink,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            elevation: 0,
          ),
          child: const Text("REGISTER EVENT NOW", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 280,
                  width: double.infinity,
                  color: AppTheme.darkBlue,
                  padding: const EdgeInsets.all(24),
                  child: const Center(
                    child: Text(
                      "> npm start [ERROR] TokenExpiredError\nUnauthorized: 401 Retrying connection... Failed.", 
                      style: TextStyle(color: Colors.white24, fontFamily: 'monospace', fontSize: 12),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.green), borderRadius: BorderRadius.circular(20)),
                        child: const Text("SEMINAR", style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(color: Colors.white, border: Border.all(color: Colors.blue), borderRadius: BorderRadius.circular(20)),
                        child: const Text("EXTERNAL", style: TextStyle(color: Colors.blue, fontSize: 12, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text("Satrio Gacor", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.people_outline, color: Colors.grey, size: 20),
                      const SizedBox(width: 8),
                      RichText(
                        text: const TextSpan(
                          text: "Organized by ", style: TextStyle(color: Colors.grey, fontSize: 14),
                          children: [TextSpan(text: "fregerg", style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkBlue))],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("START DATE", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 12, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Text("Tue, 12 May 2026,\n23:54", style: const TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.w600, fontSize: 13)),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("END DATE", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 12, fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 8),
                                  Text("Wed, 13 May 2026,\n21:56", style: const TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.w600, fontSize: 13)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.symmetric(vertical: 16.0), child: Divider(color: Color(0xFFEEEEEE))),
                        Row(
                          children: [
                            const Icon(Icons.location_on_outlined, color: AppTheme.primaryPink),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Location", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 12)),
                                const Text("zimbabwe", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            const Icon(Icons.call_outlined, color: AppTheme.primaryPink),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Contact Person", style: TextStyle(color: Colors.blueGrey.shade300, fontSize: 12)),
                                const Text("23194029479324", style: TextStyle(color: AppTheme.darkText, fontWeight: FontWeight.bold)),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), border: Border.all(color: Colors.grey.shade200)),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("ABOUT EVENT", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
                        SizedBox(height: 16),
                        Text("fregerg", style: TextStyle(color: Colors.grey, height: 1.5)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}