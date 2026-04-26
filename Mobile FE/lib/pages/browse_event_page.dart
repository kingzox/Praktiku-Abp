import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; 

class BrowseEventPage extends StatefulWidget {
  const BrowseEventPage({super.key});

  @override
  State<BrowseEventPage> createState() => _BrowseEventPageState();
}

class _BrowseEventPageState extends State<BrowseEventPage> {
  String _selectedCategory = 'All Categories';
  final List<String> _categories = [
    'All Categories', 'Seminar', 'Workshop', 'Competition', 'Gathering', 'Other'
  ];

  String _selectedOrganizer = 'All Organizers';
  final List<String> _organizers = [
    'All Organizers', 'Student Association', 'Lecturer', 'External'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white, // 2. Pakai warna putih dari pusat
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Navigator.canPop(context)
                    ? IconButton(
                        icon: const Icon(Icons.arrow_back, color: AppTheme.darkText),
                        onPressed: () => Navigator.pop(context),
                      )
                    : const SizedBox(height: 10),
              ),

              const Text(
                "Browse Events",
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText), // 3. Pakai warna teks pusat
              ),
              const SizedBox(height: 8),

              const Text(
                "Discover exciting events happening at Telkom University Purwokerto",
                textAlign: TextAlign.center,
                style: AppTheme.subtitleRegular, // 4. Pakai gaya subtitle pusat
              ),
              const SizedBox(height: 30),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Search by title or location...",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  filled: true,
                  fillColor: const Color(0xFFF8F9FA),
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 15),

              // Filter Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildDropdown(
                      currentValue: _selectedCategory,
                      options: _categories,
                      onChanged: (newValue) => setState(() => _selectedCategory = newValue!),
                    ),
                    const SizedBox(width: 10),
                    _buildDropdown(
                      currentValue: _selectedOrganizer,
                      options: _organizers,
                      onChanged: (newValue) => setState(() => _selectedOrganizer = newValue!),
                    ),
                    const SizedBox(width: 10),

                    // Tombol Reset
                    ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          _selectedCategory = 'All Categories';
                          _selectedOrganizer = 'All Organizers';
                        });
                      },
                      icon: const Icon(Icons.refresh, size: 16, color: Colors.white),
                      label: const Text("Reset", style: TextStyle(color: Colors.white)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.darkText, // 5. Warna gelap pusat
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                        elevation: 0,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 80),

              // No Events Found Section
              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                    color: AppTheme.primaryPink, // 6. Icon background pink pusat
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                          color: AppTheme.primaryPink.withOpacity(0.2),
                          blurRadius: 20,
                          offset: const Offset(0, 10))
                    ]),
                child: const Icon(Icons.search_off_rounded, color: Colors.white, size: 40),
              ),
              const SizedBox(height: 20),
              const Text(
                "No Events Found",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.darkText),
              ),
              const SizedBox(height: 10),
              const Text(
                "Try adjusting your filters or search terms to find\nwhat you're looking for.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: AppTheme.greyText, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown({
    required String currentValue,
    required List<String> options,
    required void Function(String?) onChanged,
  }) {
    return Container(
      height: 48,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppTheme.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(30),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: currentValue,
          icon: const Icon(Icons.keyboard_arrow_down, size: 18, color: Colors.grey),
          borderRadius: BorderRadius.circular(12),
          style: const TextStyle(color: AppTheme.darkText, fontSize: 13, fontWeight: FontWeight.w500),
          onChanged: onChanged,
          items: options.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ),
    );
  }
}