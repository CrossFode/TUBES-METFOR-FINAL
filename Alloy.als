open util/ordering[Time]

sig User {
  id: String,
  username: String,
  email: String,
  profile: one Profile,
  loginService: one LoginService,
  orders: set Order,
  payment: one Payment
} {
  id != null &&
  username != null &&
  email != null &&
  profile != null &&
  loginService != null &&
  orders != null &&
  payment != null
}

sig Profile {
  username: String,
  password: String
} {
  username != null &&
  password != null
}

sig LoginService {
  login: one Login
} {
  login != null
}

sig Login {
  user: one User,
  profile: one Profile
} {
  user != null &&
  profile != null
}

sig Subscription {
  harga: Int
} {
  harga > 0
}

sig Order {
  user: one User,
  listOfProduct: set Product,
  payment: one Payment,
  subscription: one Subscription
} {
  user != null &&
  listOfProduct != null &&
  payment != null &&
  subscription != null
}

sig Payment {
  paymentType: String,
  amount: Int,
  paymentID: String,
  service: one PaymentService,
  eWallet: one EWallet,
  creditCard: one CreditCard
} {
  paymentType != null &&
  amount > 0 &&
  paymentID != null &&
  service != null &&
  eWallet != null &&
  creditCard != null
}

sig PaymentService {
  order: one Order
} {
  order != null
}

sig EWallet {
  phoneNumber: String
} {
  phoneNumber != null
}

sig CreditCard {
  cardNumber: String,
  expiredDate: String
} {
  cardNumber != null &&
  expiredDate != null
}

sig Product {}

pred showUser[u: User] {
  u.id != null &&
  u.username != null &&
  u.email != null &&
  u.profile != null &&
  u.loginService != null &&
  u.orders != null &&
  u.payment != null
}

pred showProfile[p: Profile] {
  p.username != null &&
  p.password != null
}

pred showLogin[l: Login] {
  l.user != null &&
  l.profile != null
}

pred showSubscription[s: Subscription] {
  s.harga > 0
}

pred showOrder[o: Order] {
  o.user != null &&
  o.listOfProduct != null &&
  o.payment != null &&
  o.subscription != null
}

pred showPayment[pay: Payment] {
  pay.paymentType != null &&
  pay.amount > 0 &&
  pay.paymentID != null &&
  pay.service != null &&
  pay.eWallet != null &&
  pay.creditCard != null
}

pred showPaymentService[ps: PaymentService] {
  ps.order != null
}

pred showEWallet[ew: EWallet] {
  ew.phoneNumber != null
}

pred showCreditCard[cc: CreditCard] {
  cc.cardNumber != null &&
  cc.expiredDate != null
}

assert validUser {
  all u: User | showUser[u]
}

assert validProfile {
  all p: Profile | showProfile[p]
}

assert validLogin {
  all l: Login | showLogin[l]
}

assert validSubscription {
  all s: Subscription | showSubscription[s]
}

assert validOrder {
  all o: Order | showOrder[o]
}

assert validPayment {
  all pay: Payment | showPayment[pay]
}

assert validPaymentService {
  all ps: PaymentService | showPaymentService[ps]
}

assert validEWallet {
  all ew: EWallet | showEWallet[ew]
}

assert validCreditCard {
  all cc: CreditCard | showCreditCard[cc]
}

check validUser && validProfile && validLogin && validSubscription && validOrder && validPayment && validPaymentService && validEWallet && validCreditCard
