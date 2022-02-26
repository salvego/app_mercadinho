import 'package:intl/intl.dart';

class OrderModel {
  String id;
  DateTime createdDateTime;
  DateTime overdueDateTime;
  String statusOrder;
  String copyAndPaste;
  double total;

  OrderModel({
    required this.copyAndPaste,
    required this.createdDateTime,
    required this.id,
    required this.overdueDateTime,
    required this.statusOrder,
    required this.total,
  });

  OrderModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        createdDateTime = getFormattedDate(json['createdDateTime'].toString()),
        overdueDateTime = getFormattedDate(json['overdueDateTime'].toString()),
        statusOrder = json['statusOrder'].toString(),
        copyAndPaste = json['copyAndPaste'].toString(),
        total = json['total'].toDouble();

  static DateTime getFormattedDate(String date) {
    /// Convert into local date format.
    DateTime datetime = DateTime.parse(date.replaceAll('T', ' ').replaceAll('Z', ''));
    return datetime;
  }
}
