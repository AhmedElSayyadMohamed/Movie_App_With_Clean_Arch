class ServerErrorModel {
  final String message;
  final bool success;
  final int statusCode;

  ServerErrorModel({
    required this.message,
    required this.success,
    required this.statusCode,
  });

  factory ServerErrorModel.fromJson(Map<String, dynamic> json) =>
      ServerErrorModel(
        statusCode: json['status_code'],
        message: json['status_message'],
        success: json['success'],
      );
}
