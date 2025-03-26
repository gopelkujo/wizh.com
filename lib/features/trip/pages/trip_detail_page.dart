import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class TripDetailPage extends StatelessWidget {
  /// Store data id value.
  final String id;

  const TripDetailPage({super.key, required this.id});

  static const List<String> imageUrls = [
    'https://picsum.photos/800/400',
    'https://picsum.photos/801/401',
    'https://picsum.photos/802/402',
    'https://picsum.photos/803/403',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildPhotos(),
              _buildInformation(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigation(context),
    );
  }

  Container _buildBottomNavigation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, spreadRadius: 1, blurRadius: 2)
        ],
        color: Theme.of(context).cardColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Text.rich(
              TextSpan(children: [
                TextSpan(
                  text: 'Mulai dari\n',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                TextSpan(
                  text: 'IDR 12.000.000\n',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                ),
                TextSpan(text: '/kamar/malam')
              ]),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('Lihat Kamar', style: TextStyle(fontSize: 16)),
          ),
        ],
      ),
    );
  }

  Padding _buildInformation() {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Chip(label: Text('Resort')),
              SizedBox(width: 8),
              Text('⭐⭐⭐'),
              Spacer(),
              Text('Sering penuh', style: TextStyle(color: Colors.red)),
            ],
          ),
          SizedBox(height: 8),
          Text(
            'Kadena Glamping Dive Resort',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text('4.6/5 ', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('(754 Review) · Anyer, Serang')
            ],
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.purple.shade50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(Icons.thumb_up, color: Colors.purple),
                SizedBox(width: 8),
                Expanded(child: Text('Pas buat pencinta wisata alam')),
              ],
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _buildPhotos() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageUrls.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrls[index],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width * 0.8,
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
              ),
            ),
          );
        },
      ),
    );
  }
}
