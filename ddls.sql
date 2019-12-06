{\rtf1\ansi\ansicpg1252\cocoartf2511
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica-Bold;\f1\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;\red128\green0\blue0;\red0\green0\blue128;\red0\green0\blue255;
\red255\green0\blue0;}
{\*\expandedcolortbl;;\csgenericrgb\c50196\c0\c0;\csgenericrgb\c0\c0\c50196;\csgenericrgb\c0\c0\c100000;
\csgenericrgb\c100000\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\b\fs24 \cf2 create
\f1\b0 \cf0  
\f0\b \cf2 table
\f1\b0 \cf0  addresses (id  
\f0\b \cf3 bigserial
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , cep 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , city 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , complement 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ), 
\f0\b \cf2 number
\f1\b0 \cf0  
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , street 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , uf 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 2\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , 
\f0\b \cf2 primary
\f1\b0 \cf0  
\f0\b \cf2 key
\f1\b0 \cf0  (id))\cf5 ;\cf0 \

\f0\b \cf2 create
\f1\b0 \cf0  
\f0\b \cf2 table
\f1\b0 \cf0  customers (id  
\f0\b \cf3 bigserial
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , cpf 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , email 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , 
\f0\b \cf3 name
\f1\b0 \cf0  
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , phone 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , 
\f0\b \cf2 type
\f1\b0 \cf0  
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , address_id 
\f0\b \cf3 int8
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , 
\f0\b \cf2 primary
\f1\b0 \cf0  
\f0\b \cf2 key
\f1\b0 \cf0  (id))\cf5 ;\cf0 \

\f0\b \cf2 create
\f1\b0 \cf0  
\f0\b \cf2 table
\f1\b0 \cf0  pets (id  
\f0\b \cf3 bigserial
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , birth_date 
\f0\b \cf3 date
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , 
\f0\b \cf3 name
\f1\b0 \cf0  
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , specie 
\f0\b \cf3 varchar
\f1\b0 \cf0 (\cf4 255\cf0 ) 
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , weight 
\f0\b \cf3 float8
\f1\b0 \cf0  
\f0\b \cf2 not
\f1\b0 \cf0  
\f0\b \cf2 null
\f1\b0 \cf0 , customer_id 
\f0\b \cf3 int8
\f1\b0 \cf0 , 
\f0\b \cf2 primary
\f1\b0 \cf0  
\f0\b \cf2 key
\f1\b0 \cf0  (id))\cf5 ;\cf0 \

\f0\b \cf2 alter
\f1\b0 \cf0  
\f0\b \cf2 table
\f1\b0 \cf0  customers 
\f0\b \cf2 add
\f1\b0 \cf0  
\f0\b \cf2 constraint
\f1\b0 \cf0  FKm07rwxbyxjv8r4fcye1ff6rmq 
\f0\b \cf2 foreign
\f1\b0 \cf0  
\f0\b \cf2 key
\f1\b0 \cf0  (address_id) 
\f0\b \cf2 references
\f1\b0 \cf0  addresses\cf5 ;\cf0 \

\f0\b \cf2 alter
\f1\b0 \cf0  
\f0\b \cf2 table
\f1\b0 \cf0  pets 
\f0\b \cf2 add
\f1\b0 \cf0  
\f0\b \cf2 constraint
\f1\b0 \cf0  FKhili9xtogoo1wl2rx11t95u2e 
\f0\b \cf2 foreign
\f1\b0 \cf0  
\f0\b \cf2 key
\f1\b0 \cf0  (customer_id) 
\f0\b \cf2 references
\f1\b0 \cf0  customers\cf5 ;\cf0 \
}