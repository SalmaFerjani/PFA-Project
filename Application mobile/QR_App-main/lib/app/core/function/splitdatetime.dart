import 'package:get/get.dart';
import 'package:intl/intl.dart';

String splitDateTime(date) {
  return "${DateFormat().add_yMMMMEEEEd().format(date).split(', ')[0].tr} ${DateFormat().add_yMMMMEEEEd().format(date).split(', ')[1].split(' ')[1]} ${DateFormat().add_yMMMMEEEEd().format(date).split(', ')[1].split(' ')[0].tr}  ${DateFormat().add_yMMMMEEEEd().format(date).split(', ')[2]} ";
}

String splitDateMonthYear(date) {
  return "${DateFormat.yMMMM().format(date).split(' ')[0].toString().tr} ${DateFormat.yMMMM().format(date).split(' ')[1].toString()}";
}
