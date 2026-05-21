import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../kerangka/login_kerangka.dart'; 
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FA), 
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // 👇 INI YANG TADI ERROR, SEKARANG SUDAH ADA CONTEXT-NYA 👇
                    LoginKerangka.headerSection(context),
                    const SizedBox(height: 32),

                    Container(
                      padding: const EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.03),
                            blurRadius: 24,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LoginKerangka.inputField(
                            label: "Email Address",
                            hint: "name@example.com",
                            icon: Icons.mail_outline,
                          ),
                          const SizedBox(height: 20),
                          LoginKerangka.inputField(
                            label: "Password",
                            hint: "........",
                            icon: Icons.lock_outline,
                            isPassword: true,
                            rightLabel: const Text("Forgot password?", style: TextStyle(color: Colors.redAccent, fontSize: 13, fontWeight: FontWeight.bold)),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              SizedBox(
                                width: 24,
                                height: 24,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (val) {
                                    setState(() {
                                      _rememberMe = val ?? false;
                                    });
                                  },
                                  activeColor: AppTheme.primaryPink,
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                                  side: BorderSide(color: Colors.grey.shade400),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text("Remember Me", style: TextStyle(color: AppTheme.darkText, fontSize: 14)),
                            ],
                          ),
                          const SizedBox(height: 32),
                          LoginKerangka.primaryButton("Log In Sekarang", () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              // Lempar status isLoggedIn: true ke HomePage
                              MaterialPageRoute(builder: (context) => const UniventHomePage(isLoggedIn: true)),
                              (route) => false,
                            );
                          }),
                          const SizedBox(height: 24),
                          LoginKerangka.dividerOr(),
                          const SizedBox(height: 24),
                          LoginKerangka.googleButton(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 2)),
                  ],
                ),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: AppTheme.darkText),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}