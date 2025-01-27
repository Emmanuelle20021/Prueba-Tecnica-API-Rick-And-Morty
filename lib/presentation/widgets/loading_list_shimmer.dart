import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListShimmer extends StatelessWidget {
  const LoadingListShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: Colors.green[300]!,
          highlightColor: Colors.green[100]!,
          child: ListTile(
            title: Container(
              width: double.infinity,
              height: 10,
              color: Colors.white,
            ),
            subtitle: Container(
              width: 10,
              height: 8,
              color: Colors.white,
            ),
            leading: Container(
              width: 50,
              height: 50,
              color: Colors.white,
            ),
          ),
        );
      },
    );
  }
}
