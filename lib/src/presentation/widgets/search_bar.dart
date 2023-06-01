import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(
        top: 16,
        right: 16,
        left: 16,
      ),
      decoration: const ShapeDecoration(
        shape: StadiumBorder(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            CupertinoIcons.search,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              style: const TextStyle(
                fontFamily: 'Poppins',
              ),
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Search notes...',
                contentPadding: EdgeInsets.zero,
                hintStyle: TextStyle(
                  fontFamily: 'Poppins',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
