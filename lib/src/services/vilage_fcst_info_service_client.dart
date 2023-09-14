import 'package:intl/intl.dart';

import 'service_base_client.dart';
import 'service_response.dart';
import '../models/models.dart';

class VilageFcstInfoServiceClient extends ServiceBaseClient {
  @override
  String get serviceUrl =>
      'http://apis.data.go.kr/1360000/VilageFcstInfoService_2.0';

  VilageFcstInfoServiceClient({
    required super.serviceKey,
    super.httpClient,
  });

  Future<ServiceResponse<UltraSrtNcst>> getUltraSrtNcst({
    int numOfRows = 10,
    int pageNo = 1,
    required DateTime baseDateTime,
    required (int nx, int ny) position,
  }) async {
    final response = await call(
      '/getUltraSrtNcst',
      UltraSrtNcst.fromXmlElement,
      numOfRows: numOfRows,
      pageNo: pageNo,
      params: {
        'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
        'base_time': DateFormat('HHmm').format(baseDateTime),
        'nx': position.$1.toString(),
        'ny': position.$2.toString(),
      },
    );

    return response;
  }

  Future<ServiceResponse<UltraSrtFcst>> getUltraSrtFcst({
    int numOfRows = 10,
    int pageNo = 1,
    required DateTime baseDateTime,
    required (int nx, int ny) position,
  }) async {
    final response = await call(
      '/getUltraSrtFcst',
      UltraSrtFcst.fromXmlElement,
      numOfRows: numOfRows,
      pageNo: pageNo,
      params: {
        'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
        'base_time': DateFormat('HHmm').format(baseDateTime),
        'nx': position.$1.toString(),
        'ny': position.$2.toString(),
      },
    );

    return response;
  }

  Future<ServiceResponse<VilageFcst>> getVilageFcst({
    int numOfRows = 10,
    int pageNo = 1,
    required DateTime baseDateTime,
    required (int nx, int ny) position,
  }) async {
    final response = await call(
      '/getVilageFcst',
      VilageFcst.fromXmlElement,
      params: {
        'base_date': DateFormat('yyyyMMdd').format(baseDateTime),
        'base_time': DateFormat('HHmm').format(baseDateTime),
        'nx': position.$1.toString(),
        'ny': position.$2.toString(),
      },
    );

    return response;
  }

  Future<ServiceResponse<FcstVersion>> getFcstVersion({
    int numOfRows = 10,
    int pageNo = 1,
    required FileType fileType,
    required DateTime baseDateTime,
  }) async {
    final response = await call(
      '/getFcstVersion',
      FcstVersion.fromXmlElement,
      params: {
        'ftype': fileType.toString(),
        'basedatetime': DateFormat('yyyyMMddHHmm').format(baseDateTime),
      },
    );

    return response;
  }
}
