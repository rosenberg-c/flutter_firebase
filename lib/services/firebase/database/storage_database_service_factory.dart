import 'databases/storages/abstract_storage_database.dart';
import 'databases/storages/storage_database.dart';

class StorageDatabaseServiceFactory {
  StorageDatabase _instance;

  StorageDatabase _factory() {
    if (_instance == null) {
      _instance = StorageDatabase();
      return _instance;
    }
    return _instance;
  }

  StorageDatabaseInterface get instance {
    return _factory();
  }
}
