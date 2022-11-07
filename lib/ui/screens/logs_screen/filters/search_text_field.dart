import 'package:flutter/material.dart';

class SearchTextField extends StatefulWidget {
  final TextEditingController controller;
  final void Function(String)? onSubmitted, onChanged;
  const SearchTextField({
    super.key,
    required this.controller,
    this.onSubmitted,
    this.onChanged,
  });

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: TextField(
        onSubmitted: widget.onSubmitted,
        controller: widget.controller,
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          hintText: "Search",
          suffixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
