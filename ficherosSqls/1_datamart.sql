CREATE TABLE producto(
    id NUMBER,
    codProducto VARCHAR2(50),
    nombreProducto VARCHAR2(150)
);

ALTER TABLE PRODUCTO ADD CONSTRAINT STG_PRODUCTO_pk PRIMARY KEY ( id );

CREATE TABLE CLIENTE(
    id NUMBER,
    codCliente VARCHAR2(50),
    nombreCliente VARCHAR2(150)
);

ALTER TABLE CLIENTE ADD CONSTRAINT STG_CLIENTE_pk PRIMARY KEY ( id );

CREATE TABLE SEGMENTO(
    id NUMBER,
    nombreSegmento VARCHAR2(150)
);

ALTER TABLE SEGMENTO ADD CONSTRAINT STG_SEGMENTO_pk PRIMARY KEY ( id );



CREATE TABLE METODOENVIO(
    id NUMBER,
    nombreMetodoEnvio VARCHAR2(150)
);

ALTER TABLE METODOENVIO ADD CONSTRAINT STG_METODOENVIO_pk PRIMARY KEY ( id );



CREATE TABLE FECHA(
    id NUMBER,
    dia NUMBER,
    mes NUMBER,
    anio NUMBER);

ALTER TABLE FECHA ADD CONSTRAINT STG_FECHA_pk PRIMARY KEY ( id );


CREATE TABLE ventas (
    id_tiempo       INTEGER NOT NULL,
    id_producto     INTEGER NOT NULL,
    id_metodoEnvio  INTEGER NOT NULL,
    id_segmento     INTEGER NOT NULL,
    id_cliente      INTEGER NOT NULL,
    cantVentas      INTEGER,
    precio          NUMBER(12,2)
   );

ALTER TABLE ventas ADD CONSTRAINT fac_dev_dim_prod_fk FOREIGN KEY ( id_producto )
    REFERENCES producto ( id );

ALTER TABLE ventas ADD CONSTRAINT fac_dev_dim_tiempo_fk FOREIGN KEY ( id_tiempo )
    REFERENCES FECHA ( id );

ALTER TABLE ventas ADD CONSTRAINT fac_ven_dim_seg_fk FOREIGN KEY ( id_segmento )
    REFERENCES SEGMENTO ( id );

ALTER TABLE ventas ADD CONSTRAINT fac_ven_dim_metEnvio_fk FOREIGN KEY ( id_metodoEnvio )
    REFERENCES METODOENVIO ( id );

ALTER TABLE ventas ADD CONSTRAINT fac_ven_dim_cliente_fk FOREIGN KEY ( id_cliente )
    REFERENCES CLIENTE ( id );
