import 'package:flutter/material.dart';
import 'package:inamikro_app/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  final Function(String) noTelpChanged;
  final Function(String) passwordChanged;

  const LoginPage({
    super.key,
    required this.noTelpChanged,
    required this.passwordChanged,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _phoneFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  bool _isPhoneFocused = false;
  bool _isPasswordFocused = false;

  @override
  void initState() {
    super.initState();
    _phoneFocusNode.addListener(() {
      setState(() {
        _isPhoneFocused = _phoneFocusNode.hasFocus;
      });
    });

    _passwordFocusNode.addListener(() {
      setState(() {
        _isPasswordFocused = _passwordFocusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    _phoneFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: Column(
                    children: [
                      Image.asset('assets/images/inamikro_logo.png',
                          width: 196, height: 50),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 40, right: 28, left: 28),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Nomor Handphone',
                              style: TextStyle(
                                color: _isPhoneFocused
                                    ? const Color(0xFFC80009)
                                    : Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                              child: TextField(
                                controller: _phoneController,
                                focusNode: _phoneFocusNode,
                                decoration: InputDecoration(
                                  hintText: '08123456789',
                                  hintStyle: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFC80009),
                                      width: 2.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                ),
                                onChanged: widget.noTelpChanged,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'Kata Sandi',
                              style: TextStyle(
                                color: _isPasswordFocused
                                    ? const Color(0xFFC80009)
                                    : Colors.grey,
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 30.0,
                              child: TextField(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                obscureText: true, // to hide the password input
                                decoration: InputDecoration(
                                  hintText: 'INAmikro52',
                                  hintStyle: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: Colors.grey,
                                      width: 2.0,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: const BorderSide(
                                      color: Color(0xFFC80009),
                                      width: 2.0,
                                    ),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 10.0),
                                ),
                                onChanged: widget.passwordChanged,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 28.0, left: 28.0, bottom: 40.0),
            child: SizedBox(
              height: 38.0,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFC80009),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0), // Rounded corners
                  ),
                ),
                child: const Text(
                  'MASUK',
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
