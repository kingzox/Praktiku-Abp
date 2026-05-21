import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class EditEventKerangka {
  // 1. Label Input dengan Tanda Bintang (*)
  static Widget fieldLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.bold, fontSize: 13),
          children: const [
            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  // 2. Input Field Standar
  static Widget inputField({required String hint, IconData? icon, int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppTheme.darkBlue, fontSize: 14, fontWeight: FontWeight.w500),
        prefixIcon: icon != null ? Icon(icon, color: Colors.blueGrey.shade200, size: 20) : null,
        filled: true,
        fillColor: const Color(0xFFF8FAFC),
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppTheme.primaryPink),
        ),
      ),
    );
  }

  // 3. Dropdown Field
  static Widget dropdownField(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          isExpanded: true,
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.blueGrey),
          items: [value].map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Text(val, style: const TextStyle(color: AppTheme.darkBlue, fontSize: 14, fontWeight: FontWeight.w500)),
            );
          }).toList(),
          onChanged: (_) {},
        ),
      ),
    );
  }

  // 4. Box Upload Poster
  static Widget uploadPosterBox() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.primaryPink.withOpacity(0.2), style: BorderStyle.solid),
      ),
      child: Column(
        children: [
          const Icon(Icons.cloud_upload_outlined, color: AppTheme.primaryPink, size: 40),
          const SizedBox(height: 12),
          const Text("Drag & drop your file here", style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.darkBlue)),
          const SizedBox(height: 4),
          Text("PNG, JPG up to 4MB", style: TextStyle(fontSize: 12, color: Colors.grey.shade500)),
        ],
      ),
    );
  }
}