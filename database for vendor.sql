CREATE TABLE vendors (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(255) NOT NULL,
  contact_name VARCHAR(255) NOT NULL,
  contact_email VARCHAR(255) NOT NULL,
  contact_phone VARCHAR(255) NOT NULL,
  website VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);

CREATE TABLE products (
  id INT NOT NULL AUTO_INCREMENT,
  vendor_id INT NOT NULL,
  name VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  price DECIMAL(10, 2) NOT NULL,
	`order_id` INT NOT NULL,
	`product_id` INT NOT NULL,
	`quantity` INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (vendor_id) REFERENCES vendors (id)
);

CREATE TABLE orders (
  id INT NOT NULL AUTO_INCREMENT,
  vendor_id INT NOT NULL,
  product_id INT NOT NULL,
  quantity INT NOT NULL,
  total DECIMAL(10, 2) NOT NULL,
  order_date DATETIME NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (vendor_id) REFERENCES vendors (id),
  FOREIGN KEY (product_id) REFERENCES products (id)
);

CREATE TABLE payments (
  id INT NOT NULL AUTO_INCREMENT,
  order_id INT NOT NULL,
  payment_date DATETIME NOT NULL,
  amount DECIMAL(10, 2) NOT NULL,
  payment_method VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (order_id) REFERENCES orders (id)
);

CREATE TABLE ratings (
  id INT NOT NULL AUTO_INCREMENT,
  vendor_id INT NOT NULL,
  rating INT NOT NULL,
  review VARCHAR(255) NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (vendor_id) REFERENCES vendors (id)
);

INSERT INTO vendors (name, contact_name, contact_email, contact_phone, website)
VALUES ('Acme Corporation', 'John Smith', 'john.smith@acme.com', '123-456-7890', 'www.acme.com');


