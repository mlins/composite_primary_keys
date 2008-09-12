CREATE SEQUENCE public.reference_types_seq START 100;
CREATE TABLE "ReferenceType" (
  "referenceTypeId" int DEFAULT nextval('public.reference_types_seq'),
  "typeLabel" varchar(50) default NULL,
  "abbreviation" varchar(50) default NULL,
  "description" varchar(50) default NULL,
  PRIMARY KEY  ("referenceTypeId")
);

CREATE TABLE "ReferenceCode" (
  "referenceTypeId" int NOT NULL,
  "referenceCode" int NOT NULL,
  "codeLabel" varchar(50) default NULL,
  "abbreviation" varchar(50) default NULL,
  "description" varchar(50) default NULL,
  PRIMARY KEY  ("referenceTypeId","referenceCode")
);

CREATE SEQUENCE public.products_seq START 100;
CREATE TABLE "Product" (
  "id" int NOT NULL DEFAULT nextval('public.products_seq'),
  "name" varchar(50) default NULL,
  PRIMARY KEY  ("id")
);

CREATE TABLE "Tariff" (
  "tariffId" int NOT NULL,
  "startDate" date NOT NULL,
  "amount" int default NULL,
  PRIMARY KEY  ("tariffId","startDate")
);

CREATE TABLE "ProductTariff" (
  "productId" int NOT NULL,
  "tariffId" int NOT NULL,
  "tariffStartDate" date NOT NULL,
  PRIMARY KEY  ("productId","tariffId","tariffStartDate")
);

CREATE TABLE "Suburb" (
  "cityId" int NOT NULL,
  "suburbId" int NOT NULL,
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("cityId","suburbId")
);

CREATE SEQUENCE public.streets_seq START 100;
CREATE TABLE "Street" (
  "id" int NOT NULL DEFAULT nextval('public.streets_seq'),
  "cityId" int NOT NULL,
  "suburbId" int NOT NULL,
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("id")
);

CREATE SEQUENCE public.users_seq START 100;
CREATE TABLE "User" (
  "id" int NOT NULL DEFAULT nextval('public.users_seq'),
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("id")
);

CREATE SEQUENCE public.articles_seq START 100;
CREATE TABLE "Article" (
  "id" int NOT NULL DEFAULT nextval('public.articles_seq'),
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("id")
);

CREATE SEQUENCE public.readings_seq START 100;
CREATE TABLE "Reading" (
  "id" int NOT NULL DEFAULT nextval('public.readings_seq'),
  "userId" int NOT NULL,
  "articleId" int NOT NULL,
  "rating" int NOT NULL,
  PRIMARY KEY  ("id")
);

CREATE SEQUENCE public.groups_seq START 100;
CREATE TABLE "Group" (
  "id" int NOT NULL DEFAULT nextval('public.groups_seq'),
  "name" varchar(50) NOT NULL,
  PRIMARY KEY  ("id")
);

CREATE TABLE "Membership" (
  "userId" int NOT NULL,
  "groupId" int NOT NULL,
  PRIMARY KEY  ("userId","groupId")
);

CREATE SEQUENCE public.membership_statuses_seq START 100;
CREATE TABLE "MembershipStatus" (
  "id" int NOT NULL DEFAULT nextval('public.membership_statuses_seq'),
  "userId" int NOT NULL,
  "groupId" int NOT NULL,
  "status" varchar(50) NOT NULL,
  PRIMARY KEY ("id")
);

CREATE TABLE "Department" (
  "departmentId" int NOT NULL,
  "locationId" int NOT NULL,
  PRIMARY KEY ("departmentId", "locationId")
);

CREATE TABLE "Employee" (
 "id" int NOT NULL,
 "departmentId" int DEFAULT NULL,
 "locationId" int DEFAULT NULL,
 PRIMARY KEY ("id")
);

CREATE TABLE "Comment" (
	"id" int NOT NULL,
	"personId" varchar(100) DEFAULT NULL,
	"personType" varchar(100) DEFAULT NULL,
	"hackId" varchar(100) DEFAULT NULL,
	PRIMARY KEY ("id")
);

CREATE TABLE "Hack" (
 "name" varchar(50) NOT NULL,
 PRIMARY KEY ("name")
);

CREATE TABLE "KitchenSink" (
	"id1" int not null,
	"id2" int not null,
	"aDate" date,
	"aString" varchar(100),
	primary key ("id1", "id2")
);

CREATE TABLE "Restaurant" (
	"franchiseId" int not null,
	"storeId" int not null,
	"name" varchar(100),
	primary key ("franchiseId", "storeId")
);

CREATE TABLE "RestaurantSuburb" (
	"franchiseId" int not null,
	"storeId" int not null,
	"cityId" int not null,
	"suburbId" int not null
);

CREATE SEQUENCE public.dorms_seq START 100;
CREATE TABLE "Dorm" (
	"id" int not null DEFAULT nextval('public.dorms_seq'),
	primary key("id")
);

CREATE TABLE "Room" (
	"dormId" int not null,
	"roomId" int not null,
	primary key ("dormId", "roomId")
);

CREATE SEQUENCE public.room_attributes_seq START 100;
CREATE TABLE "RoomAttribute" (
	"id" int not null DEFAULT nextval('public.room_attributes_seq'),
	"name" varchar(50),
	primary key("id")
);

CREATE TABLE "RoomAttributeAssignment" (
	"dormId" int not null,
	"roomId" int not null,
	"roomAttributeId" int not null
);

CREATE SEQUENCE public.students_seq START 100;
CREATE TABLE "Student" (
	"id" int not null DEFAULT nextval('public.students_seq'),
	primary key("id")
);

CREATE TABLE "RoomAssignment" (
	"studentId" int not null,
	"dormId" int not null,
	"roomId" int not null
);

