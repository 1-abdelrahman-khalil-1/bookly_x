enum StaffRole {
  barber,
  stylist,
  nailTechnician,
  therapist,
  receptionist,
  unknown;

  static StaffRole fromString(String? value) {
    switch (value?.toUpperCase()) {
      case 'BARBER':
        return StaffRole.barber;
      case 'STYLIST':
        return StaffRole.stylist;
      case 'NAIL_TECHNICIAN':
        return StaffRole.nailTechnician;
      case 'THERAPIST':
        return StaffRole.therapist;
      case 'RECEPTIONIST':
        return StaffRole.receptionist;
      default:
        return StaffRole.unknown;
    }
  }
}
