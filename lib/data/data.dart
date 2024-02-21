
class AppLatLong {
  final double lat;
  final double long;

  const AppLatLong({
    required this.lat,
    required this.long,
  });
}

class UzbekstonLocation extends AppLatLong {
  const UzbekstonLocation({
    super.lat = 41.326598,
    super.long = 69.228487,
  });
}
