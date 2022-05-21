import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite/models/book_model.dart';
import 'package:flutter_codigo5_sqflite/ui/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPage extends StatelessWidget {
  BookModel book;
  DetailPage({required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 20.0,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(28.0),
                  bottomLeft: Radius.circular(28.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    book.imageBook,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 30.0,
                    left: 10.0,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.1),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Titulo",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    book.titleBook,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Autor",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 4.0,
                  ),
                  Text(
                    book.authorBook,
                    style: GoogleFonts.poppins(
                      fontSize: 16.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    width: 100,
                    height: 3,
                    decoration: BoxDecoration(
                      color: kSecondaryColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  Text(
                    "Description",
                    style: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    book.descriptionBook,
                    style: GoogleFonts.poppins(
                      fontSize: 13.0,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
