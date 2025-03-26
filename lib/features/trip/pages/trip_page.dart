import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:wizhdotcom/features/authentication/pages/login_page.dart';
import 'package:wizhdotcom/features/trip/models/trip_model.dart';
import 'package:wizhdotcom/features/trip/pages/widgets/trip_widget.dart';
import 'package:wizhdotcom/features/trip/services/trip_service.dart';

class TripPage extends StatelessWidget {
  const TripPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 32),
                child: FutureBuilder<List<TripModel>>(
                  future: TripService.get(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return _buildTripList(snapshot);
                    } else if (snapshot.hasError) {
                      return _buildError(snapshot);
                    }

                    return _buildLoadingShimmer();
                  },
                ),
              ),
              _buildFooter(),
            ],
          ),
        ),
      ),
    );
  }

  Align _buildFooter() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Row(
          spacing: 16,
          children: [
            Image.asset(
              'assets/images/github.png',
              width: 50,
              height: 50,
            ),
            Expanded(
              child: TextFormField(
                initialValue: 'https://github.com/gopelkujo/wizh.com',
                readOnly: true,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SingleChildScrollView _buildLoadingShimmer() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.white,
            child: Container(
              width: 300,
              height: 500,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Center _buildError(AsyncSnapshot<List<TripModel>> snapshot) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('${snapshot.error}'),
      ),
    );
  }

  SizedBox _buildTripList(AsyncSnapshot<List<TripModel>> snapshot) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: snapshot.data!.length,
        itemBuilder: (context, index) => TripWidget(
          data: snapshot.data![index],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Container(
        height: 40,
        alignment: Alignment.center,
        child: TextFormField(
          decoration: InputDecoration(
            hintText: 'Search your trip dream...',
            hintStyle: TextStyle(fontSize: 12),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColorLight,
              ),
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search_rounded,
            color: Theme.of(context).primaryColor,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (_) => false,
          ),
          icon: Icon(Icons.exit_to_app_rounded),
        ),
      ],
    );
  }
}
