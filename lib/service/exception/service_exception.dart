final class ServiceException implements Exception {
  ServiceException({required this.message});
  final String message;

  static ServiceException fromErrorString(String error) {
    switch (error) {
      case 'Missing email or username':
        return ServiceException(message: 'Missing email or username');

      case 'user not found':
        return ServiceException(message: 'user not found');

      default:
        return ServiceException(message: error);
    }
  }
}
