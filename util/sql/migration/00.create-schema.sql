create table orders(
  id int,

  #region order details
  `date` text,
  `ship date` text,
  `delayed times` text,

  `order code` text,
  `order detail code` text,
  `tracking code` text,
  `invoice` text,
  `note` text,
  #endregion order details

  `payment gateway` text,

  `product name` text,
  `product codes` text,

  `quantity` text,

  #region pricing
  `product price` text,
  `shipping price` text,
  `discount` text,
  `service price` text,
  `tax` text,
  `amount` text,
  #endregion pricing

  ##region customer info
  `customer name` text,
  `customer email` text,
  `customer phone` text,
  `customer account created date` text,
  #region shipping address
  `address type` text,
  `customer shipping address` text,
  `city` text,
  `state` text,
  `zip code` text,
  `customer country` text,
  #endregion shipping address
  `first purchase date` text,
  ##endregion customer info

  `status` text,

  PRIMARY KEY(id)
);