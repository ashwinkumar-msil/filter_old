import 'package:filter_old/bloc/theme/theme_bloc.dart';
import 'package:filter_old/bloc/watchlist_bloc.dart';
import 'package:filter_old/bloc/watchlist_event.dart';
import 'package:filter_old/model/contact_data_model.dart';
import 'package:filter_old/src/string.dart';
import 'package:filter_old/widget/changethemebutton.dart';
import 'package:filter_old/widget/filter_bottomsheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'categoreis_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({Key? key}) : super(key: key);

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  WatchlistBloc watchlistBloc = WatchlistBloc();
  ThemeBloc themeBloc = ThemeBloc();
  bool isLightTheme = false;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    watchlistBloc.add(FetchContactData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => watchlistBloc,
      child: DefaultTabController(
        length: Strings.name.length,
        child: Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: AppBar(
            actions: [const ThemeSelector(), FilterbottomSheet(watchlistBloc)],
            title: const Text(
              Strings.title,
              style: TextStyle(fontSize: 20),
            ),
            bottom: TabBar(
              controller: _tabController,
              indicatorWeight: 4.0,
              indicatorColor: Colors.blue,
              tabs: Strings.name,
            ),
          ),
          body: BlocBuilder<WatchlistBloc, WatchlistState>(
            builder: (context, state) {
              List<Contact> contactdata;

              if (state is Contactblocloading) {
                return const Text(Strings.loading);
              } else if (state is ContactFetchData) {
                contactdata = state.contacts;
                if (contactdata == []) {
                  return const Text(Strings.loading);
                } else {
                  return listpage(contactdata);
                }
              } else if (state is SortData) {
                List<Contact> contactdata = state.contacts;
                if (contactdata == []) {
                  return const Text(Strings.loading);
                } else {
                  return listpage(contactdata);
                }
              } else if (state is ContactError) {
                return const Text(Strings.unknownError);
              } else {
                return const Text(Strings.unknownError);
              }
            },
          ),
        ),
      ),
    );
  }

  TabBarView listpage(List<Contact> contactdata) {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        CategoriesScreen(data: contactdata.sublist(0, 25)),
        CategoriesScreen(data: contactdata.sublist(25, 50)),
        CategoriesScreen(data: contactdata.sublist(50, 75)),
        CategoriesScreen(data: contactdata.sublist(75)),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    watchlistBloc.close();
  }
}
