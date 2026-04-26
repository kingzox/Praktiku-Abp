import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class SubmitKerangka {
  // 1. Kerangka Label dengan Bintang Merah
  static Widget formLabel(String text) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: AppTheme.darkText),
        children: const [
          TextSpan(text: ' *', style: TextStyle(color: AppTheme.primaryPink)),
        ],
      ),
    );
  }

  // 2. Kerangka Input Field
  static Widget inputField({required String label, required String hint, int maxLines = 1, IconData? icon}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formLabel(label),
        const SizedBox(height: 8),
        TextField(
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
            suffixIcon: icon != null ? Icon(icon, color: Colors.grey, size: 20) : null,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppTheme.primaryPink)),
          ),
        ),
      ],
    );
  }

  // 3. Kerangka Dropdown
  static Widget dropdownField({required String label, required String hint, required String? value, required List<String> items, required Function(String?) onChanged}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formLabel(label),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade300), borderRadius: BorderRadius.circular(12)),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              hint: Text(hint, style: const TextStyle(color: Colors.grey, fontSize: 14)),
              value: value,
              icon: const Icon(Icons.keyboard_arrow_down, color: Colors.grey),
              items: items.map((String item) => DropdownMenuItem(value: item, child: Text(item, style: const TextStyle(fontSize: 14)))).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  // 4. Kerangka Kotak Upload Poster
  static Widget uploadBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        formLabel("Event Poster"),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: AppTheme.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade300, style: BorderStyle.solid),
          ),
          child: Column(
            children: [
              const Icon(Icons.file_upload_outlined, color: AppTheme.primaryPink, size: 40),
              const SizedBox(height: 12),
              const Text("Drag & drop your file here", style: TextStyle(fontWeight: FontWeight.w600, color: AppTheme.darkText)),
              const SizedBox(height: 4),
              Text("PNG, JPG up to 4MB", style: TextStyle(color: Colors.grey.shade500, fontSize: 12)),
            ],
          ),
        ),
      ],
    );
  }
}