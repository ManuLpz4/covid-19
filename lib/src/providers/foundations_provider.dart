import 'dart:async';

import 'package:covid_19/src/models/foundation.dart';
import 'package:covid_19/src/services/foundations_service.dart';

class FoundationsProvider {
  FoundationsProvider() {
    fetchFoundations();
  }

  FoundationsService _foundationsService = FoundationsService();
  final StreamController<List<Foundation>> _foundationsStreamController =
      StreamController<List<Foundation>>();

  Stream<List<Foundation>> get foundationStream =>
      _foundationsStreamController.stream.asBroadcastStream();

  Future<void> fetchFoundations() async {
    try {
      _foundationsStreamController.add(
        await _foundationsService.fetchFoundations(),
      );
    } catch (e) {
      rethrow;
    }
    return _foundationsStreamController.stream != null;
  }

  void dispose() => _foundationsStreamController.close();
}
