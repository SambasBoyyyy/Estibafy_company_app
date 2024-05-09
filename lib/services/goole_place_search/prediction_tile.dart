import 'package:flutter/material.dart';

import 'google_places_web.dart';

class SearchResultsTile extends StatelessWidget {
  final Address addressData;
  final Function(Address) callback;
  final Map<String, String> address;
  SearchResultsTile(
      {required this.addressData,
      required this.callback,
      required this.address});
  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          '${addressData.name}',
          style: TextStyle(fontSize: 16),
        ),
        dense: true,
        onTap: () {
          callback(addressData);
        });
  }
}
