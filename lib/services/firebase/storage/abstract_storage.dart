import 'package:flutter/foundation.dart';

abstract class StorageInterface {
  Future<dynamic> uploadTask({
    @required String itemPath,
    @required List<int> content,
  });

  Future<dynamic> downloadTask(
  {@required String itemPath}

      );

  Future<dynamic> deleteTask({@required String itemPath});
}
