import 'package:flutter/cupertino.dart';

enum SortState { atoZ, ztoA, asc, dsc, none }

@immutable
abstract class WatchlistEvent {}

class FetchContactData extends WatchlistEvent {}

class SortDataEvent extends WatchlistEvent {
  final SortState sortState;
  final bool isFirstTime;
  SortDataEvent(this.sortState, this.isFirstTime);
}

class FetchContactDataAtoZ extends WatchlistEvent {}

class FetchContactDataZtoA extends WatchlistEvent {}

class FetchContactData1to9 extends WatchlistEvent {}

class FetchContactData9to1 extends WatchlistEvent {}

class SortUpdated extends WatchlistEvent {}
