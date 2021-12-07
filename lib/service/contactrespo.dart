import 'package:filter_old/model/contact_data_model.dart';
import 'package:filter_old/service/network.dart';
import 'package:filter_old/src/string.dart';

class ContactService {
  Future<List<Contact>> fetchContact() async {
    ApiNetwork network = ApiNetwork();
    final response = await network.get(Strings.contactUrl);
    var contactdata = contactFromJson(response);
    return contactdata;
  }
}
