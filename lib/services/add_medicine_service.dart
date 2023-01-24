import 'package:intl/intl.dart';

class AddMedicineService {
  final _alarms = <String>{
    '08:00',
    '13:00',
    '19:00',
  };

  void addNowAlarm() {
    final now = DateTime.now();
    final nowTime = DateFormat('HH:mm').format(now);
    _alarms.add(nowTime);
  }

  void removeAlarm(String alarmTime) {
    _alarms.remove(alarmTime);
  }
}
