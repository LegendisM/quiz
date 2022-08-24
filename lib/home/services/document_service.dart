import 'package:quiz/home/models/document_model.dart';
import 'package:quiz/home/services/storage_service.dart';
import 'package:quiz/home/services/location_service.dart';
import 'package:quiz/home/services/gyroscope_service.dart';

class DocumentService {
  late DocumentModel currentDocumentModel;
  late DocumentModel secondaryDocumentModel;
  StorageService storageService = StorageService();
  LocationService locationService = LocationService();
  GyroscopeService gyroscopeService = GyroscopeService();

  DocumentService() {
    currentDocumentModel = DocumentModel();
    secondaryDocumentModel = DocumentModel();
  }

  Future<String> create() async {
    if (currentDocumentModel.validator() == false) {
      return "لطفا فرم مورد نظر را تکمیل کنید.";
    }
    List<String> locationResult = await locationService.getLocation();
    if (locationResult.length == 2) {
      currentDocumentModel.longitude = locationResult[0];
      currentDocumentModel.latitude = locationResult[1];
      currentDocumentModel.direction = gyroscopeService.direction;
    } else {
      return locationResult[0];
    }
    var fileContent = currentDocumentModel.getExport();
    await storageService.saveFile(currentDocumentModel.filePath!, fileContent);
    return "عملیات با موفقیت انجام شد";
  }

  Future<String> load() async {
    try {
      String selectedPath = secondaryDocumentModel.filePath!;
      var json = await storageService.loadFile(selectedPath);
      secondaryDocumentModel.fromJson(json);
      return "عملیات با موفقیت انجام شد";
    } catch (e) {
      return "مشکلی پیش آمده است ، فایل یافت نشد . . .";
    }
  }
}
