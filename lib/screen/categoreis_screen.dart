import 'package:filter_old/model/contact_data_model.dart';
import 'package:filter_old/widget/contact_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  List<Contact> data;
  CategoriesScreen({Key? key, required this.data}) : super(key: key);

  @override
  State<CategoriesScreen> createState() {
    return _CategoriesScreenState(data);
  }
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<Contact> data;

  _CategoriesScreenState(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: listItem(context, data),
          ),
        ));
  }
}
