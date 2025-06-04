
class ApiResponse<T> {
  final String? message;
  final int? statusCode;
  final T? data;

  ApiResponse({
    this.message,
    this.statusCode,
    this.data,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromData,
  ) {
    return ApiResponse<T>(
      message: json['message'],
      statusCode: json['status_code'], // Optional: customize if present
      data: fromData(json['data']),
    );
  }
}
