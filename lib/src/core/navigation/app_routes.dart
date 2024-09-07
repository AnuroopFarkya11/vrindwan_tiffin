enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  home('home','home'),
  payment('payment','payment'),
  cart('cart','cart'),
  console('console','console'),

  ;
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}