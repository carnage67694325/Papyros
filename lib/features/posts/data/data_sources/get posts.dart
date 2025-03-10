abstract class Getpostsdatasource{
Future<Map <String,dynamic>>getallposts(String token);
Future<Map <String,dynamic>>getonepost(String token, String id);


}