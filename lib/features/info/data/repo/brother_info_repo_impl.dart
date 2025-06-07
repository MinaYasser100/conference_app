import 'package:conference_app/core/helper_network/dio/app_const.dart';
import 'package:conference_app/core/helper_network/dio/dio_helper.dart';
import 'package:conference_app/features/info/data/model/brother/brother.info.dart';
import 'package:conference_app/features/info/data/repo/brother_info_repo.dart';

class BrotherInfoRepoImpl implements BrotherInfoRepo {
  final DioHelper dioHelper;

  BrotherInfoRepoImpl({required this.dioHelper});

  @override
  Future<List<Brother>> getBrothers() async {
    try {
      print('Fetching brothers from API: ${AppConst.getAllBrothers}');
      final response = await dioHelper.getData(url: AppConst.getAllBrothers);
      print('API response status: ${response.statusCode}');
      print('API response data: ${response.data}');
      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => Brother.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load brothers: ${response.statusMessage}');
      }
    } catch (e) {
      print('API error: $e');
      throw Exception('Error in BrotherInfoRepoImpl: $e');
    }
  }
}
