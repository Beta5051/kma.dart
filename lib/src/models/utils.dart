import 'package:kma/src/models/category.dart';
import 'package:xml/xml.dart';

extension XmlElementUtils on XmlElement {
  DateTime getDateTime(String name) => DateTime.parse(
      '${getElement('${name}Date')!.innerText} ${getElement('${name}Time')!.innerText}');

  (int nx, int ny) getPosition() {
    final nx = int.parse(getElement('nx')!.innerText);
    final ny = int.parse(getElement('ny')!.innerText);
    return (nx, ny);
  }

  T getCategory<T extends Category>(List<T> values) => values
      .firstWhere((value) => value.name == getElement('category')!.innerText);
}
