import 'package:xml/xml.dart';

import 'category.dart';
import 'utils.dart';

enum UltraSrtNcstCategory implements Category {
  t1h._('T1H'),
  rn1._('RN1'),
  uuu._('UUU'),
  vvv._('VVV'),
  reh._('REH'),
  pty._('PTY'),
  vec._('VEC'),
  wsd._('WSD');

  @override
  final String name;

  const UltraSrtNcstCategory._(this.name);

  @override
  String toString() => name;
}

class UltraSrtNcst {
  final DateTime baseDateTime;
  final (int nx, int ny) position;
  final UltraSrtNcstCategory category;
  final num obsrValue;

  const UltraSrtNcst({
    required this.baseDateTime,
    required this.position,
    required this.category,
    required this.obsrValue,
  });

  factory UltraSrtNcst.fromXmlElement(XmlElement element) {
    return UltraSrtNcst(
      baseDateTime: element.getDateTime('base'),
      position: element.getPosition(),
      category: element.getCategory(UltraSrtNcstCategory.values),
      obsrValue: num.parse(element.getElement('obsrValue')!.innerText),
    );
  }

  @override
  String toString() =>
      'UltraSrtNcst(baseDateTime: $baseDateTime, category: $category, position: $position, obsrValue: $obsrValue)';
}
