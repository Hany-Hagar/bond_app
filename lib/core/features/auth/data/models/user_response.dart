class UserResponse {
  final bool? success;
  final String message;
  final Map<String, dynamic>? data;
  final String? error;
  final int? statusCode;

  UserResponse({
    this.success,
    required this.message,
    this.data,
    this.error,
    this.statusCode,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      success: json['success'] ?? false,
      message: json['message'],
      data: json['data'] ?? {},
      error: json['error'] ?? '',
      statusCode: json['statusCode'] ?? 200,
    );
  }
}
