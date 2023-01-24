import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jun/components/jun_colors.dart';
import 'package:jun/components/jun_constants.dart';
import 'package:jun/components/jun_widgets.dart';

import 'add_medicine/components/add_page_widget.dart';

class AddAlarmPage extends StatelessWidget {
  const AddAlarmPage(
      {super.key, required this.medicineImage, required this.medicineName});

  final File? medicineImage;
  final String medicineName;

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
              children: const [
                AlarmBox(),
                AlarmBox(),
                AlarmBox(),
                AlarmBox(),
                AlarmBox(),
                AddAlarmButton(),
              ],
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
}

class AlarmBox extends StatelessWidget {
  const AlarmBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: IconButton(
            onPressed: () {},
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
                  return BottomoSheetBody(
                    children: [
                      SizedBox(
                        height: 200,
                        child: CupertinoDatePicker(
                          onDateTimeChanged: (dateTime) {},
                          mode: CupertinoDatePickerMode.time,
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
                                      textStyle:
                                          Theme.of(context).textTheme.subtitle1,
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
                                    textStyle:
                                        Theme.of(context).textTheme.subtitle1,
                                  ),
                                  onPressed: () {},
                                  child: const Text('선택')),
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              );
            },
            child: const Text("21:00"),
          ),
        )
      ],
    );
  }
}

class AddAlarmButton extends StatelessWidget {
  const AddAlarmButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 6),
          textStyle: Theme.of(context).textTheme.subtitle1),
      onPressed: () {},
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
