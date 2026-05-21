import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; 
import '../kerangka/home_kerangka.dart'; 

import 'browse_event_page.dart';
import 'submit_event_page.dart'; 
import 'profile_page.dart'; 
import 'login_page.dart'; 

class UniventHomePage extends StatefulWidget {
  final bool isLoggedIn; 

  const UniventHomePage({super.key, this.isLoggedIn = false}); 

  @override
  State<UniventHomePage> createState() => _UniventHomePageState();
}

class _UniventHomePageState extends State<UniventHomePage> {
  int _selectedIndex = 0;

  Widget _buildBodyContent() {
    if (_selectedIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            // 1. Hero Section
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
              child: Column(
                children: [
                  const Text("Telkom University Purwokerto", style: TextStyle(color: AppTheme.greyText, fontSize: 14)),
                  const SizedBox(height: 8),
                  const Text("Discover Campus", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppTheme.darkBlue)),
                  const Text("Events Here", style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900, color: AppTheme.primaryPink)),
                  const SizedBox(height: 16),
                  const Text(
                    "Stay connected with seminars, workshops, and gatherings organized by student associations and lecturers.",
                    textAlign: TextAlign.center, style: TextStyle(color: AppTheme.greyText, height: 1.5),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () => setState(() => _selectedIndex = 1),
                        style: AppTheme.primaryButton,
                        child: const Text("Browse Events", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {
                          if (widget.isLoggedIn) {
                            setState(() => _selectedIndex = 2);
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginPage()),
                            );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        ),
                        child: const Text("Submit Event", style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // 2. Section Bawah (Statistik, Event, Kategori)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    decoration: BoxDecoration(
                      color: Colors.white, 
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey.shade200), 
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.03), 
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        HomeKerangka.statItem(Icons.calendar_today_outlined, "50+", "Events"),
                        HomeKerangka.statItem(Icons.people_outline, "20+", "Organizers"),
                        HomeKerangka.statItem(Icons.star_border, "6", "Categories"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 40),
                  
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      HomeKerangka.sectionTitle("Upcoming Events", showSeeAll: true),
                      Container(
                        margin: const EdgeInsets.only(top: 4),
                        height: 3,
                        width: 80,
                        color: AppTheme.primaryPink,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  
                  HomeKerangka.eventCard(
                    context: context, 
                    title: "Satrio Gacor", 
                    organizer: "fregerg",
                    date: "Tue, May 12, 2026",
                    location: "zimbabwe",
                    isRecommended: true,
                  ),
                  HomeKerangka.eventCard(
                    context: context, 
                    title: "Ragnamok",
                    organizer: "HMF",
                    date: "Mon, May 11, 2026",
                    location: "ASDMK",
                    isRecommended: false, 
                  ),
                  const SizedBox(height: 20),
                  
                  HomeKerangka.sectionTitle("Categories"),
                  const SizedBox(height: 20),
                  Wrap(
                    spacing: 16, runSpacing: 16,
                    children: [
                      HomeKerangka.categoryButton(label: "Seminar", icon: Icons.mic, bgColor: const Color(0xFFFFEBEE), fgColor: Colors.redAccent),
                      HomeKerangka.categoryButton(label: "Workshop", icon: Icons.build, bgColor: const Color(0xFFFCE4EC), fgColor: Colors.pinkAccent),
                      HomeKerangka.categoryButton(label: "Competition", icon: Icons.emoji_events, bgColor: const Color(0xFFF3E5F5), fgColor: Colors.purpleAccent),
                    ],
                  ),
                  const SizedBox(height: 120), 
                ],
              ),
            ),
          ],
        ),
      );
    } else if (_selectedIndex == 1) {
      return const BrowseEventPage();
    } else if (_selectedIndex == 2) {
      return const SubmitEventPage();
    } else {
      return const ProfilePage(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, 
      backgroundColor: AppTheme.white, 
      
      // --- APPBAR ADAPTIF ---
      appBar: AppBar(
        backgroundColor: AppTheme.white, 
        elevation: 0,
        title: Image.asset(
          'assets/images/logo_univent.png', 
          height: 95, // Dari 28 kita naikkan ke 42
          fit: BoxFit.contain, // Memastikan gambar muat dengan rapi
          errorBuilder: (context, error, stackTrace) {
            return const Text("Univent", style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.bold, fontSize: 20));
          },
        ),
        actions: [
          if (!widget.isLoggedIn && _selectedIndex == 0)
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryPink,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                ),
                child: const Text("Login", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14)),
              ),
            ),
          
          if (widget.isLoggedIn) ...[
            Container(
              margin: const EdgeInsets.only(right: 12),
              decoration: const BoxDecoration(color: Color(0xFFF4F7FA), shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.notifications_none, color: AppTheme.darkBlue, size: 22),
                onPressed: () {},
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20),
              decoration: const BoxDecoration(color: Color(0xFFF4F7FA), shape: BoxShape.circle),
              child: IconButton(
                icon: const Icon(Icons.person_outline, color: AppTheme.darkBlue, size: 22),
                onPressed: () => setState(() => _selectedIndex = 3),
              ),
            ),
          ]
        ],
      ),

      body: _buildBodyContent(),
      
      // --- BOTTOM NAVIGATION BAR ADAPTIF ---
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
              if (!widget.isLoggedIn && (index == 2 || index == 3)) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                setState(() => _selectedIndex = index);
              }
            },
            selectedItemColor: AppTheme.primaryPink, 
            unselectedItemColor: Colors.grey.shade400,
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
            unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: "Home"),
              BottomNavigationBarItem(
                icon: Icon(widget.isLoggedIn ? Icons.search : Icons.explore_outlined), 
                label: widget.isLoggedIn ? "Events" : "Browse"
              ),
              const BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: "Submit"),
              const BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: "Profile"),
            ],
          ),
        ),
      ),
    );
  }
}