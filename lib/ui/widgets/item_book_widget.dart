import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemBookWidget extends StatelessWidget {

  String titleBook;
  String authorBook;
  String imageBook;
  String descriptionBook;

  ItemBookWidget({required this.titleBook, required this.authorBook, required this.descriptionBook, required this.imageBook});


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 16.0,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              imageBook,
              width: 80.0,
              height: 100.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  authorBook,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white60,
                    fontSize: 12.0,
                  ),
                ),
                Text(
                  titleBook,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  descriptionBook,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    color: Colors.white60,
                    fontSize: 12.0,
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