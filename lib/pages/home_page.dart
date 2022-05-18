import 'package:flutter/material.dart';
import 'package:flutter_codigo5_sqflite/ui/widgets/item_book_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../db/db_admin.dart';
import '../ui/utils/colors.dart';
import '../ui/widgets/item_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List books = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //DBAdmin.db.insertBook();
    getData();
  }

  getData() {
    DBAdmin.db.getBooks().then((value) {
      books = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Good Morning",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0,
                            ),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "Fiorella de Fátima",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.network(
                        "https://images.pexels.com/photos/3861969/pexels-photo-3861969.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260",
                        height: 64,
                        width: 64,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 4,
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Search",
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14.0,
                      color: kPrimaryColor.withOpacity(0.45),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: Container(
                      margin: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                        color: kSecondaryColor,
                        borderRadius: BorderRadius.circular(12.0),
                        boxShadow: [
                          BoxShadow(
                            color: kSecondaryColor.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(4, 4),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "My Books",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Show More",
                      style: GoogleFonts.poppins(
                        color: Colors.white38,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: books
                        .map(
                          (e) => ItemSliderWidget(
                            authorBook: e["author"],
                            imageBook: e["image"],
                            titleBook: e["title"],
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Column(
                  children: books
                      .map(
                        (e) => ItemBookWidget(
                          authorBook: e["author"],
                          imageBook: e["image"],
                          titleBook: e["title"],
                          descriptionBook: e["description"],
                        ),
                      )
                      .toList(),
                ),
                // FutureBuilder(
                //   future: DBAdmin.db.getBooks(),
                //   builder: (BuildContext context, AsyncSnapshot snap) {
                //     if (snap.hasData) {
                //       List list = snap.data;
                //       return SingleChildScrollView(
                //         physics: const BouncingScrollPhysics(),
                //         scrollDirection: Axis.horizontal,
                //         child: Row(
                //           children: list
                //               .map(
                //                 (e) => ItemSliderWidget(
                //                   authorBook: e["author"],
                //                   imageBook: e["image"],
                //                   titleBook: e["title"],
                //                 ),
                //               )
                //               .toList(),
                //         ),
                //       );
                //     }
                //     return const Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                // ),
                // const SizedBox(
                //   height: 30.0,
                // ),
                // FutureBuilder(
                //   future: DBAdmin.db.getBooks(),
                //   builder: (BuildContext context, AsyncSnapshot snap) {
                //     if (snap.hasData) {
                //       List list = snap.data;
                //       return Column(
                //         children: list
                //             .map(
                //               (e) => ItemBookWidget(
                //                 titleBook: e["title"],
                //                 imageBook: e["image"],
                //                 authorBook: e["author"],
                //                 descriptionBook: e["description"],
                //               ),
                //             )
                //             .toList(),
                //       );
                //     }
                //     return const Center(
                //       child: CircularProgressIndicator(),
                //     );
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
      // body: ListView.builder(
      //   itemCount: books.length,
      //   itemBuilder: (BuildContext context, int index) {
      //     return ListTile(
      //       title: Text(books[index]["title"]),
      //     );
      //   },
      // ),
      // body: FutureBuilder(
      //   future: DBAdmin.db.getBooks(),
      //   builder: (BuildContext context, AsyncSnapshot snap) {
      //     if (snap.hasData) {
      //       List bookList = snap.data;
      //       return ListView.builder(
      //         itemCount: bookList.length,
      //         itemBuilder: (BuildContext context, int index) {
      //           return ListTile(
      //             title: Text(bookList[index]["title"]),
      //           );
      //         },
      //       );
      //     }
      //     return Text("SS");
      //   },
      // ),
    );
  }
}
