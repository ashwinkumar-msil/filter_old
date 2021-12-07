part of 'sorting_bloc_bloc.dart';

@immutable
abstract class SortingEvent {}

// ignore: must_be_immutable
class SortingTypeButtonClickEvent extends SortingEvent {
  String btnText;
  SortingTypeButtonClickEvent(this.btnText);
}

// ignore: must_be_immutable
class SortingDoneBtnActionEvent extends SortingEvent {
  String btnText;
  List<Contact> contactList;
  SortingDoneBtnActionEvent({required this.btnText, required this.contactList});
}
