import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ShimmerEffetct extends StatelessWidget {
  const ShimmerEffetct({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.0,
      height: 100.0,
      child: Shimmer.fromColors(
          baseColor: Colors.black54,
          highlightColor: Colors.white60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 50,
                    width: 50,
                    color: Colors.amber,
                  )),
              SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 20,
                      width: double.infinity,
                      color: Colors.amber,
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
