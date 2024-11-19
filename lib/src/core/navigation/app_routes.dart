enum AppRoutes{
  auth('auth', '/'),
  otp('otp','otp'),
  otpPin('otpPin','otpPin'),
  password('password','password'),
  home('home','home'),
  payment('payment','payment'),
  cart('cart','cart'),
  console('console','console'),
  form('form','form'),
  delivery('delivery','delivery'),
  addDelivery('addDelivery','addDelivery'),
  orderSummary('orderSummary','orderSummary'),
  orderPlaced('orderPlaced','orderPlaced'),
  orderTrack('orderTrack','orderTrack'),
  orderHistory('orderHistory','orderHistory'),
  dish('dish','dish'),
  dishList('dishList','dishList')



  ;
  const AppRoutes(this.name,this.path);
  final String path;
  final String name;
}