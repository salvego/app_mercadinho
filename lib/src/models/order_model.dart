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
        //createdDateTime = DateTime.parse(json['createdDateTime'].toString().replaceAll('Z', '').replaceAll('T', ' ').toString()),
        createdDateTime = DateTime.parse('2022-02-23 01:19:43.000'),
        //overdueDateTime = DateTime.parse(json['overdueDateTime'].toString().replaceAll('Z', '').replaceAll('T', ' ').toString()),
        overdueDateTime = DateTime.parse('2022-02-23 01:19:43.000'),
        statusOrder = json['statusOrder'].toString(),
        copyAndPaste = json['copyAndPaste'].toString(),
        total = json['total'].toDouble();



}
