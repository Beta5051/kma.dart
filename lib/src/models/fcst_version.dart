import 'package:xml/xml.dart';

import 'file_type.dart';
import 'utils.dart';

class FcstVersion {
  final DateTime version;
  final FileType fileType;

  const FcstVersion({
    required this.version,
    required this.fileType,
  });

  factory FcstVersion.fromXmlElement(XmlElement element) {
    return FcstVersion(
      version: element.getDateTime('version'),
      fileType: element.getCategory(FileType.values),
    );
  }

  @override
  String toString() => 'FcstVersion(version: $version, fileType: $fileType)';
}
