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
    if (currentDocumentModel.validator() == false) {
      return "لطفا فرم مورد نظر را تکمیل کنید.";
    }
    List<String> locationResult = await locationService.getLocation();
    if (locationResult.length == 2) {
      currentDocumentModel.longitude = locationResult[0];
      currentDocumentModel.latitude = locationResult[1];
    } else {
      return locationResult[0];
    }
    Map<String, dynamic> fileContent = currentDocumentModel.getExport();
    await storageService.saveFile(currentDocumentModel.filePath!, fileContent);
    return "عمیلات با موفقیت انجام شد";
  }
}
