class ServerErrorModel{
 final String message;
 final bool success;
 final int statusCode;

 ServerErrorModel({required this.message,required this.success,required this.statusCode});
}