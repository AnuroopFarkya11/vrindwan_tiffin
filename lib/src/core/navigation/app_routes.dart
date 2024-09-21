enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  home('home','home'),
  payment('payment','payment'),
  cart('cart','cart'),
  console('console','console'),
  form('form','form'),
  dish('dish','dish')


  ;
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}