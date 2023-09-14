import 'package:xml/xml.dart';

import 'category.dart';
import 'utils.dart';

enum VilageFcstCategory implements Category {
  pop._('POP'),
  pty._('PTY'),
  pcp._('PCP'),
  reh._('REH'),
  sno._('SNO'),
  sky._('SKY'),
  tmp._('TMP'),
  tmn._('TMN'),
  tmx._('TMX'),
  uuu._('UUU'),
  vvv._('VVV'),
  wav._('WAV'),
  vec._('VEC'),
  wsd._('WSD');

  @override
  final String name;

  const VilageFcstCategory._(this.name);

  @override
  String toString() => name;
}

class VilageFcst {
  final DateTime baseDateTime;
  final (int nx, int ny) position;
  final VilageFcstCategory category;
  final DateTime fcstDateTime;
  final String fcstValue;

  const VilageFcst({
    required this.baseDateTime,
    required this.position,
    required this.category,
    required this.fcstDateTime,
    required this.fcstValue,
  });

  factory VilageFcst.fromXmlElement(XmlElement element) {
    return VilageFcst(
      baseDateTime: element.getDateTime('base'),
      position: element.getPosition(),
      category: element.getCategory(VilageFcstCategory.values),
      fcstDateTime: element.getDateTime('fcst'),
      fcstValue: element.getElement('fcstValue')!.innerText,
    );
  }

  @override
  String toString() =>
      'VilageFcst(baseDateTime: $baseDateTime, category: $category, position: $position, fcstDateTime: $fcstDateTime, fcstValue: $fcstValue)';
}
