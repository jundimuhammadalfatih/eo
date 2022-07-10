-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: db_eo
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `daftar`
--

DROP TABLE IF EXISTS `daftar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `daftar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tanggal_daftar` date DEFAULT NULL,
  `alasan` varchar(200) DEFAULT NULL,
  `users_id` int NOT NULL,
  `kegiatan_id` int NOT NULL,
  `kategori_peserta_id` int NOT NULL,
  `nosertifikat` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pesanan_users1_idx` (`users_id`),
  KEY `fk_pesanan_produk1_idx` (`kegiatan_id`),
  KEY `fk_daftar_kategori_peserta1_idx` (`kategori_peserta_id`),
  CONSTRAINT `fk_daftar_kategori_peserta1` FOREIGN KEY (`kategori_peserta_id`) REFERENCES `kategori_peserta` (`id`),
  CONSTRAINT `fk_pesanan_produk1` FOREIGN KEY (`kegiatan_id`) REFERENCES `kegiatan` (`id`),
  CONSTRAINT `fk_pesanan_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `daftar`
--

LOCK TABLES `daftar` WRITE;
/*!40000 ALTER TABLE `daftar` DISABLE KEYS */;
INSERT INTO `daftar` VALUES (5,'2022-07-10','Menambah wawasan',2,1,2,'S-2022-I-001');
/*!40000 ALTER TABLE `daftar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jenis_kegiatan`
--

DROP TABLE IF EXISTS `jenis_kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jenis_kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jenis_kegiatan`
--

LOCK TABLES `jenis_kegiatan` WRITE;
/*!40000 ALTER TABLE `jenis_kegiatan` DISABLE KEYS */;
INSERT INTO `jenis_kegiatan` VALUES (1,'Seminar'),(2,'Workshop'),(3,'Event Olah Raga'),(4,'Bazaar'),(5,'Pelatihan');
/*!40000 ALTER TABLE `jenis_kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kategori_peserta`
--

DROP TABLE IF EXISTS `kategori_peserta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kategori_peserta` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori_peserta`
--

LOCK TABLES `kategori_peserta` WRITE;
/*!40000 ALTER TABLE `kategori_peserta` DISABLE KEYS */;
INSERT INTO `kategori_peserta` VALUES (1,'Pelajar'),(2,'Mahasiswa'),(3,'Karyawan Swasta'),(4,'Guru/Dosen'),(5,'Umum'),(6,'ASN');
/*!40000 ALTER TABLE `kategori_peserta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kegiatan`
--

DROP TABLE IF EXISTS `kegiatan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kegiatan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `judul` varchar(200) DEFAULT NULL,
  `kapasitas` int DEFAULT NULL,
  `harga_tiket` double DEFAULT NULL,
  `tanggal` date DEFAULT NULL,
  `narasumber` varchar(200) DEFAULT NULL,
  `tempat` varchar(100) DEFAULT NULL,
  `pic` varchar(45) DEFAULT NULL,
  `foto_flyer` varchar(30) DEFAULT NULL,
  `jenis_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produk_jenis_produk_idx` (`jenis_id`),
  CONSTRAINT `fk_produk_jenis_produk` FOREIGN KEY (`jenis_id`) REFERENCES `jenis_kegiatan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kegiatan`
--

LOCK TABLES `kegiatan` WRITE;
/*!40000 ALTER TABLE `kegiatan` DISABLE KEYS */;
INSERT INTO `kegiatan` VALUES (1,'Seminar Sukses Kuliah di Luar Negeri',100,25000,'2022-06-30','Dr. Seto Waluyo, Dr. Annisa PhD, Misna Azqia M.Kom','Aula Kampus B2 STT-NF','ahmad fathan','seminar1.jpg',1);
/*!40000 ALTER TABLE `kegiatan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `status` smallint DEFAULT NULL,
  `role` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2y$10$MwPlDlN4F8UKkATFM6Mi8.Cd.MD24mBTrJslt4jhnW4FBP5Tf8QHS','admin@gmail.com','2022-06-12 00:07:42','2022-07-10 07:38:58',1,'administrator'),(2,'user','$2y$10$a4DraPvFJD4EE4ASCD7MluyOvHQj.dqVG5V0xt7czrhbXIw1ULl9u','user@gmail.com','2022-07-10 06:57:50','2022-07-10 07:42:38',1,'public');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-10 20:25:27
