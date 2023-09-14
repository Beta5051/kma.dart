import 'category.dart';

enum FileType implements Category {
  odam._('ODAM'),
  vsrt._('VSRT'),
  shrt._('SHRT');

  @override
  final String name;

  const FileType._(this.name);

  @override
  String toString() => name;
}
