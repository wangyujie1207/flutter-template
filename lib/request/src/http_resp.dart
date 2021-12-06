class HttpResponse<T> {
  int code;
  String? message;
  T data;

  HttpResponse({required this.code, this.message, required this.data});

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"message\":\"$message\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}