import 'package:conference_app/features/info/data/model/brother/brother.info.dart';

abstract class BrotherInfoRepo {
  Future<List<Brother>> getBrothers();
}
