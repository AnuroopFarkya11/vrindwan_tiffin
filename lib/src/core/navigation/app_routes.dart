enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  otpPin('otpPin','otpPin'),
  home('home','home'),
  payment('payment','payment'),
  cart('cart','cart'),
  console('console','console'),
  form('form','form'),
  delivery('delivery','delivery'),
  orderSummary('orderSummary','orderSummary'),
  dish('dish','dish')


  ;
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}