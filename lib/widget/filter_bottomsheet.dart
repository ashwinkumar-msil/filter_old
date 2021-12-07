import 'package:filter_old/bloc/watchlist_bloc.dart';
import 'package:filter_old/bloc/watchlist_event.dart';
import 'package:filter_old/src/string.dart';
import 'package:flutter/material.dart';

class FilterbottomSheet extends StatelessWidget {
  WatchlistBloc watchlistBloc;
  FilterbottomSheet(
    this.watchlistBloc, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        showModalBottomSheet<void>(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          enableDrag: true,
          builder: (BuildContext context) {
            return filter(context);
          },
        );
      },
      icon: const ButtonBar(
        children: [Icon(Icons.sort)],
      ),
    );
  }

  Container filter(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          color: Theme.of(context).bottomAppBarColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).canvasColor,
              offset: const Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ]),
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 15),
                child: const Text(
                  'Sort',
                  style: TextStyle(
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                  padding: const EdgeInsets.only(left: 15),
                  child: TextButton(
                    onPressed: () {
                      watchlistBloc.add(SortDataEvent(SortState.asc, false));
                    },
                    child: const Text('Done'),
                  )),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(Strings.alphabeticlly),
              ElevatedButton(
                  onPressed: () {
                    watchlistBloc.add(FetchContactDataAtoZ());
                    Navigator.pop(context);
                  },
                  key: const ValueKey('alphabeticASC'),
                  child: const Text(Strings.a2z)),
              ElevatedButton(
                  onPressed: () {
                    watchlistBloc.add(FetchContactDataZtoA());
                    Navigator.pop(context);
                  },
                  key: const ValueKey('alphabeticDSC'),
                  child: const Text(Strings.z2a)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text(Strings.userid),
              ElevatedButton(
                  onPressed: () {
                    watchlistBloc.add(FetchContactData1to9());
                    Navigator.pop(context);
                  },
                  key: const ValueKey('numericIncresing'),
                  child: const Text(Strings.increasingorder)),
              ElevatedButton(
                  onPressed: () {
                    watchlistBloc.add(FetchContactData9to1());
                    Navigator.pop(context);
                  },
                  key: const ValueKey('numericDecresing'),
                  child: const Text(Strings.decreasingorder)),
            ],
          ),
        ],
      ),
    );
  }
}
