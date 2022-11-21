CREATE TYPE "specialist_status" AS ENUM (
    'blocked',
    'working'
    );

CREATE TYPE "order_status" AS ENUM (
    'in_search',
    'communication',
    'in_work',
    'conflict',
    'done'
    );

CREATE TYPE "client_status" AS ENUM (
    'blocked',
    'default'
    );

CREATE TABLE "specialization" (
                                  "id" int,
                                  "specialist_id" int,
                                  "service_id" int,
                                  PRIMARY KEY ("id", "service_id")
);

CREATE TABLE "payout" (
                          "id" serial PRIMARY KEY,
                          "auth_id" int,
                          "amount" int,
                          "date" timestamp,
                          "comment" text
);

CREATE TABLE "service" (
                           "id" int PRIMARY KEY,
                           "category_id" int,
                           "title" varchar,
                           "price" int,
                           "slug" varchar
);

CREATE TABLE "report" (
                          "id" int PRIMARY KEY,
                          "order_id" int,
                          "creation_time" timestamp,
                          "text" text
);

CREATE TABLE "review" (
                          "id" int PRIMARY KEY,
                          "order_id" int,
                          "creation_time" timestamp,
                          "text" text,
                          "rating" int
);

CREATE TABLE "specialist" (
                              "id" int PRIMARY KEY,
                              "auth_id" int,
                              "name" varchar,
                              "surname" varchar,
                              "patronymic" varchar,
                              "status" specialist_status,
                              "rating" int,
                              "phone" varchar
);

CREATE TABLE "client" (
                          "id" int PRIMARY KEY,
                          "auth_id" int,
                          "name" varchar,
                          "string" varchar,
                          "status" client_status,
                          "phone" varchar
);

CREATE TABLE "auth" (
                        "id" int PRIMARY KEY,
                        "username" varchar,
                        "password" varchar,
                        "email" varchar
);

CREATE TABLE "category" (
                            "id" int PRIMARY KEY,
                            "name" varchar,
                            "slug" varchar
);

CREATE TABLE "documents" (
                             "id" int PRIMARY KEY,
                             "order_id" int,
                             "url" text
);

CREATE TABLE "order" (
                         "id" int PRIMARY KEY,
                         "service_id" int,
                         "specialist_id" int null,
                         "client_id" int,
                         "creation_time" timestamp,
                         "status" order_status,
                         "comment" text,
                         "address" text,
                         "deadline" timestamp
);

ALTER TABLE "specialization" ADD FOREIGN KEY ("specialist_id") REFERENCES "specialist" ("id");

ALTER TABLE "specialization" ADD FOREIGN KEY ("service_id") REFERENCES "service" ("id");

ALTER TABLE "payout" ADD FOREIGN KEY ("auth_id") REFERENCES "auth" ("id");

ALTER TABLE "service" ADD FOREIGN KEY ("category_id") REFERENCES "category" ("id");

ALTER TABLE "report" ADD FOREIGN KEY ("order_id") REFERENCES "order" ("id");

ALTER TABLE "review" ADD FOREIGN KEY ("order_id") REFERENCES "order" ("id");

ALTER TABLE "specialist" ADD FOREIGN KEY ("auth_id") REFERENCES "auth" ("id");

ALTER TABLE "client" ADD FOREIGN KEY ("auth_id") REFERENCES "auth" ("id");

ALTER TABLE "documents" ADD FOREIGN KEY ("order_id") REFERENCES "order" ("id");

ALTER TABLE "order" ADD FOREIGN KEY ("service_id") REFERENCES "service" ("id");

ALTER TABLE "order" ADD FOREIGN KEY ("specialist_id") REFERENCES "specialist" ("id");

ALTER TABLE "order" ADD FOREIGN KEY ("client_id") REFERENCES "client" ("id");



