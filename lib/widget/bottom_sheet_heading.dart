import 'package:filter_old/bloc/sorting_bloc/bloc/sorting_bloc_bloc.dart';
import 'package:filter_old/bloc/watchlist_bloc.dart';
import 'package:filter_old/src/string.dart';
import 'package:flutter/material.dart';

class BottomSheetHeading extends StatelessWidget {
  final WatchlistBloc contactBloc;
  final SortingBloc sortBloc;
  const BottomSheetHeading({
    Key? key,
    required this.contactBloc,
    required this.sortBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Text(Strings.sorting,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          )),
      trailing: TextButton(
        key: const ValueKey('Done'),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text(
          Strings.done,
          style: TextStyle(
            color: Theme.of(context).textSelectionTheme.selectionColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
