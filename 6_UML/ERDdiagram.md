Table User {
  userId varchar [primary key]
  name varchar
  latname varchar
  surname varchar
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
}

Table referencedDishes {
  referencedDishesId varchar [primary key]
  dishId varchar 
}

Table Price {
  dishId varchar [primary key]
  coefficient decimal
  price decimal
  activeStatus boolean
} 

Table Menu {
  menuId varchar2 [primary key]
  name varchar2
  category varchar2
  expiryDateTime timestamp
  activeStatus boolean 
}

Table  recipe {
  recipeId varchar [primary key]
  name varchar2
  ingredientId varchar2
  qty decimal
  maxQty integer
  minQty integer
  required boolean
  proteins decimal
  fats decimal
  carbohydrates decimal
  calorie decimal
}

Table  ingredient {
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

Table  reservedIngredients {
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
  status enum
  typeOfDelivery enum
  timeofDelivery timestamp
	paymentId varchar
  discount decimal
	total decimal
}

Table Basket {
  detailno varchar [primary key]
  dishId varchar
  qty integer
  cost decimal
}

Table Bonus {
  bonusId varchar [primary key]
  userId varchar
  bonusDateTime timestamp
  accrual  decimal
  deduction   decimal
  bonusExpiryDate timestamp
  paymentId varchar
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
  typeofPayment enum
  dateTime timestamp
  bankPaymentId varchar
  bonusPriceCoefficient enum
  total  decimal
}

Ref: User.userId < Order.userId 
Ref: Order.detailno < Basket.detailno
Ref: Basket.dishId > Dishes.dishId
Ref: User.userId < Bonus.userId
Ref: Menu.menuId < Dishes.menuId
Ref: Dishes.recipeId < recipe.recipeId
Ref: Dishes.dishId <Price.dishId
Ref: referencedDishes.dishId > Dishes.dishId
Ref: recipe.ingredientId < ingredient.ingredientId
Ref: ingredient.ingredientId < reservedIngredients.ingredientId
Ref: Order.orderId<reservedIngredients.orderId
Ref: ingredientOrder.ingredientId< ingredient.ingredientId
Ref: Order.paymentId<Payment.paymentId
Ref: Payment.paymentId<Bonus.paymentId


