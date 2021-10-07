
psql --username kimchi databasename
create user customer with encrypted password 'customer';

CREATE TABLE customer (
    ID SERIAL PRIMARY KEY, 
    NAME TEXT NOT NULL, 
    PASSWORD TEXT NOT NULL);
    
CREATE TABLE account (
    id SERIAL PRIMARY KEY, 
    customer_id SERIAL NOT NULL,
    currency TEXT NOT NULL, 
    is_deleted BOOLEAN NOT NULL,
    date timestamp NOT NULL,
     CONSTRAINT fk_customer
      FOREIGN KEY(customer_id) 
	  REFERENCES customer(id));

CREATE TABLE deal (
    id SERIAL PRIMARY KEY, 
    emitter_id SERIAL NOT NULL,
    receiver_id SERIAL NOT NULL, 
    date timestamp NOT NULL,
    emitted_amount decimal NOT NULL,
    received_amount decimal NOT NULL,
    emitted_currency TEXT NOT NULL,
    received_currency TEXT NOT NULL,
    rate decimal NOT NULL,
    CONSTRAINT fk_emitter
      FOREIGN KEY(emitter_id) 
	  REFERENCES account(id),
    CONSTRAINT fk_received
      FOREIGN KEY(receiver_id) 
	  REFERENCES account(id));

CREATE TABLE withdraw (
    id SERIAL PRIMARY KEY, 
    account_id SERIAL NOT NULL,
    date timestamp NOT NULL,
    amount decimal NOT NULL,
    CONSTRAINT fk_emitter
        FOREIGN KEY(account_id) 
        REFERENCES account(id));

CREATE TABLE deposit(
    id SERIAL PRIMARY KEY, 
    account_id SERIAL NOT NULL,
    date timestamp NOT NULL,
    amount decimal NOT NULL,
    CONSTRAINT fk_emitter
        FOREIGN KEY(account_id) 
        REFERENCES account(id));

--get access
GRANT SELECT, INSERT, UPDATE ON ALL TABLES IN SCHEMA public TO customer;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO customer;