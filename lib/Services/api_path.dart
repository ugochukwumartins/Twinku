class ApiPath {
  static String Post(String uid, String PostId) => 'Users/$uid/Posts/$PostId';
  static String Posts(String uid) => 'users/$uid/Posts';
}
