import 'package:get_it/get_it.dart';

import 'database/sqlite/dao/contact_dao_impl.dart';
import 'domain/interfaces/contact_dao.dart';

setupInjection(){
  GetIt getit = GetIt.I;

  getit.registerSingleton<ContactDAO>(ContactDAOImpl());
}