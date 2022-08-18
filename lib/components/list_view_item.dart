// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final String? leadingIcon;
  final Color leadingIconColor;
  final Color bgIconColor;
  final String title;
  final Widget? dataTable;
  final GestureTapCallback? onTap;
  const ListViewItem(
      {Key? key,
      this.dataTable,
      required this.title,
      this.onTap,
      this.leadingIcon,
      this.leadingIconColor = Colors.white,
      this.bgIconColor = Colors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      expansionCallback: (index, isExpanded) {},
      children: [
        ExpansionPanelRadio(
          // backgroundColor: Color.fromARGB(255, 133, 133, 133),
          value: title,
          canTapOnHeader: true,
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            );
          },
          body: dataTable!,
        )
      ],
    );
  }
}
