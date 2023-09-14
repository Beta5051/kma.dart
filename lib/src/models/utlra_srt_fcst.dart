import 'package:xml/xml.dart';

import 'category.dart';
import 'utils.dart';

enum UltraSrtFcstCategory implements Category {
  t1h._('T1H'),
  rn1._('RN1'),
  sky._('SKY'),
  uuu._('UUU'),
  vvv._('VVV'),
  reh._('REH'),
  pty._('PTY'),
  lgt._('LGT'),
  vec._('VEC'),
  wsd._('WSD');

  @override
  final String name;

  const UltraSrtFcstCategory._(this.name);

  @override
  String toString() => name;
}

class UltraSrtFcst {
  final DateTime baseDateTime;
  final (int nx, int ny) position;
  final UltraSrtFcstCategory category;
  final DateTime fcstDateTime;
  final String fcstValue;

  const UltraSrtFcst({
    required this.baseDateTime,
    required this.position,
    required this.category,
    required this.fcstDateTime,
    required this.fcstValue,
  });

  factory UltraSrtFcst.fromXmlElement(XmlElement element) {
    return UltraSrtFcst(
      baseDateTime: element.getDateTime('base'),
      position: element.getPosition(),
      category: element.getCategory(UltraSrtFcstCategory.values),
      fcstDateTime: element.getDateTime('fcst'),
      fcstValue: element.getElement('fcstValue')!.innerText,
    );
  }

  @override
  String toString() =>
      'UltraSrtFcst(baseDateTime: $baseDateTime, category: $category, position: $position, fcstDateTime: $fcstDateTime, fcstValue: $fcstValue)';
}
