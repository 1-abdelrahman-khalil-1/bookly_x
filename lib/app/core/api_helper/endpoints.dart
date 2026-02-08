abstract class Endpoints {
  Endpoints._();

  static const getBaseUrl = '';
  static const baseUrl = 'https://eva.fatoraapp.com/api';

  // auth endpoints
  static const sendOTP = '/auth/send-otp';
  static const verifyOTP = '/auth/verify-otp';
  static const resendOTP = '/auth/resend-otp';
  static const register = '/hospital/profile';
  static const profile = '/hospital/profile/me';
  static const updateProfile = '/hospital/profile/update';
  static const allMedicalBookings = '/hospital/medical-service-bookings';
  static const allDoctorsBookings = '/hospital/doctor-bookings';
  static const categories = '/categories';
  static const wallet = '/hospital/wallet';
  static const doctors = '/hospital/doctors';
  static const reviews = '/hospital/ratings';
  static const settings = '/settings';
  static const support = '/hospital/support';

  // Blogs endpoints
  static const blogs = '/blogs';
  static String blog(int blogId) => '/blogs/$blogId';
  static String blogUpdate(int blogId) => '/blogs/$blogId/update';
  static String blogLike(int blogId) => '/blogs/$blogId/like';
  static String blogComments(int blogId) => '/blogs/$blogId/comments';
  static String blogComment(int blogId, int commentId) =>
      '/blogs/$blogId/comments/$commentId';
  static String blogCommentUpdate(int blogId, int commentId) =>
      '/blogs/$blogId/comments/$commentId/update';
  static String socialProfile = '/blogs/social-profile';
}
