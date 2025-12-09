// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const ProfileMockApp());

// Alias: để widget_test.dart (và các file khác gọi MyApp) khỏi báo lỗi
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const ProfileMockApp();
  }
}

class ProfileMockApp extends StatelessWidget {
  const ProfileMockApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Profile Mock',
      debugShowCheckedModeBanner: false,
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // background color like the reference
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F5),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final phoneWidth = (constraints.maxWidth < 400)
                ? constraints.maxWidth * 0.86
                : 360.0;
            final phoneHeight = phoneWidth * 2.0;

            return Center(
              child: Container(
                width: phoneWidth,
                height: phoneHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.18),
                      offset: Offset(0, 12),
                      blurRadius: 30,
                    ),
                  ],
                  border: Border.all(color: Color(0xFFE6E9EE), width: 6),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 18,
                      left: 14,
                      child: _iconButton(Icons.arrow_back_ios_new),
                    ),
                    Positioned(
                      top: 18,
                      right: 14,
                      child: _iconButton(Icons.edit),
                    ),
                    Positioned.fill(
                      top: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 144,
                            height: 144,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: const LinearGradient(
                                colors: [Color(0xFFEAF5FF), Color(0xFFF6FBFF)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.06),
                                  offset: Offset(0, 8),
                                  blurRadius: 20,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.shade100,
                                  image: const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      'https://i.pravatar.cc/300',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Text(
                            'Johan Smith',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 0.2,
                            ),
                          ),

                          const SizedBox(height: 6),

                          Text(
                            'California, USA',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  static Widget _iconButton(IconData icon) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(14, 21, 47, 0.06),
            offset: Offset(0, 6),
            blurRadius: 18,
          ),
        ],
        border: Border.all(color: const Color(0xFFF0F4F8), width: 1.2),
      ),
      child: Icon(icon, size: 20, color: const Color(0xFF2B2F33)),
    );
  }
}
