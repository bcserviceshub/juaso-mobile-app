
class Helper {

   static Map<String, dynamic> getHeaders() {
    return {}..removeWhere((key, value) => value == null);
  }


}