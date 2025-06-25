abstract class SupportRepository {
  Future<void> createTicket({
    required String email,
    required String title,
    required String description,
  });
}
