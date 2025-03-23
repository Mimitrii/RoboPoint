Table User {
  userId varchar [primary key]
  userStatusid varchar
  name varchar
  latname varchar
  surname varchar
  birthdayDate timestamp
  sex varchar
  userPhone integer
  email varchar
  bonusId varchar 
}

Table Dishes {
  dishId varchar [primary key]
  name varchar
  description varchar
  menuId varchar
  photo varchar
  recipeId varchar
  combo boolean
  proteins decimal
  fats decimal
  carbohydrates decimal
  calorie decimal
  coefficientId varchar
  price decimal
}

Table ReferencedDishes {
  RdId varchar [primary key]
  referencedDishesId varchar
  dishId varchar 
}

Table Coefficient {
  coefficientId varchar [primary key]
  name varchar
  coefficient varchar
} 

Table Menu {
  menuId varchar2 [primary key]
  categoryName varchar2
  expiryDateTime timestamp
  activeStatus boolean 
}

Table  Recipe {
  recipeId varchar [primary key]
  name varchar2
  ingredientId varchar2
  defaultQty integer
  maxQty integer
  minQty integer
  required boolean
  recipeType varchar2
  qty integer
}

Table  Ingredient {
  ingredientId varchar [primary key]
  name varchar
  proteins decimal
  fats decimal
  carbohydrates decimal
  calorie decimal
  photo varchar
  qty decimal
  batch varchar
  price decimal
  expiryDateTime timestamp
}

Table  ReservedIngredients {
  reserveId varchar [primary key]  
  ingredientId varchar
  orderId varchar
  qty decimal
}

Table Order {
  orderId varchar [primary key]
  detailno varchar
  userId varchar
  orderDateTime timestamp
  orderStatusId varchar
  typeofDeliveryId varchar
  timeofDelivery timestamp
  ammount varchar
  discount decimal
	paymentId varchar
}

Table Basket {
  detailno varchar [primary key]
  dishId varchar
  qty integer
  ammount decimal

}

Table Bonus {
  bonusId varchar [primary key]
  userId varchar
  paymentId varchar 
  bonusDateTime timestamp
  accrual  decimal
  deduction   decimal
  bonusExpiryDate timestamp
  bonusPriceCoefficient decimal
}

Table ingredientOrder {
  orderId varchar [primary key]
  orderDate timestamp
  ingredientId varchar
  qty integer
  requireDateTime timestamp
}


Table Payment {
  paymentId varchar [primary key]
  typeofPaymentid varchar
  dateTime timestamp
  bankPaymentId varchar
  total  decimal
}

Table Discount {
  discountid varchar [primary key]
  name varchar
  description varchar
  discount decimal
  dishId varchar 
  activeStatus boolean 
  startDateTime timestamp
  endDateTime timestamp
  startTime timestamp
  endTime timestamp
}

Table OrderStatus {
  orderStatusId varchar [primary key]
  name varchar
}


Table TypeofDelivery {
  typeofDeliveryId varchar [primary key]
  name varchar
}

Table TypeofPayment {
  typeofPaymentid varchar [primary key]
  paymentId varchar
  name varchar
}

Table TypeofMenu {
  typeofMenuid varchar [primary key]
  menuId varchar
  TypeofMenuName varchar
}

Table UserStatus {
  userStatusid varchar [primary key]
  userId varchar
  name varchar
}

Ref: User.userId < Order.userId 
Ref: Order.detailno < Basket.detailno
Ref: Basket.dishId < Dishes.dishId
Ref: User.userId < Bonus.userId
Ref: Menu.menuId < Dishes.menuId
Ref: Dishes.recipeId < Recipe.recipeId
Ref: Dishes.coefficientId <Coefficient.coefficientId
Ref: ReferencedDishes.referencedDishesId > Dishes.dishId
Ref: Recipe.ingredientId < Ingredient.ingredientId
Ref: Ingredient.ingredientId < ReservedIngredients.ingredientId
Ref: Order.orderId<ReservedIngredients.orderId
Ref: ingredientOrder.ingredientId< Ingredient.ingredientId
Ref: Order.paymentId<Payment.paymentId
Ref: Bonus.paymentId- Payment.paymentId
Ref: Dishes.dishId< Discount.dishId
Ref: Order.orderStatusId< OrderStatus.orderStatusId
Ref: Order.typeofDeliveryId< TypeofDelivery.typeofDeliveryId
REf: TypeofPayment.paymentId> Payment.paymentId
Ref: TypeofMenu.menuId> Menu.menuId
Ref: UserStatus.userId> User.userId



Ref: "Discount"."endDateTime" < "Discount"."startDateTime"