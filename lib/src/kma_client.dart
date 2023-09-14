import 'package:http/http.dart' as http;

import 'services/services.dart';

class KmaClient {
  final VilageFcstInfoServiceClient vilageFcstInfoService;

  KmaClient({
    required String serviceKey,
    http.Client? httpClient,
  }) : vilageFcstInfoService = VilageFcstInfoServiceClient(
          serviceKey: serviceKey,
          httpClient: httpClient,
        );
}
