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
}
