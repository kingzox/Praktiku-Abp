import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class HistoryKerangka {
  // Kerangka Kartu Event History
  static Widget historyCard(
    BuildContext context, {
    required String title,
    required String date,
    required String location,
    required String status,
    required Color statusColor,
    required Color statusTextColor,
    required VoidCallback onDetailsPressed, // Fungsi ketika tombol diklik
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(bottom: 16), // Jarak antar kartu
      decoration: BoxDecoration(
        color: AppTheme.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          // Bagian Atas: Gambar, Judul, Waktu, Lokasi
          Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(color: AppTheme.lightGreyBg, borderRadius: BorderRadius.circular(12)),
                child: const Icon(Icons.image_outlined, color: Colors.black26, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w900, fontStyle: FontStyle.italic, color: Color(0xFF0F172A)),
                      maxLines: 1, overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today_outlined, size: 14, color: AppTheme.greyText),
                        const SizedBox(width: 4),
                        Text(date, style: const TextStyle(fontSize: 12, color: AppTheme.greyText, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 16),
                        const Icon(Icons.location_on_outlined, size: 14, color: AppTheme.greyText),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(location, style: const TextStyle(fontSize: 12, color: AppTheme.greyText, fontWeight: FontWeight.w600), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(color: AppTheme.dividerColor, height: 1),
          ),

          // Bagian Bawah: Status & Tombol Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("STATUS", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.black38, letterSpacing: 1.0)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                    decoration: BoxDecoration(color: statusColor, borderRadius: BorderRadius.circular(20)),
                    child: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w800, color: statusTextColor)),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onDetailsPressed, // Dieksekusi dari file utama
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F172A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text("DETAILS", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, letterSpacing: 0.5)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}