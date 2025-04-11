abstract class Getpostsdatasource {
  Future<Map<String, dynamic>> getallposts();
  Future<Map<String, dynamic>> getonepost(String token, String id);
}
