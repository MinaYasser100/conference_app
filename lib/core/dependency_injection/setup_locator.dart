import 'package:conference_app/core/helper_network/dio/dio_helper.dart';
import 'package:conference_app/features/home/data/send_points_repo_impl.dart';
import 'package:conference_app/features/info/data/repo/brother_info_repo_impl.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  // تسجيل DioHelper كـ Singleton
  locator.registerLazySingleton<DioHelper>(() => DioHelper());

  // تسجيل SendPointsRepoImpl كـ Singleton مع تمرير DioHelper
  locator.registerLazySingleton<SendPointsRepoImpl>(
    () => SendPointsRepoImpl(dioHelper: locator<DioHelper>()),
  );

  locator.registerLazySingleton<BrotherInfoRepoImpl>(
    () => BrotherInfoRepoImpl(dioHelper: locator<DioHelper>()),
  );
}
