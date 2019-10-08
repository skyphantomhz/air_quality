import 'package:air_quality/model/base_model.dart';

class BaseRequest<T extends BaseModel> {
  String status;
  T data;

  BaseRequest({this.status, this.data});

  
}
