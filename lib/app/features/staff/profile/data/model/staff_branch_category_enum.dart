enum StaffBranchCategory {
  spa,
  salon,
  barberShop,
  unknown;

  static StaffBranchCategory fromString(String? value) {
    switch (value?.toUpperCase()) {
      case 'SPA':
        return StaffBranchCategory.spa;
      case 'SALON':
        return StaffBranchCategory.salon;
      case 'BARBER_SHOP':
      case 'BARBERSHOP':
        return StaffBranchCategory.barberShop;
      default:
        return StaffBranchCategory.unknown;
    }
  }
}
