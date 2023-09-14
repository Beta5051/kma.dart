import 'package:xml/xml.dart';

class ServiceResponse<T> {
  final int resultCode;
  final String resultMsg;
  final int numOfRows;
  final int pageNo;
  final int totalCount;
  final List<T> items;

  const ServiceResponse({
    required this.resultCode,
    required this.resultMsg,
    required this.numOfRows,
    required this.pageNo,
    required this.totalCount,
    required this.items,
  });

  factory ServiceResponse.fromXml(
      XmlDocument document, T Function(XmlElement element) itemFromXmlElement) {
    final response = document.getElement('response')!;

    final header = response.getElement('header')!;

    final resultCode = int.parse(header.getElement('resultCode')!.innerText);
    final resultMsg = header.getElement('resultMsg')!.innerText;

    final body = response.getElement('body')!;

    final numOfRows = int.parse(body.getElement('numOfRows')!.innerText);
    final pageNo = int.parse(body.getElement('pageNo')!.innerText);
    final totalCount = int.parse(body.getElement('totalCount')!.innerText);

    final items = body
        .getElement('items')!
        .findAllElements('item')
        .map(itemFromXmlElement)
        .toList();

    return ServiceResponse(
      resultCode: resultCode,
      resultMsg: resultMsg,
      numOfRows: numOfRows,
      pageNo: pageNo,
      totalCount: totalCount,
      items: items,
    );
  }

  @override
  String toString() =>
      'ServiceResponse(resultCode: $resultCode, resultMsg: $resultMsg, numOfRows: $numOfRows, pageNo: $pageNo, totalCount: $totalCount, items: $items)';
}
