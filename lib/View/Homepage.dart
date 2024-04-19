import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_apis_app/View/favscreen.dart';
import 'package:movies_apis_app/Model/FetchModel.dart';
import 'package:movies_apis_app/constants/constants.dart';
import 'package:movies_apis_app/services/Apiservices.dart';
import 'package:movies_apis_app/Get/FavouriteController.dart';
import 'package:movies_apis_app/constants/carouselslider.dart';

class MyHomePage extends StatelessWidget {
  final FavouriteController _favouriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    var heiight = ScreenSize.screenHeight(context);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ScreenSize.screenWidth(context) * .2,
        leadingWidth: double.infinity,
        leading: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 00,
                ),
                child: SizedBox(
                  height: ScreenSize.screenWidth(context) * .15,
                  child: Image.asset(
                    'assets/images/net.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Favscreen()),
                  );
                },
                icon: Icon(
                  Icons.favorite,
                ),
              ),
            ),
            Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              child: // Inside MyHomePage widget
                  IconButton(
                onPressed: () {
                  _favouriteController.toggleTheme();
                },
                icon: Icon(
                  _favouriteController.isBright.value
                      ? Icons.light_mode
                      : Icons.dark_mode,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: ListView(
              children: [
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                Text(
                  'Trending Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: ScreenSize.screenWidth(context) * .05,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                InkWell(
                  onTap: () {},
                  child: MyCarouselSlider(
                    heiight: heiight * .4,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    aspectRatio: 1.5,
                    viewportFraction: .55,
                    instancee: FetchData.instance.TopradedApisMovie(),
                    enableInfiniteScroll: true,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                Text(
                  'Upcoming Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: ScreenSize.screenWidth(context) * .05,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                MyCarouselSlider(
                  heiight: heiight * .25,
                  enlargeCenterPage: false,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: .5,
                  instancee: FetchData.instance.UpconingApisMovies(),
                  enableInfiniteScroll: true,
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                Text(
                  'Popular Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: ScreenSize.screenWidth(context) * .05,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                MyCarouselSlider(
                  heiight: heiight * .25,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  instancee: FetchData.instance.PopularMoviesApi(),
                  enableInfiniteScroll: true,
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                Text(
                  'TopRated Movies',
                  style: GoogleFonts.aBeeZee(
                    fontSize: ScreenSize.screenWidth(context) * .05,
                  ),
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
                MyCarouselSlider(
                  heiight: heiight * .25,
                  enlargeCenterPage: false,
                  autoPlay: false,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.5,
                  instancee: FetchData.instance.TrendingMovieesApi(),
                  enableInfiniteScroll: true,
                ),
                SizedBox(
                  height: ScreenSize.screenHeight(context) * .02,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
