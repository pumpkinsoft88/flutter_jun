import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jun/components/jun_colors.dart';
import 'package:jun/components/jun_constants.dart';
import 'package:jun/components/jun_widgets.dart';

import '../services/add_medicine_service.dart';
import 'add_medicine/components/add_page_widget.dart';

class AddAlarmPage extends StatefulWidget {
  const AddAlarmPage(
      {super.key, required this.medicineImage, required this.medicineName});

  final File? medicineImage;
  final String medicineName;

  @override
  State<AddAlarmPage> createState() => _AddAlarmPageState();
}

class _AddAlarmPageState extends State<AddAlarmPage> {
  final service = AddMedicineService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: AddPageBody(
        children: [
          Text(
            "매일 복약 잊지 말아요!",
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: largeSpace),
          Expanded(
            child: ListView(
              children: alarmWidgets,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomSubmitButton(
        onPressed: () {},
        text: '완료',
      ),
    );
  }

  List<Widget> get alarmWidgets {
    final children = <Widget>[];
    children.addAll(service.alrams
        .map(
          (alarmTime) => AlarmBox(
            time: alarmTime,
            service: service,
          ),
        )
        .toList());
    children.add(AddAlarmButton(
      service: service,
    ));
    return children;
  }
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
    required this.time,
    required this.service,
  }) : super(key: key);

  final String time;
  final AddMedicineService service;

  @override
  Widget build(BuildContext context) {
    final initTime = DateFormat('HH:mm').parse(time);

    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {
              service.removeAlarm(time);
            },
            icon: const Icon(CupertinoIcons.minus_circle),
          ),
        ),
        Expanded(
          flex: 5,
          child: TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.subtitle2,
            ),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return TimePickerBottomSheet(
                    initialDateTime: initTime,
                  );
                },
              );
            },
            child: Text(time),
          ),
        )
      ],
    );
  }
}

class TimePickerBottomSheet extends StatelessWidget {
  const TimePickerBottomSheet({
    Key? key,
    required this.initialDateTime,
  }) : super(key: key);

  final DateTime initialDateTime;

  @override
  Widget build(BuildContext context) {
    return BottomoSheetBody(
      children: [
        SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            onDateTimeChanged: (dateTime) {},
            mode: CupertinoDatePickerMode.time,
            initialDateTime: initialDateTime,
          ),
        ),
        const SizedBox(
          height: reqularSpace,
        ),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        foregroundColor: JunColors.primaryColor,
                        textStyle: Theme.of(context).textTheme.subtitle1,
                        backgroundColor: Colors.white),
                    onPressed: () {},
                    child: const Text('취소')),
              ),
            ),
            const SizedBox(
              width: smallSpace,
            ),
            Expanded(
              child: SizedBox(
                height: submitButtonHeight,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      textStyle: Theme.of(context).textTheme.subtitle1,
                    ),
                    onPressed: () {},
                    child: const Text('선택')),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({
    Key? key,
    required this.service,
  }) : super(key: key);

  final AddMedicineService service;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: service.addNowAlarm,
      child: Row(
        children: const [
          Expanded(flex: 1, child: Icon(CupertinoIcons.plus_circle_fill)),
          Expanded(
            flex: 5,
            child: Center(child: Text("복용시간 추가")),
          ),
        ],
      ),
    );
  }
}
