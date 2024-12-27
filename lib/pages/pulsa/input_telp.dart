import 'package:flutter/material.dart';

class InputTelpWidget extends StatefulWidget {
  final Function(String) onPhoneNumberChanged; // Callback to pass phone number

  const InputTelpWidget({super.key, required this.onPhoneNumberChanged});

  @override
  _InputTelpWidgetState createState() => _InputTelpWidgetState();
}

class _InputTelpWidgetState extends State<InputTelpWidget> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 28.0, right: 28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Nomor Handphone',
            style: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w700,
              color: _isFocused ? const Color(0xFFC80009) : Colors.grey,
            ),
          ),
          SizedBox(
            height: 30.0,
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
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
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
              ),
              onChanged: widget.onPhoneNumberChanged,
            ),
          ),
        ],
      ),
    );
  }
}
