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
        //createdDateTime = DateTime.parse('2022-02-23 01:19:43.000'),
        overdueDateTime = getFormattedDate(json['overdueDateTime'].toString()),
        //overdueDateTime = DateTime.parse('2022-02-23 01:19:43.000'),
        statusOrder = json['statusOrder'].toString(),
        copyAndPaste = json['copyAndPaste'].toString(),
        total = json['total'].toDouble();

  static DateTime formatDate(dynamic date) {
    var now = date;
    //DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
    String input = DateFormat('yyyy-MM-dd hh:mm:ss').format(now);
    DateTime data = DateTime.parse(input);
    return data;
  }

  static getFormatedDate(_date) {
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(_date);
    var outputFormat = DateFormat('dd/MM/yyyy');
    return outputFormat.format(inputDate);
  }

  static getFormattedDate(String date) {

    /// Convert into local date format.
    var localDate = DateTime.parse(date).toLocal();

    /// inputFormat - format getting from api or other func.
    /// e.g If 2021-05-27 9:34:12.781341 then format should be yyyy-MM-dd HH:mm
    /// If 27/05/2021 9:34:12.781341 then format should be dd/MM/yyyy HH:mm
    var inputFormat = DateFormat('yyyy-MM-dd HH:mm');
    var inputDate = inputFormat.parse(localDate.toString());

    /// outputFormat - convert into format you want to show.
    var outputFormat = DateFormat('dd/MM/yyyy HH:mm');
    var outputDate = outputFormat.format(inputDate);

    print(outputDate);
    return outputDate;
  }
}
