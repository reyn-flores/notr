import 'package:get_it/get_it.dart';
import 'package:notr/src/data/datasource/app_database.dart';
import 'package:notr/src/data/repositories/database_repository_impl.dart';
import 'package:notr/src/domain/repositories/database_repository.dart';
import 'package:notr/src/utils/constants/strings.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  final db = await $FloorAppDatabase.databaseBuilder(databaseName).build();
  locator.registerSingleton<AppDatabase>(db);
  locator.registerSingleton<DatabaseRepository>(
    DatabaseRepositoryImpl(locator<AppDatabase>()),
  );
}
