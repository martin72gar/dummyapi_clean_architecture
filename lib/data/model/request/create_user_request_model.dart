class CreateUserRequestModel {
  final String firstName;
  final String lastName;
  final String email;

  CreateUserRequestModel(
      {required this.firstName, required this.lastName, required this.email});
}
