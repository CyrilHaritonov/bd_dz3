CREATE TYPE "proffesion" AS ENUM (
  'Caregiver',
  'Doctor'
);

CREATE TABLE "StationPersonell" (
  "PersNr" varchar PRIMARY KEY,
  "Name" varchar[],
  "is_a" proffesion NOT NULL,
  "Works_for" intger NOT NULL
);

CREATE TABLE "Caregiver" (
  "id" integer PRIMARY KEY,
  "Quallification" varchar
);

CREATE TABLE "Doctor" (
  "id" integer PRIMARY KEY,
  "Area" varchar,
  "Rank" varchar,
  "Treats" integer[] NOT NULL
);

CREATE TABLE "Patient" (
  "PatientNr" integer PRIMARY KEY,
  "Name" varchar,
  "Disease" varchar
);

CREATE TABLE "Station" (
  "StatNr" integer PRIMARY KEY,
  "Name" varchar,
  "Has" integer[]
);

CREATE TABLE "Room" (
  "RoomNr" integer PRIMARY KEY,
  "Beds" integer,
  "Addmision" integer NOT NULL
);

CREATE TABLE "Addmision" (
  "from" intger,
  "to" integer,
  "Patient" integer NOT NULL,
  PRIMARY KEY ("from", "to")
);

ALTER TABLE "Caregiver" ADD FOREIGN KEY ("id") REFERENCES "StationPersonell" ("is_a");

ALTER TABLE "Doctor" ADD FOREIGN KEY ("id") REFERENCES "StationPersonell" ("is_a");

ALTER TABLE "StationPersonell" ADD FOREIGN KEY ("Works_for") REFERENCES "Station" ("StatNr");

ALTER TABLE "Room" ADD FOREIGN KEY ("RoomNr") REFERENCES "Station" ("Has");

ALTER TABLE "Addmision" ADD FOREIGN KEY ("from") REFERENCES "Room" ("Addmision");

ALTER TABLE "Addmision" ADD FOREIGN KEY ("to") REFERENCES "Room" ("Addmision");

ALTER TABLE "Patient" ADD FOREIGN KEY ("PatientNr") REFERENCES "Addmision" ("Patient");

ALTER TABLE "Patient" ADD FOREIGN KEY ("PatientNr") REFERENCES "Doctor" ("Treats");
