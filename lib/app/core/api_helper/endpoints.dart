abstract class Endpoints {
  Endpoints._();

  static const getBaseUrl = '';
//  static const baseUrl = 'http://10.0.2.2:3000';
  static const baseUrl = 'https://bookly-x.up.railway.app';

  // ─── Auth ─────────────────────────────────────────────────────────────────
  static const login = '/auth/login';
  static const refreshToken = '/auth/refresh';
  static const requestPasswordReset = '/auth/request-password-reset';
  static const verifyPasswordReset = '/auth/verify-password-reset';
  static const resetPassword = '/auth/reset-password';

  // ─── Staff ────────────────────────────────────────────────────────────────
  static const staffSchedule = '/staff/schedule';
  static const staffAppointments = '/staff/appointments';
  static const staffProfile = '/staff/profile';
  static const staffReview = '/reviews';
  static const staffAvailability = '/staff/availability';

  // ─── Client — Home ────────────────────────────────────────────────────────
  static const clientDashboard = '/client/home/dashboard';

  // ─── Client — Profile ─────────────────────────────────────────────────────
  static const clientProfile = '/client/profile';
  // ─── Client — Branches ────────────────────────────────────────────────────
  static String clientBranchProfile(String id) => '/client/branches/$id/profile';
  static String clientBranchServices(String id) => '/client/branches/$id/services';

  // ─── Client — Staff ───────────────────────────────────────────────────────
  static String clientStaffProfile(String id) => '/client/staff/$id/profile';
  static String clientServiceStaff(String id) => '/client/services/$id/staff';
  static String clientStaffAvailabilityDays(String id) =>
      '/client/staff/$id/availability/days';
  static String clientStaffAvailabilitySlots(String id) =>
      '/client/staff/$id/availability/slots';

  // ─── Client — Appointments ────────────────────────────────────────────────
  static const clientAppointments = '/client/appointments';
  static String clientAppointmentDetails(String id) =>
      '/client/appointments/$id';
  static String clientCancelAppointment(String id) =>
      '/client/appointments/$id/cancel';
  static const clientReserveAppointment = '/client/appointments/reserve';
  static String clientConfirmPayment(String id) =>
      '/client/appointments/$id/confirm-payment';

  // ─── Client — Favourites ──────────────────────────────────────────────────
  static const clientFavourites = '/client/favourites';
  static String clientFavouriteBranch(String id) =>
      '/client/favourites/branches/$id';
  static String clientFavouriteStaff(String id) =>
      '/client/favourites/staff/$id';

  // ─── Client — Offers ──────────────────────────────────────────────────────
  static String clientServiceOffers(String id) =>
      '/client/services/$id/offers';

  // ─── Client — Discovery ───────────────────────────────────────────────────
  static const clientDiscovery = '/client/discovery/search';
}
