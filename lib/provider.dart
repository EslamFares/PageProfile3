import 'profile.dart';

class ProfileProvider {
  static Profile getProfile() {
    return Profile(
        user: User(
          name: 'Eslam Fares',
          address: 'Mamsoura, Egypt',
          about:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam semper ligula arcu,  maximus nisl lacinia at. Donec tellus erat, fermentum ut mattis.",
        ),
        followers: 2318,
        following: 364,
        friends: 175,
    photos: 6);
  }
}
