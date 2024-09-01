enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  home('home','home'),
  cart('cart','cart');
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}