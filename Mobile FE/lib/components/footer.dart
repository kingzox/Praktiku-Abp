import 'package:flutter/material.dart';

class UniventFooter extends StatelessWidget {
  const UniventFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF232A3B),
      padding: const EdgeInsets.all(60),
      width: double.infinity,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 992) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildLogoCol(),
                _buildQuickLinksCol(),
                _buildContactCol(),
              ],
            );
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLogoCol(),
                const SizedBox(height: 40),
                _buildQuickLinksCol(),
                const SizedBox(height: 40),
                _buildContactCol(),
              ],
            );
          }
        },
      ),
    );
  }

  Widget _buildLogoCol() {
    return Container(
      width: 250,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Univent",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 20),
          Text(
            "Connecting Telkom University Purwokerto students through incredible events.",
            style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickLinksCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Quick Links",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildFooterLink("Browse Events"),
        _buildFooterLink("Submit Event"),
      ],
    );
  }

  Widget _buildContactCol() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Categories",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        _buildFooterLink("Seminars"),
        _buildFooterLink("Workshops"),
        _buildFooterLink("Competitions"),
        const SizedBox(height: 30),
        const Text(
          "Contact Us",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Jl. DI Panjaitan No.128, Purwokerto",
          style: TextStyle(color: Color(0xFFFE2B6E)),
        ),
        const Text(
          "univenttelkom@gmail.com",
          style: TextStyle(
            color: Color(0xFFFE2B6E),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFooterLink(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(color: Colors.white70, fontSize: 14),
      ),
    );
  }
}
