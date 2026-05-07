enum StaffReviewerRole {
  client,
  staff,
  branchAdmin,
  superAdmin,
  unknown;

  static StaffReviewerRole fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'client':
        return StaffReviewerRole.client;
      case 'staff':
        return StaffReviewerRole.staff;
      case 'branch_admin':
        return StaffReviewerRole.branchAdmin;
      case 'super_admin':
        return StaffReviewerRole.superAdmin;
      default:
        return StaffReviewerRole.unknown;
    }
  }
}
