import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wizhdotcom/features/trip/models/trip_model.dart';
import 'package:wizhdotcom/features/trip/pages/trip_detail_page.dart';
import 'package:wizhdotcom/shared/utils/string_utils.dart';

class TripWidget extends StatelessWidget {
  ///  Store trip data.
  final TripModel data;

  const TripWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        border: Border.all(color: theme.primaryColorLight),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      clipBehavior: Clip.hardEdge,
      child: TextButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TripDetailPage(id: data.id)),
        ),
        style: TextButton.styleFrom(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          shape: BeveledRectangleBorder(),
          foregroundColor: Colors.black87,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildImage(),
            _buildInformation(theme),
          ],
        ),
      ),
    );
  }

  Expanded _buildInformation(ThemeData theme) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4),
        child: Column(
          spacing: 4,
          children: [
            _buildTitle(),
            _buildReview(theme),
            _buildPrice(),
          ],
        ),
      ),
    );
  }

  Expanded _buildPrice() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          StringUtils.currency(data.price!),
          style: TextStyle(
            color: Colors.green.shade600,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Row _buildReview(ThemeData theme) {
    return Row(
      children: [
        Row(
          children: [
            Icon(Icons.star_rounded, color: theme.primaryColor, size: 16),
          ],
        ),
        Text(
          '${data.ratings}',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Text _buildTitle() {
    return Text(
      '${data.title}',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
    );
  }

  Image _buildImage() {
    return Image.network(
      data.photo!,
      height: 100,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;

        return Shimmer.fromColors(
          baseColor: Colors.grey.shade200,
          highlightColor: Colors.white,
          child: Container(
            width: double.infinity,
            height: 80,
            color: Colors.grey.shade200,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          'assets/images/no_image.jpg',
          height: 80,
          fit: BoxFit.cover,
        );
      },
    );
  }
}
