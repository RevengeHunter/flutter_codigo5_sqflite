import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemSliderWidget extends StatelessWidget {

  String titleBook;
  String authorBook;
  String imageBook;

  ItemSliderWidget({required this.titleBook, required this.authorBook, required this.imageBook});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: const EdgeInsets.only(
        right: 14.0,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Image.network(
              imageBook,
              height: 250,
              width: 170,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 6.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorBook,
                  style: GoogleFonts.poppins(
                    fontSize: 12.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(
                  height: 2.0,
                ),
                Text(
                  titleBook,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 14.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}