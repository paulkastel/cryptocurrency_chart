import 'package:cryptochart/network/dtos/dataset_dto.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeHeader extends StatelessWidget {
  const TimeHeader(this._dataset, {Key? key}) : super(key: key);

  final DatasetDto _dataset;

  String _getFormatted(DateTime dateTime) {
    return DateFormat('dd/M/yy, HH:mm').format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Text(
        '${_getFormatted(_dataset.timeFrom)} - ${_getFormatted(_dataset.timeFrom)}',
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}
