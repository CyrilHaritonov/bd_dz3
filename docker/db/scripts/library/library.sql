CREATE TABLE "Books" (
  "ISBN" varchar PRIMARY KEY,
  "year" timestamp NOT NULL,
  "name" varchar NOT NULL,
  "author" varchar NOT NULL,
  "pagenumber" integer NOT NULL,
  "publisher_name" varchar NOT NULL
);

CREATE TABLE "BookInstances" (
  "number" integer PRIMARY KEY,
  "position" integer NOT NULL
);

CREATE TABLE "Publishers" (
  "name" varchar PRIMARY KEY,
  "address" varchar
);

CREATE TABLE "Categories" (
  "name" varchar PRIMARY KEY,
  "subcategories" varchar[],
  "books" varchar[]
);

CREATE TABLE "Readers" (
  "id" integer PRIMARY KEY,
  "firstname" varchar,
  "lastname" varchar,
  "address" varchar,
  "birthday" timestamp
);

CREATE TABLE "Borrow" (
  "id" integer PRIMARY KEY,
  "book_isbn" varchar NOT NULL,
  "instance_number" integer NOT NULL,
  "reader_id" integer NOT NULL,
  "retrival_date" timestamp,
  "is_over" boolean NOT NULL
);

ALTER TABLE "Borrow" ADD FOREIGN KEY ("id") REFERENCES "Readers" ("id");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("book_isbn") REFERENCES "Books" ("ISBN");

ALTER TABLE "Borrow" ADD FOREIGN KEY ("instance_number") REFERENCES "BookInstances" ("number");

ALTER TABLE "Books" ADD FOREIGN KEY ("publisher_name") REFERENCES "Publishers" ("name");

ALTER TABLE "Categories" ADD FOREIGN KEY ("name") REFERENCES "Categories" ("subcategories");

ALTER TABLE "Books" ADD FOREIGN KEY ("ISBN") REFERENCES "Categories" ("books");
