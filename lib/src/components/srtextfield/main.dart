import 'package:flutter/material.dart';

class SRTextField extends StatefulWidget {
  const SRTextField({super.key});

  @override
  State<SRTextField> createState() => _SRTextFieldState();
}

class _SRTextFieldState extends State<SRTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        decoration: const InputDecoration(hintText: 'Placeholder'),
      ),
    );
  }
}
