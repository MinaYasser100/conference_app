import 'package:conference_app/core/helper_network/dio/app_const.dart';
import 'package:conference_app/core/helper_network/dio/dio_helper.dart';
import 'package:conference_app/features/home/data/send_point_repo.dart';
import 'package:dio/dio.dart';

class SendPointsRepoImpl implements SendPointRepo {
  final DioHelper dioHelper;

  SendPointsRepoImpl({required this.dioHelper});

  @override
  Future<Response<dynamic>> sendBrotherPoints(String name, int points) async {
    final response = await dioHelper.postData(
      url: AppConst.updatePoints, // افتراضًا إن الـ endpoint معرف في AppConst
      data: {'name': name, 'point': points},
    );
    return response;
  }
}
