import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wizhdotcom/features/trip/models/trip_model.dart';
import 'package:wizhdotcom/features/trip/pages/trip_detail_page.dart';

class TripWidget extends StatelessWidget {
  ///  Store trip data.
  final TripModel data;

  const TripWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return OutlinedButton(
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TripDetailPage(id: data.id)),
      ),
      style: OutlinedButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: Size.zero,
        padding: EdgeInsets.zero,
        side: BorderSide(color: theme.primaryColor),
      ),
      clipBehavior: Clip.hardEdge,
      child: SizedBox(
        width: 300,
        height: 500,
        child: Column(
          spacing: 16,
          children: [
            if (data.photo == null) ...[
              Image.asset(
                'assets/images/no_image.jpg',
                height: 200,
                fit: BoxFit.cover,
              ),
            ] else ...[
              Image.network(
                data.photo!,
                height: 200,
                fit: BoxFit.fitHeight,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;

                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade200,
                    highlightColor: Colors.white,
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: Colors.grey.shade200,
                    ),
                  );
                },
              ),
            ],
            Text('${data.title}'),
            Text('${data.ratings}'),
            Text('${data.price}'),
          ],
        ),
      ),
    );
  }
}
