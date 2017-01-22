create table orders(
  `date` text,
  `ship date` text,
  `delayed times` text,
  `order code` text,
  `order detail code` text,
  `payment gateway` text,
  `product name` text,
  `product price` text,
  `shipping price` text,
  `quantity` text,
  `discount` text,
  `service price` text,
  `tax` text,
  `amount` text,
  `customer name` text,
  `customer email` text,
  `customer phone` text,
  `customer shipping address` text,
  `city` text,
  `state` text,
  `zip code` text,
  `customer country` text,
  `status` text,
  `tracking code` text,
  `invoice` text,
  `note` text,
  `product codes` text,
  `address type` text,
  `first purchase date` text,
  `customer account created date` text
);

##region clarified column
# create table orders(
#   id int NOT NULL auto_increment,
#
#   #region order details
#   `date` text,
#   `ship date` text,
#   `delayed times` text,
#
#   `order code` text,
#   `order detail code` text,
#   `tracking code` text,
#   `invoice` text,
#   `note` text,
#   #endregion order details
#
#   `payment gateway` text,
#
#   `product name` text,
#   `product codes` text,
#
#   `quantity` text,
#
#   #region pricing
#   `product price` text,
#   `shipping price` text,
#   `discount` text,
#   `service price` text,
#   `tax` text,
#   `amount` text,
#   #endregion pricing
#
#   ##region customer info
#   `customer name` text,
#   `customer email` text,
#   `customer phone` text,
#   `customer account created date` text,
#   #region shipping address
#   `address type` text,
#   `customer shipping address` text,
#   `city` text,
#   `state` text,
#   `zip code` text,
#   `customer country` text,
#   #endregion shipping address
#   `first purchase date` text,
#   ##endregion customer info
#
#   `status` text,
#
#   PRIMARY KEY(id)
# );
##endregion clarified column
