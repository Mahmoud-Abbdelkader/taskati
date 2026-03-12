class AllTasksModel {
  String? id;
  String? title;
  String? description;
  String? date;
  String? startTime;
  String? endTime;
  bool? isCompleted;

  AllTasksModel({
    this.id,
    this.date,
    this.description,
    this.endTime,
    this.isCompleted,
    this.startTime,
    this.title,
  });

  AllTasksModel copyWith({
  String? id ,
  String? title,
  String? description,
  String? date,
  String? startTime,
  String? endTime,
  bool? isCompleted})
  => AllTasksModel(
    id:id??this.id,
    date: date?? this.date,
    description: description?? this.description,
    endTime: endTime?? this.endTime,
    isCompleted: isCompleted?? this.isCompleted,
    startTime: startTime?? this.startTime,
    title: title?? this.title,
  );

}
