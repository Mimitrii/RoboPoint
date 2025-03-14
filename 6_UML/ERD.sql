CREATE TABLE "User" (
  "userId" varchar PRIMARY KEY,
  "name" varchar,
  "latname" varchar,
  "surname" varchar,
  "birthdayDate" timestamp,
  "sex" varchar,
  "userPhone" integer,
  "email" varchar,
  "bonusId" varchar
);

CREATE TABLE "Dishes" (
  "dishId" varchar PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "menuId" varchar,
  "photo" varchar,
  "recipeId" varchar,
  "combo" boolean,
  "proteins" decimal,
  "fats" decimal,
  "carbohydrates" decimal,
  "calorie" decimal,
  "coefficientId" varchar,
  "price" decimal
);

CREATE TABLE "ReferencedDishes" (
  "referencedDishesId" varchar PRIMARY KEY,
  "dishId" varchar
);

CREATE TABLE "Coefficient" (
  "coefficientId" varchar PRIMARY KEY,
  "name" varchar,
  "coefficient" varchar
);

CREATE TABLE "Menu" (
  "menuId" varchar2 PRIMARY KEY,
  "name" varchar2,
  "menuCategoryid" varchar2,
  "expiryDateTime" timestamp,
  "activeStatus" boolean
);

CREATE TABLE "Recipe" (
  "recipeId" varchar PRIMARY KEY,
  "name" varchar2,
  "ingredientId" varchar2,
  "qty" decimal,
  "maxQty" integer,
  "minQty" integer,
  "required" boolean,
  "proteins" decimal,
  "fats" decimal,
  "carbohydrates" decimal,
  "calorie" decimal
);

CREATE TABLE "Ingredient" (
  "ingredientId" varchar PRIMARY KEY,
  "name" varchar,
  "proteins" decimal,
  "fats" decimal,
  "carbohydrates" decimal,
  "calorie" decimal,
  "photo" varchar,
  "qty" decimal,
  "batch" varchar,
  "price" decimal,
  "expiryDateTime" timestamp
);

CREATE TABLE "ReservedIngredients" (
  "reserveId" varchar PRIMARY KEY,
  "ingredientId" varchar,
  "orderId" varchar,
  "qty" decimal
);

CREATE TABLE "Order" (
  "orderId" varchar PRIMARY KEY,
  "detailno" varchar,
  "userId" varchar,
  "orderDateTime" timestamp,
  "orderStatusId" varchar,
  "typeofDeliveryId" varchar,
  "timeofDelivery" timestamp,
  "ammount" varchar,
  "discount" decimal,
  "paymentId" varchar
);

CREATE TABLE "Basket" (
  "detailno" varchar PRIMARY KEY,
  "dishId" varchar,
  "qty" integer,
  "ammount" decimal
);

CREATE TABLE "Bonus" (
  "bonusId" varchar PRIMARY KEY,
  "userId" varchar,
  "paymentId" varchar,
  "bonusDateTime" timestamp,
  "accrual" decimal,
  "deduction" decimal,
  "bonusExpiryDate" timestamp,
  "bonusPriceCoefficient" decimal
);

CREATE TABLE "ingredientOrder" (
  "orderId" varchar PRIMARY KEY,
  "orderDate" timestamp,
  "ingredientId" varchar,
  "qty" integer,
  "requireDateTime" timestamp
);

CREATE TABLE "Payment" (
  "paymentId" varchar PRIMARY KEY,
  "typeofPaymentid" varchar,
  "dateTime" timestamp,
  "bankPaymentId" varchar,
  "total" decimal
);

CREATE TABLE "Discount" (
  "discountid" varchar PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "discount" decimal,
  "dishId" varchar,
  "activeStatus" boolean,
  "startDateTime" timestamp,
  "endDateTime" timestamp,
  "startTime" timestamp,
  "endTime" timestamp
);

CREATE TABLE "OrderStatus" (
  "orderStatusId" varchar PRIMARY KEY,
  "orderId" varchar,
  "name" varchar
);

CREATE TABLE "TypeofDelivery" (
  "typeofDeliveryId" varchar PRIMARY KEY,
  "orderId" varchar,
  "name" varchar
);

CREATE TABLE "TypeofPayment" (
  "typeofPaymentid" varchar PRIMARY KEY,
  "paymentId" varchar,
  "name" varchar
);

CREATE TABLE "MenuCategory" (
  "menuCategoryid" varchar PRIMARY KEY,
  "menuId" varchar,
  "name" varchar
);

ALTER TABLE "Order" ADD FOREIGN KEY ("userId") REFERENCES "User" ("userId");

ALTER TABLE "Basket" ADD FOREIGN KEY ("detailno") REFERENCES "Order" ("detailno");

ALTER TABLE "Dishes" ADD FOREIGN KEY ("dishId") REFERENCES "Basket" ("dishId");

ALTER TABLE "Bonus" ADD FOREIGN KEY ("userId") REFERENCES "User" ("userId");

ALTER TABLE "Dishes" ADD FOREIGN KEY ("menuId") REFERENCES "Menu" ("menuId");

ALTER TABLE "Recipe" ADD FOREIGN KEY ("recipeId") REFERENCES "Dishes" ("recipeId");

ALTER TABLE "Coefficient" ADD FOREIGN KEY ("coefficientId") REFERENCES "Dishes" ("coefficientId");

ALTER TABLE "ReferencedDishes" ADD FOREIGN KEY ("dishId") REFERENCES "Dishes" ("dishId");

ALTER TABLE "Ingredient" ADD FOREIGN KEY ("ingredientId") REFERENCES "Recipe" ("ingredientId");

ALTER TABLE "ReservedIngredients" ADD FOREIGN KEY ("ingredientId") REFERENCES "Ingredient" ("ingredientId");

ALTER TABLE "ReservedIngredients" ADD FOREIGN KEY ("orderId") REFERENCES "Order" ("orderId");

ALTER TABLE "Ingredient" ADD FOREIGN KEY ("ingredientId") REFERENCES "ingredientOrder" ("ingredientId");

ALTER TABLE "Payment" ADD FOREIGN KEY ("paymentId") REFERENCES "Order" ("paymentId");

ALTER TABLE "Payment" ADD FOREIGN KEY ("paymentId") REFERENCES "Bonus" ("paymentId");

ALTER TABLE "Discount" ADD FOREIGN KEY ("dishId") REFERENCES "Dishes" ("dishId");

ALTER TABLE "OrderStatus" ADD FOREIGN KEY ("orderStatusId") REFERENCES "Order" ("orderStatusId");

ALTER TABLE "TypeofDelivery" ADD FOREIGN KEY ("typeofDeliveryId") REFERENCES "Order" ("typeofDeliveryId");

ALTER TABLE "TypeofPayment" ADD FOREIGN KEY ("paymentId") REFERENCES "Payment" ("paymentId");

ALTER TABLE "MenuCategory" ADD FOREIGN KEY ("menuCategoryid") REFERENCES "Menu" ("menuCategoryid");
