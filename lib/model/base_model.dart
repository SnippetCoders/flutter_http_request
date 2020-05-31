abstract class BaseModel{
  int id;

  static fromMap() {}
  toMap() {}

  fromJson(Map<String, dynamic> json);
}
