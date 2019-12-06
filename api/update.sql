create table addresses (id  bigserial not null, cep varchar(255) not null, city varchar(255) not null, complement varchar(255), number varchar(255) not null, street varchar(255) not null, uf varchar(2) not null, primary key (id))
create table customers (id  bigserial not null, cpf varchar(255) not null, email varchar(255) not null, name varchar(255) not null, phone varchar(255) not null, type varchar(255) not null, address_id int8 not null, primary key (id))
create table pets (id  bigserial not null, birth_date date not null, name varchar(255) not null, specie varchar(255) not null, weight float8 not null, customer_id int8, primary key (id))
alter table customers add constraint FKm07rwxbyxjv8r4fcye1ff6rmq foreign key (address_id) references addresses
alter table pets add constraint FKhili9xtogoo1wl2rx11t95u2e foreign key (customer_id) references customers
