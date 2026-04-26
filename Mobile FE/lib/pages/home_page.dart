import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; 
import '../components/hero_section.dart';
import '../components/upcoming_events.dart';
import 'browse_event_page.dart';
import 'submit_event_page.dart'; 
import 'profile_page.dart'; 

class UniventHomePage extends StatefulWidget {
  const UniventHomePage({super.key});

  @override
  State<UniventHomePage> createState() => _UniventHomePageState();
}

class _UniventHomePageState extends State<UniventHomePage> {
  int _selectedIndex = 0;

  // Untuk mengatur isi layar berdasarkan menu yang di-klik
  Widget _buildBodyContent() {
    if (_selectedIndex == 0) {
      // Halaman 0 = Home
      return SingleChildScrollView(
        child: Column(
          children: const [
            HeroSection(),
            UpcomingEventsSection(),
            SizedBox(height: 100), 
          ],
        ),
      );
    } else if (_selectedIndex == 1) {
      // Halaman 1 = Browse Event
      return const BrowseEventPage();
    } else if (_selectedIndex == 2) {
      // Halaman 2 = Submit Event 
      return const SubmitEventPage();
    } else {
      // Halaman 3 = Profile (Sekarang sudah ngarah ke halaman aslinya!)
      return const ProfilePage(); // <--- 2. Panggil di sini
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      backgroundColor: AppTheme.white, 
      
      appBar: AppBar(
        backgroundColor: AppTheme.white, 
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 70,
        title: Image.asset('assets/images/logo_univent.png', height: 100),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: AppTheme.darkText), 
            onPressed: () {},
          ),
          const SizedBox(width: 10),
        ],
      ),

      body: _buildBodyContent(),

      // --- MENU BAWAH GAYA KAPSUL MELAYANG ---
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
        decoration: BoxDecoration(
          color: AppTheme.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryPink.withOpacity(0.15), 
              blurRadius: 25,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: (index) {
              setState(() {
                _selectedIndex = index; 
              });
            },
            backgroundColor: AppTheme.white,
            elevation: 0,
            selectedItemColor: AppTheme.primaryPink, 
            unselectedItemColor: Colors.grey.shade400,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.home_filled),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.explore_outlined),
                ),
                label: "Browse",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.add_box_outlined),
                ),
                label: "Submit",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 4.0),
                  child: Icon(Icons.person_outline),
                ),
                label: "Profile",
              ),
            ],
          ),
        ),
      ),
    );
  }
}