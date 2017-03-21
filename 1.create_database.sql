-- Database: bd_clientes

-- DROP DATABASE bd_clientes;

CREATE DATABASE bd_clientes
  WITH OWNER = postgres
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.utf8'
       LC_CTYPE = 'en_US.utf8'
       CONNECTION LIMIT = -1;

\connect bd_clientes

-- Table: public.customer

-- DROP TABLE public.customer;

CREATE TABLE public.customer
(
  custid text NOT NULL,
  fname text NOT NULL,
  phonenumber text,
  lname text,
  email text,
  password text,
  creditcardtype text,
  creditcardnumber text,
  status text,
  CONSTRAINT customer_pkey PRIMARY KEY (custid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer
  OWNER TO postgres;

-- Table: public.address

-- DROP TABLE public.address;

CREATE TABLE public.address
(
  street text,
  state text,
  zip text,
  country text,
  addresstype text,
  addrid text NOT NULL,
  city text,
  CONSTRAINT address_pk PRIMARY KEY (addrid)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.address
  OWNER TO postgres;

-- Table: public.customer_address

-- DROP TABLE public.customer_address;

CREATE TABLE public.customer_address
(
  custid text NOT NULL,
  addressid text NOT NULL,
  CONSTRAINT customer_address_pk PRIMARY KEY (custid, addressid),
  CONSTRAINT address_fk FOREIGN KEY (addressid)
      REFERENCES public.address (addrid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
  CONSTRAINT customer_fk FOREIGN KEY (custid)
      REFERENCES public.customer (custid) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.customer_address
  OWNER TO postgres;
