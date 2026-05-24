enum ReviewerRole {
  client,
  staff,
  branchAdmin,
  superAdmin,
  unknown;

  static ReviewerRole fromString(String? value) {
    switch (value?.toLowerCase()) {
      case 'client':
        return ReviewerRole.client;
      case 'staff':
        return ReviewerRole.staff;
      case 'branch_admin':
        return ReviewerRole.branchAdmin;
      case 'super_admin':
        return ReviewerRole.superAdmin;
      default:
        return ReviewerRole.unknown;
    }
  }
}
