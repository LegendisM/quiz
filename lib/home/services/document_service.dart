import 'package:quiz/home/models/document_model.dart';
import 'package:quiz/home/services/storage_service.dart';
import 'package:quiz/home/services/location_service.dart';
// import 'package:quiz/home/utils/date_converter.dart';
// import 'package:quiz/home/utils/multiplication.dart';

class DocumentService {
  late DocumentModel currentDocumentModel;
  StorageService storageService = StorageService();
  LocationService locationService = LocationService();

  DocumentService() {
    currentDocumentModel = DocumentModel();
  }

  void create() {
    // check Has Permission To Get Directory Path => if not => alert -> goto settings for get this
  }

  void load() {
    // check Has Permission To Get Directory Path => if not => alert -> goto settings for get this
  }
}
