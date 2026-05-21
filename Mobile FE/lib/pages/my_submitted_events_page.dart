import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/submitted_kerangka.dart';
import 'registration_details_page.dart'; 

class MySubmittedEventsPage extends StatefulWidget {
  const MySubmittedEventsPage({super.key});

  @override
  State<MySubmittedEventsPage> createState() => _MySubmittedEventsPageState();
}

class _MySubmittedEventsPageState extends State<MySubmittedEventsPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: const Color(0xFFF8FAFC),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppTheme.darkBlue),
            onPressed: () => Navigator.pop(context),
          ),
          title: const Text(
            "Event List Management",
            style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.w900, letterSpacing: -0.5),
          ),
        ),
        body: Column(
          children: [
            // --- HEADER & SEARCH BAR ---
            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(left: 24, right: 24, top: 10, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Kelola event yang disubmit oleh pengguna dan tentukan status penayangannya.", style: TextStyle(color: AppTheme.greyText, fontSize: 13)),
                  const SizedBox(height: 20),
                  
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Search Events...",
                      hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 13),
                      prefixIcon: Icon(Icons.search, color: Colors.grey.shade400, size: 20),
                      filled: true, fillColor: const Color(0xFFF8FAFC),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: Colors.grey.shade200)),
                      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppTheme.primaryPink)),
                    ),
                  ),
                ],
              ),
            ),
            
            // --- TABS ---
            Container(
              color: Colors.white,
              width: double.infinity,
              child: const TabBar(
                isScrollable: true, 
                labelColor: AppTheme.primaryPink,
                unselectedLabelColor: Colors.grey,
                indicatorColor: AppTheme.primaryPink,
                indicatorWeight: 3,
                labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                tabs: [
                  Tab(text: "Menunggu (1)"),
                  Tab(text: "Disetujui (0)"),
                  Tab(text: "Ditolak (0)"),
                  Tab(text: "Semua (1)"),
                ],
              ),
            ),
            
            // --- KONTEN TABS ---
            Expanded(
              child: TabBarView(
                children: [
                  _buildAdminEventList(context, status: "pending"),
                  _buildAdminEventList(context, status: "approved"),
                  _buildAdminEventList(context, status: "rejected"),
                  _buildAdminEventList(context, status: "all"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget list data
  Widget _buildAdminEventList(BuildContext context, {required String status}) {
    if (status == "pending" || status == "all") {
      return ListView(
        padding: const EdgeInsets.all(24),
        children: [
          SubmittedKerangka.adminEventCard(
            title: "as",
            organizer: "asd",
            status: "Pending",
            onAccept: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Event disetujui!")));
            },
            onReject: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Event ditolak!")));
            },
            onView: () {
              // Buka halaman detail pendaftaran
              Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationDetailsPage()));
            },
            onDelete: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Event dihapus!")));
            },
          ),
        ],
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.inbox_outlined, size: 50, color: Colors.grey.shade300),
            const SizedBox(height: 16),
            const Text("Tidak ada data.", style: TextStyle(color: Colors.grey)),
          ],
        ),
      );
    }
  }
}