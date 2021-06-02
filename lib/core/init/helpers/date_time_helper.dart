import '../../core_shelf.dart';

String dateTimeHelper(DateTime date) {
  var months = [
    'january'.translate,
    'february'.translate,
    'march'.translate,
    'april'.translate,
    'may'.translate,
    'june'.translate,
    'july'.translate,
    'august'.translate,
    'september'.translate,
    'october'.translate,
    'november'.translate,
    'december'.translate
  ];
  return '${date.day} ${months[date.month - 1]} ${date.year}';
}
