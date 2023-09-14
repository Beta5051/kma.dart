import 'package:kma/kma.dart';
import 'package:kma/models.dart';

Future<void> main() async {
  final kma = KmaClient(serviceKey: 'YOUR_SERVICE_KEY');
  final data = await kma.vilageFcstInfoService.getFcstVersion(
    fileType: FileType.odam,
    baseDateTime: DateTime(2023, 9, 14, 8),
  );
  print(data);
}
