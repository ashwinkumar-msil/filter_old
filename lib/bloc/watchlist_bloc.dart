import 'dart:math';

import 'package:equatable/equatable.dart';

import 'package:filter_old/model/contact_data_model.dart';
import 'package:filter_old/service/contactrespo.dart';

import 'watchlist_event.dart';
import 'package:bloc/bloc.dart';

part 'watchlist_state.dart';

class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  ContactService contactRepo = ContactService();
  late List<Contact> data;

  WatchlistBloc() : super(WatchlistInitial()) {
    on<WatchlistEvent>((event, emit) async {
      if (event is FetchContactData) {
        emit(Contactblocloading());
        try {
          data = await contactRepo.fetchContact();

          emit(ContactFetchData(contacts: data));
        } catch (exception) {
          emit(ContactError(msg: exception.toString()));
        }
      }

      if (event is SortDataEvent) {
        if (event.isFirstTime) {
          emit(Contactblocloading());
          emit(ContactFetchData(contacts: data));
        } else if (event.sortState == SortState.asc) {
          emit(Contactblocloading());
          emit(ContactFetchData(contacts: data));
        }
      }
      if (event is FetchContactDataAtoZ) {
        data.sort((a, b) => a.id.compareTo(b.id));
        emit(Contactblocloading());

        emit(SortData(contacts: data));
      } else if (event is FetchContactDataZtoA) {
        data.sort((a, b) => b.id.compareTo(a.id));
        emit(Contactblocloading());
        emit(SortData(contacts: data));
      } else if (event is FetchContactData1to9) {
        data.sort((a, b) => a.contacts.compareTo(b.contacts));
        emit(Contactblocloading());
        emit(SortData(contacts: data));
      } else if (event is FetchContactData9to1) {
        data.sort((a, b) => b.contacts.compareTo(a.contacts));
        emit(Contactblocloading());
        emit(SortData(contacts: data));
      }
    });
  }
}
