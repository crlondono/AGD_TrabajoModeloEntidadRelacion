BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "Comunas_Medellin" (
	"CODIGO_COMUNA"	INTEGER NOT NULL,
	"NOMBRE_COMUNA"	TEXT,
	PRIMARY KEY("CODIGO_COMUNA")
);
CREATE TABLE IF NOT EXISTS "Barrios_Medellin" (
	"CODIGO_COMUNA"	INTEGER NOT NULL DEFAULT 0,
	"CODIGO_BARRIO"	INTEGER NOT NULL DEFAULT 0,
	"NOMBRE_BARRIO"	TEXT,
	PRIMARY KEY("CODIGO_COMUNA","CODIGO_BARRIO"),
	FOREIGN KEY("CODIGO_COMUNA") REFERENCES "Comunas_Medellin"("CODIGO_COMUNA")
);
CREATE TABLE IF NOT EXISTS "Tipo_Hecho" (
	"TIPO_HECHO"	INTEGER NOT NULL DEFAULT 1,
	"DESCRIPCION"	TEXT,
	PRIMARY KEY("TIPO_HECHO")
);
CREATE TABLE IF NOT EXISTS "Meses" (
	"MES"	INTEGER NOT NULL DEFAULT 1,
	"DESCRIPCION"	TEXT,
	PRIMARY KEY("MES")
);
CREATE TABLE IF NOT EXISTS "Dias" (
	"DIA"	INTEGER NOT NULL DEFAULT 1,
	"DESCRIPCION"	TEXT,
	PRIMARY KEY("DIA")
);
CREATE TABLE IF NOT EXISTS "Sexos" (
	"CODIGO_SEXO"	TEXT DEFAULT 'M',
	"DESCRIPCION"	TEXT,
	PRIMARY KEY("CODIGO_SEXO")
);
CREATE TABLE IF NOT EXISTS "Dimension_Tiempo" (
	"FECHA"	TEXT,
	"DIA"	INTEGER NOT NULL DEFAULT 1,
	"MES"	INTEGER NOT NULL DEFAULT 1,
	"ANIO"	INTEGER,
	PRIMARY KEY("FECHA"),
	FOREIGN KEY("MES") REFERENCES "Meses"("MES"),
	FOREIGN KEY("DIA") REFERENCES "Dias"("DIA")
);
CREATE TABLE IF NOT EXISTS "Hechos_Delictivos" (
	"ID"	INTEGER NOT NULL UNIQUE,
	"FECHA_HECHO"	TEXT NOT NULL,
	"TIPO_HECHO"	INTEGER NOT NULL DEFAULT 1,
	"CODIGO_SEXO"	TEXT NOT NULL DEFAULT 'M',
	"EDAD"	INTEGER,
	"MODALIDAD"	TEXT,
	"OCUPACION"	TEXT,
	"CODIGO_COMUNA"	INTEGER NOT NULL DEFAULT 0,
	"CODIGO_BARRIO"	INTEGER NOT NULL DEFAULT 0,
	"BIEN"	TEXT,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("CODIGO_SEXO") REFERENCES "Sexos"("CODIGO_SEXO"),
	FOREIGN KEY("CODIGO_COMUNA","CODIGO_BARRIO") REFERENCES "Barrios_Medellin"("CODIGO_COMUNA","CODIGO_BARRIO"),
	FOREIGN KEY("TIPO_HECHO") REFERENCES "Tipo_Hecho"("TIPO_HECHO"),
	FOREIGN KEY("FECHA_HECHO") REFERENCES "Dimension_Tiempo"("FECHA")
);
CREATE TABLE IF NOT EXISTS "Casos_Covid_Medellin" (
	"ID"	INTEGER NOT NULL,
	"CODIGO_SEXO"	TEXT NOT NULL DEFAULT 'M',
	"CODIGO_COMUNA"	INTEGER NOT NULL DEFAULT 0,
	"EDAD"	INTEGER,
	"FECHA_INICIO_CASO"	TEXT,
	"FECHA_FIN_CASO"	TEXT,
	PRIMARY KEY("ID" AUTOINCREMENT),
	FOREIGN KEY("CODIGO_SEXO") REFERENCES "Sexos"("CODIGO_SEXO"),
	FOREIGN KEY("CODIGO_COMUNA") REFERENCES "Comunas_Medellin"("CODIGO_COMUNA"),
	FOREIGN KEY("FECHA_FIN_CASO") REFERENCES "Dimension_Tiempo"("FECHA"),
	FOREIGN KEY("FECHA_INICIO_CASO") REFERENCES "Dimension_Tiempo"("FECHA")
);