part of '../screens/staff_profile_screen.dart';

class StaffInforamtionSection extends StatelessWidget {
  const StaffInforamtionSection({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    final age = user.staff?.age;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.03),
            blurRadius: 18,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          _StaffContactRow(
            icon: MyIcons.smsEditOutline,
            title: tr.email,
            value: user.email,
          ),
          16.h,
          _StaffContactRow(
            icon: MyIcons.callOutline,
            title: tr.phoneNumber,
            value: user.phone,
          ),
          16.h,
          _StaffContactRow(
            icon: MyIcons.profileOutline,
            title: tr.age,
            value: age == null ? '-' : '$age',
          ),
          16.h,
          _StaffContactRow(
            icon: MyIcons.calendarOutline,
            title: tr.joined,
            value: user.createdAt?.formattedDate ?? '-',
          ),
        ],
      ),
    );
  }
}

class _StaffContactRow extends StatelessWidget {
  const _StaffContactRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 38,
          height: 38,
          decoration: BoxDecoration(
            color: AppColors.whiteCatskillWhite,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(icon, color: AppColors.primary, size: 20),
        ),
        12.w,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: context.regular12TextSub),
              2.h,
              Text(value, style: context.semiBold16),
            ],
          ),
        ),
      ],
    );
  }
}
