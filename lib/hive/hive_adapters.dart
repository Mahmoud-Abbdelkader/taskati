import 'package:hive_ce/hive_ce.dart';
import 'package:taskati/Models/all_tasks_model.dart';

@GenerateAdapters([AdapterSpec<AllTasksModel>()])
part 'hive_adapters.g.dart';
