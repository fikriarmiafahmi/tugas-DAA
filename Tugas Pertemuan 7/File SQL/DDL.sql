-- Nama Aggota Kelompok:
-- Fikri Armia Fahmi (2023071018)
-- Dava Ferdian Hadiputra (2023071021)

-- Sistem Pendaftaran Oracle Internasional School --

CREATE DATABASE Pendaftaran_OIS;
USE Pendaftaran_OIS;

CREATE TABLE formulir_pendaftaran (
	no_pendaftaran INT PRIMARY KEY,
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN
);

CREATE TABLE data_siswa (
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_siswa varchar(20)
);

TRUNCATE data_calon_siswa;
CREATE TABLE data_calon_siswa (
	no_pendaftaran INT PRIMARY KEY,
	nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN DEFAULT FALSE
);

CREATE TABLE data_pembayaran (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    status_pembayaran BOOLEAN,
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE bank (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    status_pembayaran BOOLEAN,
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE ketua_yayasan(
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN,
    nilai_test DECIMAL(5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);
    
    
CREATE TABLE kepala_sekolah (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    ktp varchar(50),
    gender varchar(50),
    tgl_lahir DATE,
    alamat varchar(50),
    status_pembayaran BOOLEAN,
    nilai_test DECIMAL(5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE hasil_test (
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100),
    nilai DECIMAL (5, 2),
    FOREIGN KEY (no_pendaftaran) REFERENCES data_calon_siswa(no_pendaftaran)
);

CREATE TABLE laporan (
	tanggal DATE,
	no_pendaftaran INT PRIMARY KEY,
    nama varchar(100)
);