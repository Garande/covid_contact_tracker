import 'dart:io';

import 'package:kopesha/providers/storageProvider.dart';

class StorageRepository {
  StorageProvider storageProvider = StorageProvider();

  Future<String> uploadImage(File file, String storagePath) =>
      storageProvider.uploadImage(file, storagePath);
}
