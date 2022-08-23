import 'package:flutter/cupertino.dart';
import 'package:quiz/home/models/document_model.dart';
import 'package:quiz/home/services/storage_service.dart';
import 'package:quiz/home/services/location_service.dart';

class DocumentService {
  late DocumentModel currentDocumentModel;
  StorageService storageService = StorageService();
  LocationService locationService = LocationService();

  DocumentService() {
    currentDocumentModel = DocumentModel();
  }

  Future<String> create() async {
    List<String> locationResult = await locationService.getLocation();
    if (locationResult.length == 2) {
      currentDocumentModel.longitude = locationResult[0];
      currentDocumentModel.latitude = locationResult[1];
    } else {
      return locationResult[0];
    }
    String fileContent = currentDocumentModel.getExport().toString();
    debugPrint(fileContent);
    // call storage to create file with this content
    return "عمیلات با موفقیت انجام شد";
  }

  void load() async {
    // check Has Permission To Get Directory Path => if not => alert -> goto settings for get this
  }
}
