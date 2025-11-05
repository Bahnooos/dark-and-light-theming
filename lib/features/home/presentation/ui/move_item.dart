import 'package:cached_network_image/cached_network_image.dart';
import 'package:dark_and_light_theming/core/networking/api_constants.dart';
import 'package:dark_and_light_theming/features/home/data/models/moves_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoveItem extends StatelessWidget {
  const MoveItem({super.key, required this.results});
  final Results results;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CachedNetworkImage(
        imageUrl: "${ApiConstants.imageBaseUrl}${results.image}",
        placeholder: (context, url) => CircularProgressIndicator(),
      ),
      title: Column(
        children: [
          Text(results.title ?? ''),
          4.verticalSpace,
          Text(results.rate?.toString() ?? '0'),
        ],
      ),
    );
  }
}
