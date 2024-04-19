import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:movies_apis_app/View/Homepage.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_apis_app/Model/FetchModel.dart';
import 'package:movies_apis_app/View/DetailedScreen.dart';
import 'package:movies_apis_app/constants/constants.dart';
import 'package:movies_apis_app/services/Apiservices.dart';
import 'package:movies_apis_app/constants/shimmerEffect.dart';

class MyCarouselSlider extends StatefulWidget {
  final double heiight;
  final bool? enlargeCenterPage;
  final bool autoPlay; // Use lowercase for autoPlay
  final double viewportFraction;
  final double? aspectRatio;
  final Future<FetchDAtaModel>? instance;
  final bool enableInfiniteScroll;
  MyCarouselSlider({
    Key? key,
    required this.heiight,
    this.enlargeCenterPage,
    this.autoPlay = true,
    required this.aspectRatio,
    required this.viewportFraction,
    required Future<FetchDAtaModel> instancee,
    required this.enableInfiniteScroll,
  })  : instance = instancee, // Assign the value of instancee to instance
        super(key: key);

  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: widget.instance,
          builder: (context, AsyncSnapshot<FetchDAtaModel> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (!snapshot.hasData) {
                return const Center(
                  child:CircularProgressIndicator(),
                );
              } else {
                return Container(
                  height: widget.heiight,
                  width: double.infinity,
                  child: CarouselSlider.builder(
                    itemCount: snapshot.data!.results!.length,
                    options: CarouselOptions(
                      height: widget.heiight * 35,
                      enlargeCenterPage: widget.enlargeCenterPage,
                      initialPage: 0,
                      autoPlay: widget.autoPlay,
                      aspectRatio: 16 / 9,
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enableInfiniteScroll: widget.enableInfiniteScroll,
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      viewportFraction: widget.viewportFraction,
                    ),
                    itemBuilder: (context, index, _) {
                      int adjustedIndex =
                          (index + snapshot.data!.results!.length) %
                              snapshot.data!.results!.length;
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: SizedBox(
                                  height: double.infinity,
                                  width: double.infinity,
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              MovieDetailsScreen(
                                            posterImage:
                                                'https://image.tmdb.org/t/p/w500/${snapshot.data!.results![adjustedIndex].posterPath.toString()}',
                                            MovieName: snapshot.data!
                                                .results![adjustedIndex].title
                                                .toString(),
                                            Language: snapshot
                                                .data!
                                                .results![adjustedIndex]
                                                .originalLanguage
                                                .toString(),
                                            release: snapshot
                                                .data!
                                                .results![adjustedIndex]
                                                .releaseDate,
                                            origTitle: snapshot
                                                .data!
                                                .results![adjustedIndex]
                                                .originalTitle,
                                            rating: snapshot
                                                .data!
                                                .results![adjustedIndex]
                                                .voteAverage
                                                .toString(),
                                            overview: snapshot
                                                .data!
                                                .results![adjustedIndex]
                                                .overview,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Image.network(
                                        fit: BoxFit.cover,
                                        filterQuality: FilterQuality.high,
                                        'https://image.tmdb.org/t/p/w500/${snapshot.data!.results![adjustedIndex].posterPath.toString()}'),
                                  ))),
                        ),
                      );
                    },
                  ),
                );
              }
            }
            return const ShimmerEffetct();
          },
        ),
      ],
    );
  }
}
