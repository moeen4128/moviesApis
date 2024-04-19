import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_apis_app/Get/FavouriteController.dart';

class Deskfav extends StatelessWidget {
  final FavouriteController _favouriteController = Get.find();
  Deskfav({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Favourite'),
          centerTitle: true,
          leading: const BackButton(),
        ),
        body: Obx(() => ListView.builder(
              itemCount: _favouriteController.FavouriteListImage.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(58.0),
                  child: SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Card(
                      child: Row(
                        children: [
                          Card(
                            elevation: 1,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  _favouriteController
                                      .FavouriteListImage[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                              width:
                                  8.0), // Add some spacing between the image and text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _favouriteController.FavouriteListName[index],
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Rating: ",
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    Text(
                                      _favouriteController
                                          .FavouriteListRating[index],
                                      style: GoogleFonts.aBeeZee(
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                       

                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _favouriteController.RemovefromFav(
                                    _favouriteController
                                        .FavouriteListName[index],
                                    _favouriteController
                                        .FavouriteListImage[index],
                                    _favouriteController
                                        .FavouriteListRating[index],
                                  );
                                },
                                icon: const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            )));
  }
}
