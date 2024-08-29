enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  home('home','home');
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}