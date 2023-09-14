import 'package:http/http.dart' as http;
import 'package:xml/xml.dart';

import 'service_error.dart';
import 'service_response.dart';

abstract class ServiceBaseClient {
  String get serviceUrl;

  final String serviceKey;
  final http.Client _httpClient;

  ServiceBaseClient({
    required this.serviceKey,
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  Future<ServiceResponse<T>> call<T>(
    String path,
    T Function(XmlElement element) itemFromXmlElement, {
    int numOfRows = 10,
    int pageNo = 1,
    Map<String, dynamic> params = const {},
  }) async {
    final uri = Uri.parse(serviceUrl + path).replace(
      queryParameters: {
        'serviceKey': serviceKey,
        'numOfRows': numOfRows.toString(),
        'pageNo': pageNo.toString(),
        ...params.map((key, value) => MapEntry(key, value.toString())),
      },
    );

    final response = await _httpClient.get(uri);

    final document = XmlDocument.parse(response.body);

    final error = ServiceError.fromXml(document);
    if (error != null) throw error;

    return ServiceResponse.fromXml(document, itemFromXmlElement);
  }
}
