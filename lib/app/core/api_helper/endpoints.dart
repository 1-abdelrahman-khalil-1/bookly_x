abstract class Endpoints {
  Endpoints._();

  static const getBaseUrl = '';
  static const baseUrl = 'http://10.0.2.2:3000';

  static const login = '/auth/login';
  static const refreshToken = '/auth/refresh';
  static const requestPasswordReset = '/auth/request-password-reset';
  static const verifyPasswordReset = '/auth/verify-password-reset';
  static const resetPassword = '/auth/reset-password';
}
