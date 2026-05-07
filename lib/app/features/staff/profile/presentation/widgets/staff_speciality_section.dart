part of '../screens/staff_profile_screen.dart';

class StaffSpecialitySection extends StatelessWidget {
  const StaffSpecialitySection({
    super.key,
    required this.services,
  });

  final List<StaffServiceModel> services;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(tr.specialties, style: context.bold18Primary),
        12.h,
        if (services.isEmpty)
          Text(tr.noResultsFound, style: context.regular14TextSub)
        else
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              for (final service in services)
                _buildServiceChip(label: service.name, context: context),
            ],
          ),
        16.h,
      ],
    );
  }

  Widget _buildServiceChip({
    required String label,
    required BuildContext context,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.lightBlue.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Text(
        label,
        style: context.regular12PrimaryDark,
      ),
    );
  }
}
