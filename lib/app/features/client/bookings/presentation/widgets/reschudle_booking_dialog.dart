import 'package:bookly_x_client/app/core/extensions/context_extensions.dart';
import 'package:bookly_x_client/app/core/themes/app_colors.dart';
import 'package:bookly_x_client/app/core/utils/show_message.dart';
import 'package:bookly_x_client/app/core/widgets/buttons/custom_button.dart';
import 'package:bookly_x_client/app/core/widgets/custom_calendar.dart';
import 'package:bookly_x_client/app/core/widgets/custom_sized_box.dart';
import 'package:bookly_x_client/generated/style_atoms.dart';
import 'package:bookly_x_client/generated/translations.g.dart';
import 'package:flutter/material.dart';

class ReschudleBookingDialog extends StatefulWidget {
  const ReschudleBookingDialog({
    super.key,
  });

  static void showBottomSheet(BuildContext context) {
    context.showBottomSheet(bottomSheetBody: const ReschudleBookingDialog());
  }

  @override
  State<ReschudleBookingDialog> createState() => _ReschudleBookingDialogState();
}

class _ReschudleBookingDialogState extends State<ReschudleBookingDialog>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void onNext(DateTime selectedDate) {
    _tabController.animateTo(_tabController.index + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.textBorders,
            border: Border.all(color: AppColors.textBorders),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: context.semiBold14White,
            unselectedLabelStyle: context.semiBold14TextSub,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primary,
            ),
            tabs: [
              Tab(text: tr.date),
              Tab(text: tr.time),
            ],
          ),
        ),
        20.h,
        SizedBox(
          height: context.height * .6,
          child: TabBarView(
            controller: _tabController,
            children: [
              _DateTab(
                onConfirm: onNext,
              ),
              Center(child: Text(tr.time)),
            ],
          ),
        ),
      ],
    );
  }
}

class _DateTab extends StatefulWidget {
  final void Function(DateTime) onConfirm;

  const _DateTab({required this.onConfirm});

  @override
  State<_DateTab> createState() => _DateTabState();
}

class _DateTabState extends State<_DateTab> {
  DateTime? selectedDate;

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomCalendar(onDateSelected: onDateSelected),
          20.h,
          CustomButton(
            title: tr.confirm,
            onPress: () {
              if (selectedDate != null) {
                widget.onConfirm(selectedDate!);
              } else {
                setWarningMessage(tr.pleaseSelectDate);
              }
            },
          )
        ],
      ),
    );
  }
}

class _TimeTab extends StatefulWidget {
  final void Function(DateTime) onConfirm;

  const _TimeTab({required this.onConfirm});

  @override
  State<_TimeTab> createState() => _TimeTabState();
}

class _TimeTabState extends State<_TimeTab> {
  DateTime? selectedDate;

  void onDateSelected(DateTime date) {
    setState(() {
      selectedDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [],
      ),
    );
  }
}
