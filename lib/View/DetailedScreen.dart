import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_apis_app/constants/constants.dart';
import 'package:movies_apis_app/Get/FavouriteController.dart';

class MovieDetailsScreen extends StatefulWidget {
  final String? posterImage,
      MovieName,
      Language,
      release,
      origTitle,
      rating,
      overview;

  MovieDetailsScreen({
    this.posterImage,
    this.MovieName,
    this.Language,
    this.release,
    this.origTitle,
    this.rating,
    this.overview,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final FavouriteController _favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(    toolbarHeight: 40,elevation: 0, leading: BackButton(),),
      body: SafeArea(
        child:
      LayoutBuilder(builder: (context,constraints){
       
          return    ListView(
          children: [
            Container(
              height:constraints.maxWidth<=400? MediaQuery.of(context).size.height * 0.7:MediaQuery.of(context).size.height * .6,
              width: double.infinity,
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal:constraints.maxWidth<=400? MediaQuery.of(context).size.width * 0.0:MediaQuery.of(context).size.width * .4, ),
                child: Image.network(
                  widget.posterImage.toString(),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.MovieName?.toString() ?? 'N/A',
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.release?.toString() ?? 'N/A',
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      Text(
                        (widget.rating != null &&
                                double.tryParse(widget.rating.toString()) !=
                                    null
                            ? double.parse(widget.rating.toString())
                                .toStringAsFixed(1)
                            : 'N/A'),
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          if (_favouriteController.isFavorite.value) {
                            _favouriteController.RemovefromFav(
                              widget.MovieName.toString(),
                              widget.posterImage.toString(),
                              widget.rating,
                            );
                            _favouriteController.isFavorite.value = false;
                            Get.snackbar(
                              'Success',
                              ' removed from Fav',
                              duration: Duration(seconds: 1),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          } else {
                            _favouriteController.addToFavList(
                              widget.MovieName.toString(),
                              widget.posterImage.toString(),
                              widget.rating,
                            );
                            Get.snackbar(
                              'Success',
                              ' added to Fav',
                              duration: Duration(seconds: 1),
                              snackPosition: SnackPosition.BOTTOM,
                            );
                            _favouriteController.isFavorite.value = true;
                          }
                        },
                        icon: _favouriteController.FavouriteListImage
                                .contains(widget.posterImage)
                            ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                            : Icon(
                                Icons.favorite_outline,
                                // color: Colors.white,
                              ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Overview',
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w500,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.overview?.toString() ?? 'N/A',
                    style: GoogleFonts.aBeeZee(
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
        
      })
      ),
    );
  }
}
