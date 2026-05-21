import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/edit_event_kerangka.dart';

class EditEventPage extends StatelessWidget {
  const EditEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Edit Event", style: TextStyle(color: AppTheme.darkBlue, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.darkBlue),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 20, offset: const Offset(0, 10))],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Share your event with the Telkom University Purwokerto community.", style: TextStyle(color: Colors.blueGrey, fontSize: 13)),
              const SizedBox(height: 32),

              EditEventKerangka.fieldLabel("Event Title"),
              EditEventKerangka.inputField(hint: "as"),
              const SizedBox(height: 20),

              EditEventKerangka.fieldLabel("Organizer Name"),
              EditEventKerangka.inputField(hint: "asd"),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditEventKerangka.fieldLabel("Organizer Type"),
                        EditEventKerangka.dropdownField("Lecturer"),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        EditEventKerangka.fieldLabel("Event Category"),
                        EditEventKerangka.dropdownField("Workshop"),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              const Text("EVENT SCHEDULE", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey, fontSize: 11, letterSpacing: 1)),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: EditEventKerangka.inputField(hint: "04/03/2026", icon: Icons.calendar_today)),
                  const SizedBox(width: 12),
                  Expanded(child: EditEventKerangka.inputField(hint: "04:14 AM", icon: Icons.access_time)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: EditEventKerangka.inputField(hint: "04/30/2026", icon: Icons.calendar_today)),
                  const SizedBox(width: 12),
                  Expanded(child: EditEventKerangka.inputField(hint: "04:14 AM", icon: Icons.access_time)),
                ],
              ),
              const SizedBox(height: 20),

              EditEventKerangka.fieldLabel("Description"),
              EditEventKerangka.inputField(hint: "asd", maxLines: 4),
              const SizedBox(height: 20),

              Row(
                children: [
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [EditEventKerangka.fieldLabel("Location"), EditEventKerangka.inputField(hint: "212")])),
                  const SizedBox(width: 16),
                  Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [EditEventKerangka.fieldLabel("Contact Person"), EditEventKerangka.inputField(hint: "13")])),
                ],
              ),
              const SizedBox(height: 20),

              EditEventKerangka.fieldLabel("Registration Link"),
              EditEventKerangka.inputField(hint: "http://127.0.0.1:8000/submit-event"),
              const SizedBox(height: 20),

              EditEventKerangka.fieldLabel("Event Poster"),
              EditEventKerangka.uploadPosterBox(),
              const SizedBox(height: 40),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text("Clear Form", style: TextStyle(color: Colors.blueGrey, fontWeight: FontWeight.bold))),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryPink,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 0,
                    ),
                    child: const Text("Update Event", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}