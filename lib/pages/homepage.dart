import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_learn/src/sample_feature/banner.dart';
import 'package:geolocator/geolocator.dart';

import '../src/settings/settings_view.dart';
import '../src/sample_feature/sample_item.dart';
import '../src/sample_feature/sample_item_details_view.dart';

/// Displays a list of SampleItems.
class HomepageView extends StatefulWidget {
  const HomepageView({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
  static const routeName = '/';
}

class _HomeScreenState extends State<HomepageView> {
  List<SampleItem> items = const [
    SampleItem(1),
    SampleItem(2),
    SampleItem(3),
    SampleItem(4)
  ];
  bool _isSearching = true;

  void getLocation() async {
    await Geolocator.checkPermission();
    await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    print("POSITION: ${position.toString()}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: ListView(children: [
        const SizedBox(height: 20),
        _categorySection(),
        const SizedBox(height: 20),
        _getLocation(),
        const SizedBox(height: 20),
        _listItems(),
      ]),
      bottomNavigationBar: BottomAppBar(
        shape:
            CircularNotchedRectangle(), // Optional: adds a notch for a floating action button.
        child: SizedBox(
          height: 40.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home_outlined,
                  size: 30,
                ),
                onPressed: () {
                  // Handle menu button action
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.account_circle_outlined,
                  size: 30,
                ),
                onPressed: () {
                  // Handle menu button action
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.thumb_up_alt_outlined,
                  size: 30,
                ),
                onPressed: () {
                  // Handle menu button action
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.settings,
                  size: 30,
                ),
                onPressed: () {
                  // Handle menu button action
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Column _getLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: getLocation,
            child: const Text('Get Location'),
          ),
        )
      ],
    );
  }

  Column _listItems() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'List',
            style: TextStyle(
                color: Colors.red[300],
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: SizedBox(
            height: 200,
            child: ListView.builder(
              restorationId: 'sampleItemListView',
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ListTile(
                  title: Text('SampleItem ${item.id}'),
                  leading: const CircleAvatar(
                    foregroundImage:
                        AssetImage('assets/images/banana-cat-crying.png'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                    );
                  },
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Column _categorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BannerWidget(),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Category',
            style: TextStyle(
                color: Colors.red[300],
                fontSize: 18,
                fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: ListView.separated(
              itemCount: items.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) => SizedBox(width: 25),
              padding: EdgeInsets.only(left: 20, right: 20),
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.red.shade300.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10)),
                );
              }),
        )
      ],
    );
  }

  AppBar appBar(BuildContext context) {
    return AppBar(
      leading: Container(
        alignment: Alignment.centerRight,
        child: Icon(
          Icons.wine_bar_outlined,
          size: 35,
        ),
      ),
      title: _searchField(),
      // backgroundColor: Colors.white,
      actions: [
        IconButton(
          icon: const Icon(
            Icons.mail_outline,
          ),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
        IconButton(
          icon: const Icon(Icons.shop_2_outlined),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
        IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.restorablePushNamed(context, SettingsView.routeName);
          },
        ),
      ],
    );
  }

  Widget _searchField() {
    return !_isSearching
        ? const Text("HomePage")
        : TextField(
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              // fillColor: Colors.white,
              contentPadding: EdgeInsets.all(10),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: Icon(Icons.search, color: Colors.black12),
              ),
              hintText: "Search here",
              hintStyle: TextStyle(color: Colors.black12, fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black12, width: 1.0),
              ),
              // enabledBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Colors.grey, width: 1.0),
              // ),
              // focusedBorder: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(10),
              //   borderSide: BorderSide(color: Colors.red.shade100, width: 2.0),
              // ),
            ),
            style: TextStyle(color: Colors.black87),
          );
  }
}
