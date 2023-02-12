import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  Function(String)? onChanged;
  SearchBar({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w, right: 10.w),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.primary,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: const [0.1, 0.8],
          ),
          borderRadius: BorderRadius.circular(10)),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        onChanged: onChanged,
        decoration: InputDecoration(
            suffixIcon: const Icon(
              Icons.search,
              color: Colors.white,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: const TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.only(left: 10.w, top: 10.h)),
      ),
    );
  }
}
