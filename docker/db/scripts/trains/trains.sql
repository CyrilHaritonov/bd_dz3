CREATE TABLE "Station" (
  "Name" varchar PRIMARY KEY,
  "Tracks" varchar[],
  "Lie_in" varchar NOT NULL
);

CREATE TABLE "Train" (
  "TrainNr" varchar PRIMARY KEY,
  "Length" integer,
  "Start" varchar NOT NULL,
  "End" varchar NOT NULL,
  "Connected" integer NOT NULL
);

CREATE TABLE "City" (
  "Region" varchar,
  "Name" varchar,
  PRIMARY KEY ("Region", "Name")
);

CREATE TABLE "Connected" (
  "id" integer PRIMARY KEY,
  "Departure" varchar,
  "Arrival" varchar
);

ALTER TABLE "Train" ADD FOREIGN KEY ("Connected") REFERENCES "Connected" ("id");

ALTER TABLE "Station" ADD FOREIGN KEY ("Name") REFERENCES "Connected" ("Departure");

ALTER TABLE "Station" ADD FOREIGN KEY ("Name") REFERENCES "Connected" ("Arrival");

ALTER TABLE "Train" ADD FOREIGN KEY ("Start") REFERENCES "Station" ("Name");

ALTER TABLE "Train" ADD FOREIGN KEY ("End") REFERENCES "Station" ("Name");

ALTER TABLE "Station" ADD FOREIGN KEY ("Lie_in") REFERENCES "City" ("Name");
