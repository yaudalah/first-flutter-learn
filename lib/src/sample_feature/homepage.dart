import 'package:flutter/material.dart';
import 'package:flutter_application_learn/src/sample_feature/banner.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_isSearching
            ? const Text("HomePage")
            : TextField(
                decoration: InputDecoration(
                  isDense: true,
                  prefixIcon: Icon(Icons.search, color: Colors.black12),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                  hintText: "Cari di Yoman",
                  hintStyle: TextStyle(color: Colors.black12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black12, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide:
                        BorderSide(color: Colors.red.shade100, width: 2.0),
                  ),
                ),
                style: TextStyle(color: Colors.black87),
              ),
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
      ),
      body: ListView.builder(
        restorationId: 'sampleItemListView',
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            // Return the banner widget for the first item
            return BannerWidget(
              imageUrl: 'assets/images/foye.png',
              title: 'Welcome to Our App',
            );
          }
          final item = items[index - 1];
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
      bottomNavigationBar: BottomAppBar(
        shape:
            CircularNotchedRectangle(), // Optional: adds a notch for a floating action button.
        child: SizedBox(
          height: 60.0,
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
}
