import 'package:bloc/bloc.dart';
import 'package:filter_old/model/contact_data_model.dart';
import 'package:filter_old/src/string.dart';
import 'package:meta/meta.dart';
import '../../watchlist_bloc.dart';
part 'sorting_bloc_event.dart';
part 'sorting_bloc_state.dart';

class SortingBloc extends Bloc<SortingEvent, SortingBlocState> {
  WatchlistBloc contactBloc;

  SortingBloc(this.contactBloc) : super(SortingBlocInitial()) {
    on<SortingEvent>((event, emit) {
      if (event is SortingTypeButtonClickEvent) {
        emit(SortingTypeButtonClickState(event.btnText));
      } else if (event is SortingDoneBtnActionEvent) {
        sortContacts(event);
      }
    });
  }
  void sortContacts(SortingDoneBtnActionEvent event) {
    if (event.btnText == Strings.asc) {
      event.contactList
          .sort((a, b) => b.name.toLowerCase().compareTo(a.name.toLowerCase()));
    } else if (event.btnText == Strings.asc) {
      event.contactList
          .sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    } else if (event.btnText == Strings.asc) {
      event.contactList
          .sort((a, b) => int.parse(a.id).compareTo(int.parse(b.id)));
    } else if (event.btnText == Strings.asc) {
      event.contactList
          .sort((a, b) => int.parse(b.id).compareTo(int.parse(a.id)));
    }
    // contactBloc.add(SortContactEvent(
    //     listContacts: event.contactList, sortingStr: event.btnText));
  }
}
