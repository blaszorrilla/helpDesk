/*
SQLyog Ultimate v12.3.2 (64 bit)
MySQL - 5.5.28 : Database - junta_tesis
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`junta_tesis` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `junta_tesis`;

/*Table structure for table `acceso` */

DROP TABLE IF EXISTS `acceso`;

CREATE TABLE `acceso` (
  `id_acceso` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `pass` text NOT NULL,
  `estado` bit(1) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_acceso`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `acceso_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `acceso` */

insert  into `acceso`(`id_acceso`,`usuario`,`pass`,`estado`,`ci_personal`) values 
(1,'ADMIN','$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly','',1234567),
(2,'Marta','$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy','\0',2233114),
(3,'Mar','$2a$07$asxx54ahjppf45sd87a5auGZEtGHuyZwm.Ur.FJvWLCql3nmsMbXy','\0',2233114),
(4,'Mart','$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly','',2233114),
(5,'Ruben','$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly','',4215421),
(6,'Ramon','$2a$07$asxx54ahjppf45sd87a5auFL5K1.Cmt9ZheoVVuudOi5BCi10qWly','',5421456);

/*Table structure for table `ajuste` */

DROP TABLE IF EXISTS `ajuste`;

CREATE TABLE `ajuste` (
  `id_ajuste` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` bit(1) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  `cod_barra` varchar(20) NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`id_ajuste`),
  KEY `ci_personal` (`ci_personal`),
  KEY `cod_barra` (`cod_barra`),
  CONSTRAINT `ajuste_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE,
  CONSTRAINT `ajuste_ibfk_2` FOREIGN KEY (`cod_barra`) REFERENCES `producto` (`cod_barra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ajuste` */

insert  into `ajuste`(`id_ajuste`,`fecha`,`tipo`,`descripcion`,`ci_personal`,`cod_barra`,`cantidad`) values 
(1,'2019-11-01 17:11:31','','inicial',1234567,'123123',102),
(2,'2019-11-26 20:14:52','','encontro en la calle',1234567,'4565',20);

/*Table structure for table `banco` */

DROP TABLE IF EXISTS `banco`;

CREATE TABLE `banco` (
  `id_banco` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id_banco`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `banco` */

insert  into `banco`(`id_banco`,`nombre`) values 
(1,'COOPERATIVA SAN FLORIAN');

/*Table structure for table `barrio` */

DROP TABLE IF EXISTS `barrio`;

CREATE TABLE `barrio` (
  `nombre_barrio` varchar(70) NOT NULL,
  `id_barrio` int(11) NOT NULL,
  PRIMARY KEY (`id_barrio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `barrio` */

insert  into `barrio`(`nombre_barrio`,`id_barrio`) values 
('Centro',1),
('nombre barrio',2);

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id_caja` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  PRIMARY KEY (`id_caja`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `caja` */

insert  into `caja`(`id_caja`,`descripcion`) values 
(1,'Central');

/*Table structure for table `cierre` */

DROP TABLE IF EXISTS `cierre`;

CREATE TABLE `cierre` (
  `id_cierre` int(11) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `efectivo_caja` int(11) NOT NULL,
  `nro_deposito` int(11) NOT NULL,
  `nro_cuenta_banco` varchar(20) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `id_inicio_cierre` int(11) NOT NULL,
  `cheque_caja` int(11) NOT NULL,
  PRIMARY KEY (`id_cierre`),
  KEY `ci_personal` (`ci_personal`),
  KEY `nro_deposito` (`nro_deposito`,`nro_cuenta_banco`,`id_banco`),
  KEY `id_inicio_cierre` (`id_inicio_cierre`),
  CONSTRAINT `cierre_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE,
  CONSTRAINT `cierre_ibfk_2` FOREIGN KEY (`nro_deposito`, `nro_cuenta_banco`, `id_banco`) REFERENCES `deposito` (`nro_deposito`, `nro_cuenta_banco`, `id_banco`) ON UPDATE CASCADE,
  CONSTRAINT `cierre_ibfk_3` FOREIGN KEY (`id_inicio_cierre`) REFERENCES `inicio_cierre` (`id_inicio_cierre`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cierre` */

insert  into `cierre`(`id_cierre`,`ci_personal`,`fecha`,`efectivo_caja`,`nro_deposito`,`nro_cuenta_banco`,`id_banco`,`id_inicio_cierre`,`cheque_caja`) values 
(1,1234567,'2019-11-24 19:25:10',1000000,123,'2238-001/51',1,1,317000),
(2,1234567,'2019-11-25 19:32:47',815800,234,'2238-001/51',1,2,0);

/*Table structure for table `cierre_cobro` */

DROP TABLE IF EXISTS `cierre_cobro`;

CREATE TABLE `cierre_cobro` (
  `id_cierre` int(11) NOT NULL,
  `id_cobro` int(11) NOT NULL,
  PRIMARY KEY (`id_cierre`,`id_cobro`),
  KEY `id_cobro` (`id_cobro`),
  CONSTRAINT `cierre_cobro_ibfk_1` FOREIGN KEY (`id_cobro`) REFERENCES `cobro` (`id_cobro`) ON UPDATE CASCADE,
  CONSTRAINT `cierre_cobro_ibfk_2` FOREIGN KEY (`id_cierre`) REFERENCES `cierre` (`id_cierre`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cierre_cobro` */

insert  into `cierre_cobro`(`id_cierre`,`id_cobro`) values 
(1,1),
(1,2),
(1,3),
(1,4),
(1,5),
(1,6),
(1,7),
(1,8),
(1,9),
(1,10),
(1,11),
(1,12),
(2,13),
(2,14),
(2,15);

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `ci_cliente` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  PRIMARY KEY (`ci_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cliente` */

insert  into `cliente`(`ci_cliente`,`nombre`,`apellido`) values 
('123','Cliente De','Prueba'),
('1247585','Camila','Gonzalez'),
('4487212','Maria','Perez'),
('4564567','Juan','Perez');

/*Table structure for table `cobro` */

DROP TABLE IF EXISTS `cobro`;

CREATE TABLE `cobro` (
  `id_cobro` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  `tipo_cobro` varchar(10) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  `id_caja` int(11) NOT NULL,
  PRIMARY KEY (`id_cobro`),
  KEY `numero_factura` (`numero_factura`,`id_factura`),
  KEY `ci_personal` (`ci_personal`),
  KEY `id_caja` (`id_caja`),
  CONSTRAINT `cobro_ibfk_1` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE,
  CONSTRAINT `cobro_ibfk_2` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE,
  CONSTRAINT `cobro_ibfk_3` FOREIGN KEY (`id_caja`) REFERENCES `caja` (`id_caja`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobro` */

insert  into `cobro`(`id_cobro`,`fecha`,`monto`,`tipo_cobro`,`numero_factura`,`id_factura`,`ci_personal`,`id_caja`) values 
(1,'2019-11-22',30000,'CHEQUE',2,1,1234567,1),
(2,'2019-11-22',50300,'EFECTIVO',3,1,1234567,1),
(3,'2019-11-22',15000,'EFECTIVO',7,1,1234567,1),
(4,'2019-11-22',100000,'CHEQUE',7,1,1234567,1),
(5,'2019-11-22',150000,'EFECTIVO',7,1,1234567,1),
(6,'2019-11-22',50000,'EFECTIVO',7,1,1234567,1),
(7,'2019-11-22',100000,'CHEQUE',7,1,1234567,1),
(8,'2019-11-22',50000,'EFECTIVO',7,1,1234567,1),
(9,'2019-11-22',150000,'EFECTIVO',7,1,1234567,1),
(10,'2019-11-22',44300,'CHEQUE',4,1,1234567,1),
(11,'2019-11-22',44700,'EFECTIVO',5,1,1234567,1),
(12,'2019-11-22',33600,'EFECTIVO',6,1,1234567,1),
(13,'2019-11-25',116900,'EFECTIVO',12,1,1234567,1),
(14,'2019-11-25',109700,'EFECTIVO',13,1,1234567,1),
(15,'2019-11-25',89200,'EFECTIVO',14,1,1234567,1),
(16,'2019-11-26',134200,'EFECTIVO',15,1,1234567,1);

/*Table structure for table `cobro_cheque` */

DROP TABLE IF EXISTS `cobro_cheque`;

CREATE TABLE `cobro_cheque` (
  `id_cobro` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `banco` varchar(40) NOT NULL,
  `nro_cheque` int(11) NOT NULL,
  PRIMARY KEY (`id_cobro`),
  CONSTRAINT `cobro_cheque_ibfk_1` FOREIGN KEY (`id_cobro`) REFERENCES `cobro` (`id_cobro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobro_cheque` */

insert  into `cobro_cheque`(`id_cobro`,`monto`,`banco`,`nro_cheque`) values 
(1,30000,'Vision',2123),
(4,100000,'Vision',254225),
(7,100000,'VisiÃ³n',423231),
(10,44300,'Rio',423);

/*Table structure for table `compra` */

DROP TABLE IF EXISTS `compra`;

CREATE TABLE `compra` (
  `nro_boleta` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `condicion` varchar(10) NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`nro_boleta`,`id_pedido`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `compra` */

insert  into `compra`(`nro_boleta`,`fecha`,`id_pedido`,`condicion`,`estado`) values 
('001-001-0000025','2019-11-27',4,'CONTADO','ACTIVO'),
('001-001-0002547','2019-11-11',1,'CONTADO','ANULADO'),
('001-001-0012312','2019-11-12',3,'CONTADO','ANULADO'),
('001-002-0023123','2019-11-13',1,'CONTADO','ANULADO'),
('001-002-0023123','2019-11-12',3,'CONTADO','ANULADO'),
('001-003-5465465','2019-11-12',3,'CONTADO','PAGADO');

/*Table structure for table `conexion` */

DROP TABLE IF EXISTS `conexion`;

CREATE TABLE `conexion` (
  `cta_cte_catastral` varchar(15) NOT NULL,
  `fecha` date NOT NULL,
  `estado` bit(1) NOT NULL,
  `lectura_inicial` int(11) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  PRIMARY KEY (`cta_cte_catastral`,`id_medidor`),
  KEY `id_medidor` (`id_medidor`),
  CONSTRAINT `conexion_ibfk_1` FOREIGN KEY (`cta_cte_catastral`) REFERENCES `finca` (`cta_cte_catastral`) ON UPDATE CASCADE,
  CONSTRAINT `conexion_ibfk_2` FOREIGN KEY (`id_medidor`) REFERENCES `medidor` (`id_medidor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conexion` */

insert  into `conexion`(`cta_cte_catastral`,`fecha`,`estado`,`lectura_inicial`,`id_medidor`) values 
('097','2019-11-15','',30,6),
('1111','2019-10-12','',30,3),
('1147','2019-11-15','',30,5),
('123','2019-10-10','',5000,1),
('466','2019-10-11','',2,2);

/*Table structure for table `conexion_servicio` */

DROP TABLE IF EXISTS `conexion_servicio`;

CREATE TABLE `conexion_servicio` (
  `estado` bit(1) NOT NULL,
  `fecha` date NOT NULL,
  `id_servicio` int(11) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  `id_conexion_servicio` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id_conexion_servicio`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`,`id_medidor`),
  KEY `id_servicio` (`id_servicio`),
  CONSTRAINT `conexion_servicio_ibfk_1` FOREIGN KEY (`cta_cte_catastral`, `id_medidor`) REFERENCES `conexion` (`cta_cte_catastral`, `id_medidor`) ON UPDATE CASCADE,
  CONSTRAINT `conexion_servicio_ibfk_2` FOREIGN KEY (`id_servicio`) REFERENCES `servicio` (`id_servicio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `conexion_servicio` */

/*Table structure for table `contrato` */

DROP TABLE IF EXISTS `contrato`;

CREATE TABLE `contrato` (
  `id_contrato` int(11) NOT NULL,
  `descripcion` text NOT NULL,
  `estado` varchar(10) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  `ci_cliente` varchar(20) NOT NULL,
  PRIMARY KEY (`id_contrato`),
  KEY `ci_cliente` (`ci_cliente`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`,`id_medidor`),
  CONSTRAINT `contrato_ibfk_1` FOREIGN KEY (`ci_cliente`) REFERENCES `cliente` (`ci_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `contrato_ibfk_2` FOREIGN KEY (`cta_cte_catastral`, `id_medidor`) REFERENCES `conexion` (`cta_cte_catastral`, `id_medidor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `contrato` */

insert  into `contrato`(`id_contrato`,`descripcion`,`estado`,`cta_cte_catastral`,`id_medidor`,`ci_cliente`) values 
(1,'contrato ','ACTIVO','1111',3,'4564567'),
(2,'contrato','ACTIVO','1147',5,'123'),
(3,'contrato','ACTIVO','123',1,'4564567'),
(4,'contrato','ACTIVO','466',2,'123'),
(5,'contrato','ACTIVO','097',6,'4487212');

/*Table structure for table `cuenta_banco` */

DROP TABLE IF EXISTS `cuenta_banco`;

CREATE TABLE `cuenta_banco` (
  `nro_cuenta_banco` varchar(20) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`nro_cuenta_banco`,`id_banco`),
  KEY `id_banco` (`id_banco`),
  CONSTRAINT `cuenta_banco_ibfk_1` FOREIGN KEY (`id_banco`) REFERENCES `banco` (`id_banco`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cuenta_banco` */

insert  into `cuenta_banco`(`nro_cuenta_banco`,`id_banco`,`estado`) values 
('2238-001/51',1,'');

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `nro_deposito` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nro_cuenta_banco` varchar(20) NOT NULL,
  `id_banco` int(11) NOT NULL,
  PRIMARY KEY (`nro_deposito`,`nro_cuenta_banco`,`id_banco`),
  KEY `nro_cuenta_banco` (`nro_cuenta_banco`,`id_banco`),
  CONSTRAINT `deposito_ibfk_1` FOREIGN KEY (`nro_cuenta_banco`, `id_banco`) REFERENCES `cuenta_banco` (`nro_cuenta_banco`, `id_banco`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposito` */

insert  into `deposito`(`nro_deposito`,`fecha`,`monto`,`estado`,`nro_cuenta_banco`,`id_banco`) values 
(123,'2019-11-24',817900,'','2238-001/51',1),
(234,'2019-11-25',315800,'','2238-001/51',1);

/*Table structure for table `deuda` */

DROP TABLE IF EXISTS `deuda`;

CREATE TABLE `deuda` (
  `id_deuda` int(11) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_deuda`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`),
  CONSTRAINT `deuda_ibfk_1` FOREIGN KEY (`cta_cte_catastral`) REFERENCES `finca` (`cta_cte_catastral`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deuda` */

insert  into `deuda`(`id_deuda`,`cta_cte_catastral`,`descripcion`,`estado`) values 
(1,'466','ULTIMO AVISO','\0'),
(2,'1111','ULTIMO AVISO','\0'),
(3,'123','ULTIMO AVISO','\0'),
(4,'466','DESCONEXION','\0'),
(5,'1147','ULTIMO AVISO','\0');

/*Table structure for table `deuda_factura` */

DROP TABLE IF EXISTS `deuda_factura`;

CREATE TABLE `deuda_factura` (
  `nro_factura` varchar(20) NOT NULL,
  `monto` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `id_deuda` int(11) NOT NULL,
  PRIMARY KEY (`nro_factura`),
  KEY `id_deuda` (`id_deuda`),
  CONSTRAINT `deuda_factura_ibfk_1` FOREIGN KEY (`id_deuda`) REFERENCES `deuda` (`id_deuda`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deuda_factura` */

insert  into `deuda_factura`(`nro_factura`,`monto`,`vencimiento`,`id_deuda`) values 
('001-001-0000001',34000,'2019-11-01',1),
('001-001-0000008',85600,'2019-12-29',2),
('001-001-0000009',53700,'2019-12-29',3),
('001-001-0000010',554800,'2019-12-29',4),
('001-001-0000011',22400,'2019-12-29',5);

/*Table structure for table `estado_conexion` */

DROP TABLE IF EXISTS `estado_conexion`;

CREATE TABLE `estado_conexion` (
  `id_estado_conexion` int(11) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `lectura` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_estado_conexion`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`,`id_medidor`),
  CONSTRAINT `estado_conexion_ibfk_1` FOREIGN KEY (`cta_cte_catastral`, `id_medidor`) REFERENCES `conexion` (`cta_cte_catastral`, `id_medidor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `estado_conexion` */

insert  into `estado_conexion`(`id_estado_conexion`,`cta_cte_catastral`,`id_medidor`,`fecha`,`tipo`,`lectura`,`estado`) values 
(1,'1111',3,'2019-11-15 17:41:49','DESCONEXION',35000,'\0'),
(2,'1111',3,'2019-11-15 18:46:44','RECONEXION',50001,'\0'),
(3,'1111',3,'2019-11-15 18:58:36','DESCONEXION',88000,'\0'),
(4,'1111',3,'2019-11-15 19:02:14','RECONEXION',89500,'');

/*Table structure for table `extension` */

DROP TABLE IF EXISTS `extension`;

CREATE TABLE `extension` (
  `id_extension` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `id_solicitud_conexion` int(11) NOT NULL,
  `id_precio_conexion` int(11) NOT NULL,
  PRIMARY KEY (`id_extension`),
  KEY `id_solicitud_conexion` (`id_solicitud_conexion`),
  KEY `id_precio_conexion` (`id_precio_conexion`),
  CONSTRAINT `extension_ibfk_1` FOREIGN KEY (`id_solicitud_conexion`) REFERENCES `solicitud_conexion` (`id_solicitud_conexion`) ON UPDATE CASCADE,
  CONSTRAINT `extension_ibfk_2` FOREIGN KEY (`id_precio_conexion`) REFERENCES `precio_conexion` (`id_precio_conexion`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `extension` */

insert  into `extension`(`id_extension`,`estado`,`tipo`,`id_solicitud_conexion`,`id_precio_conexion`) values 
(1,'ACTIVO','ASFALTO',1,1),
(2,'ACTIVO','ASFALTO-TIERRA',2,1),
(3,'ACTIVO','TIERRA',3,1),
(4,'INACTIVO','ASFALTO',4,1),
(5,'INACTIVO','ASFALTO-TIERRA',5,1);

/*Table structure for table `extraccion` */

DROP TABLE IF EXISTS `extraccion`;

CREATE TABLE `extraccion` (
  `nro_extraccion` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nro_cuenta_banco` varchar(20) NOT NULL,
  `id_banco` int(11) NOT NULL,
  PRIMARY KEY (`nro_extraccion`,`nro_cuenta_banco`,`id_banco`),
  KEY `nro_cuenta_banco` (`nro_cuenta_banco`,`id_banco`),
  CONSTRAINT `extraccion_ibfk_1` FOREIGN KEY (`nro_cuenta_banco`, `id_banco`) REFERENCES `cuenta_banco` (`nro_cuenta_banco`, `id_banco`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `extraccion` */

insert  into `extraccion`(`nro_extraccion`,`fecha`,`monto`,`estado`,`nro_cuenta_banco`,`id_banco`) values 
(52,'2019-11-26',400000,'','2238-001/51',1),
(123123,'2019-11-26',105000,'','2238-001/51',1);

/*Table structure for table `factura` */

DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL,
  `primera_numeracion` varchar(3) NOT NULL,
  `segunda_numeracion` varchar(3) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_factura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `factura` */

insert  into `factura`(`id_factura`,`primera_numeracion`,`segunda_numeracion`,`desde`,`hasta`,`estado`) values 
(1,'001','001',1,100,''),
(2,'001','001',101,200,'\0');

/*Table structure for table `facturacion` */

DROP TABLE IF EXISTS `facturacion`;

CREATE TABLE `facturacion` (
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `vencimiento` date NOT NULL,
  `estado` varchar(12) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `ci_cliente` varchar(20) NOT NULL,
  `orden` int(11) NOT NULL,
  PRIMARY KEY (`numero_factura`,`id_factura`),
  KEY `ci_cliente` (`ci_cliente`),
  KEY `id_factura` (`id_factura`),
  CONSTRAINT `facturacion_ibfk_1` FOREIGN KEY (`ci_cliente`) REFERENCES `cliente` (`ci_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `facturacion_ibfk_2` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturacion` */

insert  into `facturacion`(`numero_factura`,`id_factura`,`fecha`,`vencimiento`,`estado`,`tipo`,`ci_cliente`,`orden`) values 
(1,1,'2019-10-20','2019-11-01','VENCIDO','CONSUMO','123',1),
(2,1,'2019-10-20','2019-11-01','COBRADO','CONSUMO','4564567',2),
(3,1,'2019-10-21','2019-11-01','COBRADO','CONSUMO','4564567',3),
(4,1,'2019-11-15','2019-11-30','COBRADO','CONSUMO','123',4),
(5,1,'2019-11-15','2019-12-02','COBRADO','CONSUMO','4564567',5),
(6,1,'2019-11-15','2019-11-29','COBRADO','CONSUMO','4564567',6),
(7,1,'2019-11-16','2019-11-16','COBRADO','SERVICIO','123',7),
(8,1,'2019-11-22','2019-12-29','VENCIDO','CONSUMO','4564567',8),
(9,1,'2019-11-22','2019-12-29','VENCIDO','CONSUMO','4564567',9),
(10,1,'2019-11-22','2019-12-29','VENCIDO','CONSUMO','123',10),
(11,1,'2019-11-22','2019-12-29','VENCIDO','CONSUMO','123',11),
(12,1,'2019-11-25','2019-12-20','COBRADO','CONSUMO','4564567',12),
(13,1,'2019-11-25','2019-12-20','COBRADO','CONSUMO','4564567',13),
(14,1,'2019-11-25','2019-12-20','FRACCIONADO','CONSUMO','123',14),
(15,1,'2019-11-26','2019-11-29','COBRADO','CONSUMO','4487212',15),
(16,1,'2019-11-26','2019-11-27','ACTIVO','CONSUMO','123',16),
(17,1,'2019-11-28','2019-11-28','FRACCIONADO','SERVICIO','1247585',17);

/*Table structure for table `facturacion_deuda` */

DROP TABLE IF EXISTS `facturacion_deuda`;

CREATE TABLE `facturacion_deuda` (
  `id_deuda` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  PRIMARY KEY (`id_deuda`,`numero_factura`,`id_factura`),
  KEY `numero_factura` (`numero_factura`,`id_factura`),
  CONSTRAINT `facturacion_deuda_ibfk_1` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE,
  CONSTRAINT `facturacion_deuda_ibfk_2` FOREIGN KEY (`id_deuda`) REFERENCES `deuda` (`id_deuda`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturacion_deuda` */

insert  into `facturacion_deuda`(`id_deuda`,`numero_factura`,`id_factura`) values 
(1,10,1),
(2,12,1),
(3,13,1),
(4,14,1),
(5,16,1);

/*Table structure for table `facturacion_extension` */

DROP TABLE IF EXISTS `facturacion_extension`;

CREATE TABLE `facturacion_extension` (
  `id_extension` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  PRIMARY KEY (`id_extension`,`numero_factura`,`id_factura`),
  KEY `numero_factura` (`numero_factura`,`id_factura`),
  CONSTRAINT `facturacion_extension_ibfk_1` FOREIGN KEY (`id_extension`) REFERENCES `extension` (`id_extension`) ON UPDATE CASCADE,
  CONSTRAINT `facturacion_extension_ibfk_2` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturacion_extension` */

insert  into `facturacion_extension`(`id_extension`,`numero_factura`,`id_factura`) values 
(4,7,1),
(5,17,1);

/*Table structure for table `facturacion_lectura` */

DROP TABLE IF EXISTS `facturacion_lectura`;

CREATE TABLE `facturacion_lectura` (
  `id_lectura` int(11) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  PRIMARY KEY (`id_lectura`,`numero_factura`,`id_factura`),
  KEY `numero_factura` (`numero_factura`,`id_factura`),
  CONSTRAINT `facturacion_lectura_ibfk_1` FOREIGN KEY (`id_lectura`) REFERENCES `lectura_medidor` (`id_lectura`) ON UPDATE CASCADE,
  CONSTRAINT `facturacion_lectura_ibfk_2` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturacion_lectura` */

insert  into `facturacion_lectura`(`id_lectura`,`numero_factura`,`id_factura`) values 
(3,1,1),
(2,2,1),
(4,3,1),
(5,4,1),
(7,5,1),
(8,6,1),
(11,8,1),
(10,9,1),
(9,10,1),
(6,11,1),
(14,12,1),
(13,13,1),
(12,14,1),
(15,15,1),
(16,16,1);

/*Table structure for table `facturacion_servicio` */

DROP TABLE IF EXISTS `facturacion_servicio`;

CREATE TABLE `facturacion_servicio` (
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `id_conexion_servicio` int(11) NOT NULL,
  PRIMARY KEY (`numero_factura`,`id_factura`,`id_conexion_servicio`),
  KEY `id_conexion_servicio` (`id_conexion_servicio`),
  CONSTRAINT `facturacion_servicio_ibfk_1` FOREIGN KEY (`id_conexion_servicio`) REFERENCES `conexion_servicio` (`id_conexion_servicio`) ON UPDATE CASCADE,
  CONSTRAINT `facturacion_servicio_ibfk_2` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturacion_servicio` */

/*Table structure for table `finca` */

DROP TABLE IF EXISTS `finca`;

CREATE TABLE `finca` (
  `cta_cte_catastral` varchar(15) NOT NULL,
  `ci_cliente` varchar(20) NOT NULL,
  `orden` double NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_barrio` int(11) NOT NULL,
  PRIMARY KEY (`cta_cte_catastral`),
  KEY `ci_cliente` (`ci_cliente`),
  KEY `id_barrio` (`id_barrio`),
  CONSTRAINT `finca_ibfk_1` FOREIGN KEY (`ci_cliente`) REFERENCES `cliente` (`ci_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `finca_ibfk_2` FOREIGN KEY (`id_barrio`) REFERENCES `barrio` (`id_barrio`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `finca` */

insert  into `finca`(`cta_cte_catastral`,`ci_cliente`,`orden`,`direccion`,`id_barrio`) values 
('097','4487212',5,'ruta sexta km 23',1),
('1111','4564567',3,'ruta vi',1),
('1147','123',4,'calle 4',1),
('123','4564567',2,'Calle x',1),
('147','1247585',6,'ruta sexta 4.25',1),
('466','123',1,'calle x a 30 m  de ruta vi',1),
('542','1247585',7,'call x',2);

/*Table structure for table `finca_correo` */

DROP TABLE IF EXISTS `finca_correo`;

CREATE TABLE `finca_correo` (
  `correo` varchar(100) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  PRIMARY KEY (`correo`,`cta_cte_catastral`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`),
  CONSTRAINT `finca_correo_ibfk_1` FOREIGN KEY (`cta_cte_catastral`) REFERENCES `finca` (`cta_cte_catastral`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `finca_correo` */

insert  into `finca_correo`(`correo`,`cta_cte_catastral`) values 
('correo','123');

/*Table structure for table `finca_telefono` */

DROP TABLE IF EXISTS `finca_telefono`;

CREATE TABLE `finca_telefono` (
  `telefono` varchar(20) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  PRIMARY KEY (`telefono`,`cta_cte_catastral`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`),
  CONSTRAINT `finca_telefono_ibfk_1` FOREIGN KEY (`cta_cte_catastral`) REFERENCES `finca` (`cta_cte_catastral`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `finca_telefono` */

insert  into `finca_telefono`(`telefono`,`cta_cte_catastral`) values 
('123','097'),
('132','1111'),
('09785','123'),
('555','466');

/*Table structure for table `inicio_cierre` */

DROP TABLE IF EXISTS `inicio_cierre`;

CREATE TABLE `inicio_cierre` (
  `id_inicio_cierre` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `fecha` datetime NOT NULL,
  PRIMARY KEY (`id_inicio_cierre`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `inicio_cierre_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `inicio_cierre` */

insert  into `inicio_cierre`(`id_inicio_cierre`,`monto`,`ci_personal`,`estado`,`fecha`) values 
(1,500000,1234567,'\0','2019-11-23 15:45:50'),
(2,500000,1234567,'\0','2019-11-25 19:31:33'),
(3,500000,1234567,'','2019-11-25 19:33:11');

/*Table structure for table `lectura_medidor` */

DROP TABLE IF EXISTS `lectura_medidor`;

CREATE TABLE `lectura_medidor` (
  `id_lectura` int(11) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `lectura` int(11) NOT NULL,
  `estado` varchar(10) NOT NULL,
  `fecha` datetime NOT NULL,
  `id_precio_consumo` int(11) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  PRIMARY KEY (`id_lectura`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`,`id_medidor`),
  KEY `id_precio_consumo` (`id_precio_consumo`),
  CONSTRAINT `lectura_medidor_ibfk_1` FOREIGN KEY (`cta_cte_catastral`, `id_medidor`) REFERENCES `conexion` (`cta_cte_catastral`, `id_medidor`) ON UPDATE CASCADE,
  CONSTRAINT `lectura_medidor_ibfk_2` FOREIGN KEY (`id_precio_consumo`) REFERENCES `precio_consumo` (`id_precio_consumo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lectura_medidor` */

insert  into `lectura_medidor`(`id_lectura`,`cta_cte_catastral`,`lectura`,`estado`,`fecha`,`id_precio_consumo`,`id_medidor`) values 
(1,'466',10000,'ANULADO','2019-10-12 16:39:50',1,2),
(2,'123',26000,'FACTURADO','2019-10-12 16:39:50',2,1),
(3,'466',15200,'FACTURADO','2019-10-13 20:27:58',2,2),
(4,'1111',22500,'FACTURADO','2019-10-20 18:29:28',2,3),
(5,'466',35000,'FACTURADO','2019-10-21 14:46:23',2,2),
(6,'1147',5000,'FACTURADO','2019-11-15 18:50:42',1,5),
(7,'1111',70000,'FACTURADO','2019-11-15 18:51:49',2,3),
(8,'1111',85000,'FACTURADO','2019-11-15 18:56:52',2,3),
(9,'466',200000,'FACTURADO','2019-11-21 20:50:45',3,2),
(10,'123',50000,'FACTURADO','2019-11-21 20:50:45',2,1),
(11,'1111',125000,'FACTURADO','2019-11-21 20:50:45',3,3),
(12,'466',250000,'FACTURADO','2019-11-25 16:52:17',3,2),
(13,'123',75000,'FACTURADO','2019-11-25 16:52:17',2,1),
(14,'1111',139000,'FACTURADO','2019-11-25 16:52:17',2,3),
(15,'097',50000,'FACTURADO','2019-11-26 13:40:47',3,6),
(16,'1147',18000,'FACTURADO','2019-11-26 22:24:15',2,5);

/*Table structure for table `longitud_extension` */

DROP TABLE IF EXISTS `longitud_extension`;

CREATE TABLE `longitud_extension` (
  `id_longitud` int(11) NOT NULL,
  `id_extension` int(11) NOT NULL,
  `longitud` double NOT NULL,
  `monto` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  PRIMARY KEY (`id_longitud`),
  KEY `monto` (`monto`,`tipo`),
  KEY `id_extension` (`id_extension`),
  CONSTRAINT `longitud_extension_ibfk_1` FOREIGN KEY (`monto`, `tipo`) REFERENCES `precio_extension` (`monto`, `tipo`) ON UPDATE CASCADE,
  CONSTRAINT `longitud_extension_ibfk_2` FOREIGN KEY (`id_extension`) REFERENCES `extension` (`id_extension`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `longitud_extension` */

insert  into `longitud_extension`(`id_longitud`,`id_extension`,`longitud`,`monto`,`tipo`) values 
(1,1,2,30000,'ASFALTO'),
(2,2,10,30000,'ASFALTO'),
(3,2,30,25000,'TIERRA'),
(4,3,15,25000,'TIERRA'),
(5,4,10.5,30000,'ASFALTO'),
(6,5,21.25,30000,'ASFALTO'),
(7,5,12.5,25000,'TIERRA');

/*Table structure for table `medidor` */

DROP TABLE IF EXISTS `medidor`;

CREATE TABLE `medidor` (
  `codigo` varchar(20) NOT NULL,
  `id_modelo_medidor` int(11) NOT NULL,
  `id_medidor` int(11) NOT NULL,
  PRIMARY KEY (`id_medidor`),
  KEY `id_modelo_medidor` (`id_modelo_medidor`),
  CONSTRAINT `medidor_ibfk_1` FOREIGN KEY (`id_modelo_medidor`) REFERENCES `modelo_medidor` (`id_modelo_medidor`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `medidor` */

insert  into `medidor`(`codigo`,`id_modelo_medidor`,`id_medidor`) values 
('3102',1,1),
('123',1,2),
('546',1,3),
('566',1,4),
('asd',1,5),
('ma',1,6);

/*Table structure for table `modelo_medidor` */

DROP TABLE IF EXISTS `modelo_medidor`;

CREATE TABLE `modelo_medidor` (
  `nombre_modelo` varchar(20) NOT NULL,
  `id_modelo_medidor` int(11) NOT NULL,
  PRIMARY KEY (`id_modelo_medidor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `modelo_medidor` */

insert  into `modelo_medidor`(`nombre_modelo`,`id_modelo_medidor`) values 
('x1',1);

/*Table structure for table `nota_credito` */

DROP TABLE IF EXISTS `nota_credito`;

CREATE TABLE `nota_credito` (
  `nro_nota_credito` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(30) NOT NULL,
  `estado` bit(1) NOT NULL,
  `numero_factura` int(11) NOT NULL,
  `id_factura` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  PRIMARY KEY (`nro_nota_credito`),
  KEY `numero_factura` (`numero_factura`,`id_factura`),
  CONSTRAINT `nota_credito_ibfk_1` FOREIGN KEY (`numero_factura`, `id_factura`) REFERENCES `facturacion` (`numero_factura`, `id_factura`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nota_credito` */

insert  into `nota_credito`(`nro_nota_credito`,`fecha`,`descripcion`,`estado`,`numero_factura`,`id_factura`,`monto`) values 
('001-001-0000123','2019-11-14','sobrecargo','\0',3,1,20000),
('001-001-0002131','2019-11-22','error de carga','',2,1,17000),
('001-001-002','2019-11-14','prieva','\0',1,1,25000);

/*Table structure for table `nota_debito` */

DROP TABLE IF EXISTS `nota_debito`;

CREATE TABLE `nota_debito` (
  `nro_nota_debito` varchar(20) NOT NULL,
  `fecha` date NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  `nro_boleta` varchar(20) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`nro_nota_debito`,`nro_boleta`,`id_pedido`),
  KEY `nro_boleta` (`nro_boleta`,`id_pedido`),
  CONSTRAINT `nota_debito_ibfk_1` FOREIGN KEY (`nro_boleta`, `id_pedido`) REFERENCES `compra` (`nro_boleta`, `id_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nota_debito` */

insert  into `nota_debito`(`nro_nota_debito`,`fecha`,`descripcion`,`monto`,`estado`,`nro_boleta`,`id_pedido`) values 
('001-001-0000012','2019-11-13','prueba',120000,'','001-003-5465465',3),
('001-001-0000031','2019-11-14','asdsa',5000,'\0','001-003-5465465',3),
('001-001-0001231','2019-11-06','falto productos',125,'\0','001-003-5465465',3);

/*Table structure for table `observacion_cierre` */

DROP TABLE IF EXISTS `observacion_cierre`;

CREATE TABLE `observacion_cierre` (
  `observacion` varchar(200) NOT NULL,
  `id_cierre` int(11) NOT NULL,
  PRIMARY KEY (`observacion`,`id_cierre`),
  KEY `id_cierre` (`id_cierre`),
  CONSTRAINT `observacion_cierre_ibfk_1` FOREIGN KEY (`id_cierre`) REFERENCES `cierre` (`id_cierre`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `observacion_cierre` */

insert  into `observacion_cierre`(`observacion`,`id_cierre`) values 
('prueba de observacion',2);

/*Table structure for table `orden_compra` */

DROP TABLE IF EXISTS `orden_compra`;

CREATE TABLE `orden_compra` (
  `id_orden_compra` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_orden_compra`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `orden_compra_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orden_compra` */

insert  into `orden_compra`(`id_orden_compra`,`fecha`,`estado`,`ci_personal`) values 
(1,'2019-11-06','PEDIDO',1234567),
(2,'2019-11-06','ANULADO',1234567),
(3,'2019-11-08','ANULADO',1234567),
(4,'2019-11-08','PEDIDO',1234567),
(5,'2019-11-30','ACTIVO',1234567);

/*Table structure for table `orden_compra_detalle` */

DROP TABLE IF EXISTS `orden_compra_detalle`;

CREATE TABLE `orden_compra_detalle` (
  `cod_barra` varchar(20) NOT NULL,
  `id_orden_compra` int(11) NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`cod_barra`,`id_orden_compra`),
  KEY `id_orden_compra` (`id_orden_compra`),
  CONSTRAINT `orden_compra_detalle_ibfk_1` FOREIGN KEY (`cod_barra`) REFERENCES `producto` (`cod_barra`) ON UPDATE CASCADE,
  CONSTRAINT `orden_compra_detalle_ibfk_2` FOREIGN KEY (`id_orden_compra`) REFERENCES `orden_compra` (`id_orden_compra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `orden_compra_detalle` */

insert  into `orden_compra_detalle`(`cod_barra`,`id_orden_compra`,`cantidad`) values 
('123123',1,2),
('123123',2,10),
('123123',3,10),
('123123',4,2),
('12323',5,10),
('4565',1,10),
('4565',3,15),
('4565',4,10);

/*Table structure for table `pago` */

DROP TABLE IF EXISTS `pago`;

CREATE TABLE `pago` (
  `id_pago` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `nro_extraccion` int(11) NOT NULL,
  `nro_cuenta_banco` varchar(20) NOT NULL,
  `id_banco` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `nro_extraccion` (`nro_extraccion`,`nro_cuenta_banco`,`id_banco`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`nro_extraccion`, `nro_cuenta_banco`, `id_banco`) REFERENCES `extraccion` (`nro_extraccion`, `nro_cuenta_banco`, `id_banco`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pago` */

insert  into `pago`(`id_pago`,`fecha`,`nro_extraccion`,`nro_cuenta_banco`,`id_banco`,`monto`) values 
(1,'2019-11-26',123123,'2238-001/51',1,105000),
(2,'2019-11-26',52,'2238-001/51',1,400000);

/*Table structure for table `pago_compra` */

DROP TABLE IF EXISTS `pago_compra`;

CREATE TABLE `pago_compra` (
  `nro_boleta` varchar(20) NOT NULL,
  `id_pago` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  PRIMARY KEY (`nro_boleta`,`id_pago`,`id_pedido`),
  KEY `nro_boleta` (`nro_boleta`,`id_pedido`),
  KEY `id_pago` (`id_pago`),
  CONSTRAINT `pago_compra_ibfk_1` FOREIGN KEY (`nro_boleta`, `id_pedido`) REFERENCES `compra` (`nro_boleta`, `id_pedido`) ON UPDATE CASCADE,
  CONSTRAINT `pago_compra_ibfk_2` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pago_compra` */

insert  into `pago_compra`(`nro_boleta`,`id_pago`,`id_pedido`) values 
('001-003-5465465',1,3),
('001-003-5465465',2,3);

/*Table structure for table `pago_salario` */

DROP TABLE IF EXISTS `pago_salario`;

CREATE TABLE `pago_salario` (
  `id_pago` int(11) NOT NULL,
  `id_salario` int(11) NOT NULL,
  PRIMARY KEY (`id_pago`,`id_salario`),
  KEY `id_salario` (`id_salario`),
  CONSTRAINT `pago_salario_ibfk_1` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON UPDATE CASCADE,
  CONSTRAINT `pago_salario_ibfk_2` FOREIGN KEY (`id_salario`) REFERENCES `salario` (`id_salario`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pago_salario` */

/*Table structure for table `pedido` */

DROP TABLE IF EXISTS `pedido`;

CREATE TABLE `pedido` (
  `id_pedido` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `ci_personal` (`ci_personal`),
  KEY `ruc` (`ruc`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE,
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`ruc`) REFERENCES `proveedor` (`ruc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedido` */

insert  into `pedido`(`id_pedido`,`fecha`,`estado`,`ci_personal`,`ruc`) values 
(1,'2019-11-08 19:09:40','ACTIVO',1234567,'800123456-5'),
(2,'2019-11-08 19:56:44','ANULADO',1234567,'800123456-5'),
(3,'2019-11-11 19:16:14','COMPRADO',1234567,'800123456-5'),
(4,'2019-11-27 16:43:39','COMPRADO',1234567,'800123456-5');

/*Table structure for table `pedido_detalle` */

DROP TABLE IF EXISTS `pedido_detalle`;

CREATE TABLE `pedido_detalle` (
  `cod_barra` varchar(20) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `cant` double NOT NULL,
  `precio` int(11) NOT NULL,
  `iva` smallint(6) NOT NULL,
  PRIMARY KEY (`cod_barra`,`id_pedido`),
  KEY `id_pedido` (`id_pedido`),
  CONSTRAINT `pedido_detalle_ibfk_1` FOREIGN KEY (`cod_barra`) REFERENCES `producto` (`cod_barra`) ON UPDATE CASCADE,
  CONSTRAINT `pedido_detalle_ibfk_2` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedido_detalle` */

insert  into `pedido_detalle`(`cod_barra`,`id_pedido`,`cant`,`precio`,`iva`) values 
('123123',1,15,2500,10),
('123123',3,50,12000,10),
('12323',4,10,15000,5),
('4565',1,15,1200,10),
('4565',2,55,0,10),
('4565',3,20,1250,10);

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `ci_personal` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellido` varchar(50) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `id_rol` int(11) NOT NULL,
  PRIMARY KEY (`ci_personal`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `personal_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personal` */

insert  into `personal`(`ci_personal`,`nombre`,`apellido`,`direccion`,`id_rol`) values 
(254123,'Carlos','Villar','Ruta sexta km25',4),
(1234567,'Ivan','Caballero','ENCARNACION',1),
(2233114,'Marta','Wayne','Encarnacion',3),
(4215421,'Ruben','Casco','Centro Miranda',2),
(5421456,'Ramon','Martinez','Calle 2',4);

/*Table structure for table `personal_correo` */

DROP TABLE IF EXISTS `personal_correo`;

CREATE TABLE `personal_correo` (
  `correo` varchar(100) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`correo`,`ci_personal`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `personal_correo_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personal_correo` */

/*Table structure for table `personal_telefono` */

DROP TABLE IF EXISTS `personal_telefono`;

CREATE TABLE `personal_telefono` (
  `telefono` varchar(20) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`telefono`,`ci_personal`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `personal_telefono_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `personal_telefono` */

insert  into `personal_telefono`(`telefono`,`ci_personal`) values 
('0985 447447',254123),
('0985 123456',5421456);

/*Table structure for table `precio_conexion` */

DROP TABLE IF EXISTS `precio_conexion`;

CREATE TABLE `precio_conexion` (
  `id_precio_conexion` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_precio_conexion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `precio_conexion` */

insert  into `precio_conexion`(`id_precio_conexion`,`monto`,`estado`) values 
(1,300000,''),
(2,225000,'\0');

/*Table structure for table `precio_consumo` */

DROP TABLE IF EXISTS `precio_consumo`;

CREATE TABLE `precio_consumo` (
  `id_precio_consumo` int(11) NOT NULL,
  `desde` int(11) NOT NULL,
  `hasta` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_precio_consumo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `precio_consumo` */

insert  into `precio_consumo`(`id_precio_consumo`,`desde`,`hasta`,`monto`,`estado`) values 
(1,0,10000,20000,''),
(2,10001,30000,2,''),
(3,30001,2147483647,3,'');

/*Table structure for table `precio_extension` */

DROP TABLE IF EXISTS `precio_extension`;

CREATE TABLE `precio_extension` (
  `monto` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`monto`,`tipo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `precio_extension` */

insert  into `precio_extension`(`monto`,`tipo`,`estado`) values 
(25000,'TIERRA',''),
(30000,'ASFALTO',''),
(45000,'TIERRA','\0'),
(50000,'ASFALTO','\0');

/*Table structure for table `producto` */

DROP TABLE IF EXISTS `producto`;

CREATE TABLE `producto` (
  `cod_barra` varchar(20) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `iva` smallint(6) NOT NULL,
  PRIMARY KEY (`cod_barra`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producto` */

insert  into `producto`(`cod_barra`,`descripcion`,`iva`) values 
('123123','caÃ±o de 1/4',10),
('12323','codo',5),
('4565','producto',10);

/*Table structure for table `proveedor` */

DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `ruc` varchar(20) NOT NULL,
  `razon` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  PRIMARY KEY (`ruc`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor` */

insert  into `proveedor`(`ruc`,`razon`,`direccion`) values 
('800123456-5','Nombre de la Empresa S.A.','Encarnacion');

/*Table structure for table `proveedor_correo` */

DROP TABLE IF EXISTS `proveedor_correo`;

CREATE TABLE `proveedor_correo` (
  `correo` varchar(100) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  PRIMARY KEY (`correo`,`ruc`),
  KEY `ruc` (`ruc`),
  CONSTRAINT `proveedor_correo_ibfk_1` FOREIGN KEY (`ruc`) REFERENCES `proveedor` (`ruc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor_correo` */

insert  into `proveedor_correo`(`correo`,`ruc`) values 
('cor','800123456-5');

/*Table structure for table `proveedor_telefono` */

DROP TABLE IF EXISTS `proveedor_telefono`;

CREATE TABLE `proveedor_telefono` (
  `telefono` varchar(20) NOT NULL,
  `ruc` varchar(20) NOT NULL,
  PRIMARY KEY (`telefono`,`ruc`),
  KEY `ruc` (`ruc`),
  CONSTRAINT `proveedor_telefono_ibfk_1` FOREIGN KEY (`ruc`) REFERENCES `proveedor` (`ruc`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedor_telefono` */

insert  into `proveedor_telefono`(`telefono`,`ruc`) values 
('123','800123456-5');

/*Table structure for table `recibo_cobro` */

DROP TABLE IF EXISTS `recibo_cobro`;

CREATE TABLE `recibo_cobro` (
  `nro_recibo` int(11) NOT NULL,
  `descripcion` varchar(50) NOT NULL,
  `id_cobro` int(11) NOT NULL,
  PRIMARY KEY (`nro_recibo`),
  KEY `id_cobro` (`id_cobro`),
  CONSTRAINT `recibo_cobro_ibfk_1` FOREIGN KEY (`id_cobro`) REFERENCES `cobro` (`id_cobro`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recibo_cobro` */

insert  into `recibo_cobro`(`nro_recibo`,`descripcion`,`id_cobro`) values 
(1,'PAGO DE FRACCIONAMIENTO',3),
(2,'PAGO DE FRACCIONAMIENTO',4),
(3,'PAGO DE FRACCIONAMIENTO',5),
(4,'PAGO DE FRACCIONAMIENTO',6),
(5,'PAGO DE FRACCIONAMIENTO',7),
(6,'PAGO DE FRACCIONAMIENTO',8),
(7,'CANCELACION DE FRACCIONAMIENTO',9),
(8,'PAGO DE FRACCIONAMIENTO',15);

/*Table structure for table `rol` */

DROP TABLE IF EXISTS `rol`;

CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `rol` */

insert  into `rol`(`id_rol`,`descripcion`) values 
(1,'ADMINISTRADOR/A'),
(2,'LECTOR/A'),
(3,'CAJERO/A'),
(4,'PLOMERO/A');

/*Table structure for table `salario` */

DROP TABLE IF EXISTS `salario`;

CREATE TABLE `salario` (
  `id_salario` int(11) NOT NULL,
  `monto` int(11) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `estado` bit(1) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_salario`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `salario_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `salario` */

/*Table structure for table `servicio` */

DROP TABLE IF EXISTS `servicio`;

CREATE TABLE `servicio` (
  `id_servicio` int(11) NOT NULL,
  `nombre_servicio` varchar(50) NOT NULL,
  `estado` bit(1) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`id_servicio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `servicio` */

/*Table structure for table `solicitud_conexion` */

DROP TABLE IF EXISTS `solicitud_conexion`;

CREATE TABLE `solicitud_conexion` (
  `id_solicitud_conexion` int(11) NOT NULL,
  `cta_cte_catastral` varchar(15) NOT NULL,
  `ci_cliente` varchar(20) NOT NULL,
  `fecha` datetime NOT NULL,
  `estado` varchar(10) NOT NULL,
  PRIMARY KEY (`id_solicitud_conexion`),
  KEY `ci_cliente` (`ci_cliente`),
  KEY `cta_cte_catastral` (`cta_cte_catastral`),
  CONSTRAINT `solicitud_conexion_ibfk_1` FOREIGN KEY (`ci_cliente`) REFERENCES `cliente` (`ci_cliente`) ON UPDATE CASCADE,
  CONSTRAINT `solicitud_conexion_ibfk_2` FOREIGN KEY (`cta_cte_catastral`) REFERENCES `finca` (`cta_cte_catastral`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `solicitud_conexion` */

insert  into `solicitud_conexion`(`id_solicitud_conexion`,`cta_cte_catastral`,`ci_cliente`,`fecha`,`estado`) values 
(1,'123','123','2019-10-09 10:54:53','ANULADO'),
(2,'123','123','2019-10-09 12:12:44','ANULADO'),
(3,'123','123','2019-10-10 10:05:11','ANULADO'),
(4,'123','123','2019-10-10 11:16:50','FACTURADO'),
(5,'147','1247585','2019-11-20 15:39:21','FACTURADO');

/*Table structure for table `trabajo` */

DROP TABLE IF EXISTS `trabajo`;

CREATE TABLE `trabajo` (
  `id_trabajo` int(11) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fecha` date NOT NULL,
  `estado` bit(1) NOT NULL,
  PRIMARY KEY (`id_trabajo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trabajo` */

insert  into `trabajo`(`id_trabajo`,`descripcion`,`fecha`,`estado`) values 
(1,'prueba de trabajo','2019-11-15','\0'),
(2,'prueba de trabajo','2019-11-15','');

/*Table structure for table `trabajo_personal` */

DROP TABLE IF EXISTS `trabajo_personal`;

CREATE TABLE `trabajo_personal` (
  `id_trabajo` int(11) NOT NULL,
  `ci_personal` int(11) NOT NULL,
  PRIMARY KEY (`id_trabajo`,`ci_personal`),
  KEY `ci_personal` (`ci_personal`),
  CONSTRAINT `trabajo_personal_ibfk_1` FOREIGN KEY (`ci_personal`) REFERENCES `personal` (`ci_personal`) ON UPDATE CASCADE,
  CONSTRAINT `trabajo_personal_ibfk_2` FOREIGN KEY (`id_trabajo`) REFERENCES `trabajo` (`id_trabajo`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trabajo_personal` */

insert  into `trabajo_personal`(`id_trabajo`,`ci_personal`) values 
(1,254123),
(2,2233114),
(2,5421456);

/*Table structure for table `trabajo_producto` */

DROP TABLE IF EXISTS `trabajo_producto`;

CREATE TABLE `trabajo_producto` (
  `id_trabajo` int(11) NOT NULL,
  `cod_barra` varchar(20) NOT NULL,
  `cantidad` double NOT NULL,
  PRIMARY KEY (`id_trabajo`,`cod_barra`),
  KEY `cod_barra` (`cod_barra`),
  CONSTRAINT `trabajo_producto_ibfk_1` FOREIGN KEY (`id_trabajo`) REFERENCES `trabajo` (`id_trabajo`) ON UPDATE CASCADE,
  CONSTRAINT `trabajo_producto_ibfk_2` FOREIGN KEY (`cod_barra`) REFERENCES `producto` (`cod_barra`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `trabajo_producto` */

insert  into `trabajo_producto`(`id_trabajo`,`cod_barra`,`cantidad`) values 
(1,'123123',12),
(1,'4565',10),
(2,'4565',50);

/* Function  structure for function  `ajuste_redondeo` */

/*!50003 DROP FUNCTION IF EXISTS `ajuste_redondeo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ajuste_redondeo`(cod integer) RETURNS int(11)
BEGIN
	declare valor integer;
	set valor=(right(cod,2));
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_consumo` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_consumo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_consumo`(id_lect int) RETURNS int(11)
BEGIN
	declare valor integer;
	declare	actual integer;
	declare anterior integer;
	set valor=0;
	if exists (select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`id_lectura`=id_lect)then
		set anterior=lectura_anterior(id_lect);
		set actual=(select lectura_medidor.`lectura` from lectura_medidor where lectura_medidor.`id_lectura`=id_lect);
		set valor=actual-anterior;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_consumo_deuda` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_consumo_deuda` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_consumo_deuda`(cta varchar(15)) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	set valor=0;
	if exists(select deuda.id_deuda from deuda where deuda.cta_cte_catastral=cta and estado=1) then
		SET valor=(SELECT SUM(deuda_factura.monto) FROM deuda INNER join deuda_factura on deuda.id_deuda=deuda_factura.id_deuda where deuda.cta_cte_catastral=cta and deuda.estado=1);
	end if;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_consumo_deuda_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_consumo_deuda_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_consumo_deuda_facturacion`(id int) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	set valor=0;
	if exists(select deuda.id_deuda from deuda where deuda.id_deuda=id) then
		SET valor=(SELECT SUM(deuda_factura.monto) FROM deuda_factura  where deuda_factura.id_deuda=id);
	end if;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_consumo_facturar` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_consumo_facturar` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_consumo_facturar`(id_lect int, tp varchar(1)) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	declare subtotal integer;
	declare iva integer;
	declare erssan integer;
	declare deuda integer;
	declare ajuste integer;
	declare cta varchar(15);
	set subtotal=calculo_consumo_precio(id_lect);
	set iva= subtotal/10;
	set erssan= subtotal/50;
	set cta=(select lectura_medidor.`cta_cte_catastral` from lectura_medidor where lectura_medidor.`id_lectura`=id_lect);
	set deuda=calculo_consumo_deuda(cta);
	set subtotal=subtotal+iva+erssan;
	set ajuste=ajuste_redondeo(subtotal);
	set valor=subtotal+deuda-ajuste;
	if (tp='T') THEN
		RETURN valor;
	ELSEIF (tp='R') THEN
		RETURN ajuste;
	END IF;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_consumo_precio` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_consumo_precio` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_consumo_precio`(id_lect int) RETURNS int(11)
BEGIN
	declare valor integer;
	declare consumo integer;
	declare id_precio integer;
	declare desde integer;
	declare precio integer;
	declare monto_uno integer;
	DECLARE monto_dos INTEGER;
	declare resto integer;
	set valor=0;
	if exists (select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`id_lectura`=id_lect) then
		set consumo=calculo_consumo(id_lect);
		set id_precio=(SELECT lectura_medidor.`id_precio_consumo` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id_lect);
		set desde =(select precio_consumo.`desde` from precio_consumo where precio_consumo.`id_precio_consumo`=id_precio);
		if (desde=0) then
			set valor=(select precio_consumo.`monto` from precio_consumo where precio_consumo.`id_precio_consumo`=id_precio);
		elseif (desde=10001) then
			set precio=(select precio_consumo.`monto` from precio_consumo where precio_consumo.`id_precio_consumo`=id_precio);
			set valor= consumo*precio;
		else
			SET precio=(SELECT precio_consumo.`monto` FROM precio_consumo WHERE precio_consumo.`id_precio_consumo`=id_precio);
			set monto_uno=(select precio_consumo.`monto` from precio_consumo where precio_consumo.`desde`=0 and estado=1 limit 1);
			SET monto_dos=(SELECT precio_consumo.`monto` FROM precio_consumo WHERE precio_consumo.`desde`=10001 AND estado=1 LIMIT 1);
			set monto_dos=monto_dos*20000;
			set resto=consumo-30000;
			set valor=(precio*resto)+monto_uno+monto_dos;
		end if;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_factura` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_factura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_factura`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	declare fact integer;
	declare des integer;
	declare has integer;
	declare maxim integer;
	set valor=0;
	IF EXISTS (SELECT factura.`id_factura` FROM factura WHERE factura.estado=1) THEN
		SET fact=(SELECT factura.`id_factura` FROM factura WHERE factura.estado=1 order by desde ASC LIMIT 1);
		SET des=(SELECT factura.`desde` FROM factura WHERE factura.`id_factura`=fact);
		SET has=(SELECT factura.`hasta` FROM factura WHERE factura.`id_factura`=fact);
		IF EXISTS (SELECT facturacion.`numero_factura` FROM facturacion WHERE facturacion.`id_factura`=fact) THEN
			SET maxim=(SELECT MAX(facturacion.`numero_factura`) FROM facturacion WHERE facturacion.`id_factura`=fact);
			IF (has>maxim) THEN
				SET valor=(maxim+1);
			END IF;
		ELSE
			SET valor=des;
		END IF;
	END IF;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_iva_compra` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_iva_compra` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_iva_compra`(id int, tp int) RETURNS int(11)
BEGIN
	declare valor int; 
	set valor=0;
	if exists (select id_pedido from pedido_detalle where id_pedido= id and iva=tp) then 
		set valor=(select sum(cant*precio) as tot from pedido_detalle where id_pedido= id and iva=tp);
		if (tp=5) then # LAS EXENTAS NO VOY A MOSTRAR EN EL INFORME
			set valor=valor/21;
		elseIF (tp=10) THEN
			SET valor=valor/11;
		end if;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_saldo_compra` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_saldo_compra` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_saldo_compra`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	DECLARE pagado INT;
	DECLARE debito INT;
	set valor=0;SET pagado=0;SET debito=0;
	if exists (select id_pedido from pedido_detalle where id_pedido= id) then
		set valor=(select sum(cant*precio) as tot from pedido_detalle where id_pedido= id);
	end if;
	if exists (select id_pedido from nota_debito where id_pedido=id and estado=1) then
		set debito=(select sum(monto) FROM nota_debito WHERE id_pedido=id and estado=1);
	end if;
	IF EXISTS (SELECT id_pedido FROM pago_compra WHERE id_pedido=id) THEN
		SET pagado=(SELECT SUM(p.`monto`) FROM pago_compra AS pc INNER JOIN pago AS p ON pc.`id_pago`=p.`id_pago` WHERE pc.`id_pedido`=id);
	END IF;
	set valor=valor-pagado-debito;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_saldo_factura` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_saldo_factura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_saldo_factura`(id int, nro int) RETURNS int(11)
BEGIN
	declare valor int;
	DECLARE total INT;
	DECLARE tp varchar(10);
	set valor=0;SET total=0;
	if exists (select id_factura from facturacion where id_factura=id and numero_factura=nro) then
		set total= calculo_total_a_pagar(id, nro);
		if exists (select id_factura from cobro where id_factura=id and numero_factura=nro) then
			set valor=(select sum(monto) FROM cobro WHERE id_factura=id AND numero_factura=nro);
		end if;
		SET valor=total-valor;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_stock` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_stock` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_stock`(cod varchar(20)) RETURNS double
BEGIN
	declare valor double;
	DECLARE ajuste_ps DOUBLE;
	DECLARE ajuste_ng DOUBLE;
	declare trabajo double;
	declare compra double;
	set valor=0; set trabajo=0; set compra=0; set ajuste_ps=0; set ajuste_ng=0;
	if exists (select cod_barra from ajuste where cod_barra=cod and tipo=1) then
		set ajuste_ps=(select sum(cantidad) as c from ajuste WHERE cod_barra=cod AND tipo=1);
	end if;
	IF EXISTS (SELECT cod_barra FROM ajuste WHERE cod_barra=cod AND tipo=0) THEN
		SET ajuste_ng=(SELECT SUM(cantidad) AS c FROM ajuste WHERE cod_barra=cod AND tipo=0);
	END IF;
	if exists (select trabajo_producto.`cod_barra` from trabajo_producto inner join trabajo on trabajo_producto.`id_trabajo`=trabajo.`id_trabajo` where trabajo_producto.`cod_barra`=cod and trabajo.`estado`=1) then
		set trabajo=(SELECT sum(trabajo_producto.`cantidad`) as c FROM trabajo_producto INNER JOIN trabajo ON trabajo_producto.`id_trabajo`=trabajo.`id_trabajo` WHERE trabajo_producto.`cod_barra`=cod AND trabajo.`estado`=1);
	end if;
	if exists (select pedido_detalle.`cod_barra` from pedido_detalle inner join pedido on pedido_detalle.`id_pedido`=pedido.`id_pedido` where pedido_detalle.`cod_barra`=cod and pedido.`estado`='COMPRADO') then
		set compra=(SELECT sum(pedido_detalle.`cant`) as c FROM pedido_detalle INNER JOIN pedido ON pedido_detalle.`id_pedido`=pedido.`id_pedido` WHERE pedido_detalle.`cod_barra`=cod AND pedido.`estado`='COMPRADO');
	end if;
	set valor=ajuste_ps-ajuste_ng-trabajo+compra;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_total_a_pagar` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_total_a_pagar` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_total_a_pagar`(id int, nro int) RETURNS int(11)
BEGIN
	DECLARE valor INT;
	DECLARE total INT;
	DECLARE tp VARCHAR(10);
	SET valor=0;SET total=0;
	IF EXISTS (SELECT id_factura FROM facturacion WHERE id_factura=id AND numero_factura=nro) THEN
		SET tp=(SELECT tipo FROM facturacion WHERE id_factura=id AND numero_factura=nro LIMIT 1);
		SET total= calculo_total_facturacion(id, nro, tp);
		IF EXISTS (SELECT id_factura FROM nota_credito WHERE id_factura=id AND numero_factura=nro and estado=1) THEN
			SET valor=(SELECT SUM(monto) FROM nota_credito WHERE id_factura=id AND numero_factura=nro and estado=1);
		END IF;
		SET valor=total-valor;
	END IF;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_total_compra` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_total_compra` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_total_compra`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists (select id_pedido from pedido_detalle where id_pedido= id) then
		set valor=(select sum(cant*precio) as tot from pedido_detalle where id_pedido= id);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_total_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_total_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_total_facturacion`(id int, nro int, tp varchar(10)) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	declare id_lect integer;
	declare id_deu integer;
	declare id_sol int;
	declare consumo integer;
	DECLARE deuda INTEGER;
	declare subtotal integer;
	if (tp='CONSUMO') then
		SET id_lect=(SELECT id_lectura FROM facturacion_lectura WHERE id_factura=id and numero_factura=nro);
		SET id_deu=(SELECT id_deuda FROM facturacion_deuda WHERE id_factura=id AND numero_factura=nro);
		set id_lect=ifnull(id_lect,0);
		SET id_deu=IFNULL(id_deu,0);
		SET consumo=(SELECT calculo_consumo_precio(id_lect));
		SET deuda=calculo_consumo_deuda_facturacion(id_deu);
		SET subtotal =(consumo+(consumo/10)+(consumo/50));
		set subtotal=subtotal-ajuste_redondeo(subtotal);
		set valor=subtotal+deuda;
	elseIF (tp='SERVICIO') THEN
		set id_sol=(select extension.`id_solicitud_conexion` from extension inner join  facturacion_extension on extension.`id_extension`=facturacion_extension.`id_extension` where facturacion_extension.`id_factura`=id and facturacion_extension.`numero_factura`=nro limit 1);
		set valor=calculo_total_solicitud(id_sol);
		set valor=valor-ajuste_redondeo(valor);
	end if;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `calculo_total_solicitud` */

/*!50003 DROP FUNCTION IF EXISTS `calculo_total_solicitud` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `calculo_total_solicitud`(id integer) RETURNS int(11)
BEGIN
	declare valor int;	#RETORNA
	declare precio1 DOUBLE;	#PRECIO ASFALTO
	DECLARE precio2 double;	#PRECIO TIERRA
	DECLARE precio_derecho int;
	declare tipo_ext varchar(20); # TIPO EXTENSION PARA CALCULO
	declare id_ex int; #PARA ID EXTENSION
	set valor=0; set precio1=0; set precio2=0; set precio_derecho=0;
	if exists (select id_solicitud_conexion from solicitud_conexion where id_solicitud_conexion=id) then
		SET id_ex=(SELECT id_extension FROM extension WHERE id_solicitud_conexion=id limit 1);
		set tipo_ext=(SELECT tipo FROM extension WHERE id_solicitud_conexion=id limit 1);
		if (tipo_ext='ASFALTO') then
			SET precio1=(select (longitud*monto) from longitud_extension where id_extension=id_ex and tipo='ASFALTO');
		elseIF (tipo_ext='TIERRA') THEN
			SET precio2=(SELECT (longitud*monto) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
		elseIF (tipo_ext='ASFALTO-ASFALTO') THEN
			SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
		ELSEIF (tipo_ext='TIERRA-TIERRA') THEN
			SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
		ELSEIF (tipo_ext='ASFALTO-TIERRA') THEN
			SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
			SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
		end if;
		set precio_derecho=(select precio_conexion.`monto` from precio_conexion inner join extension on precio_conexion.`id_precio_conexion`=extension.`id_precio_conexion` where extension.`id_extension`=id_ex limit 1);
		SET valor=precio1+precio2+precio_derecho;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_acceso` */

/*!50003 DROP FUNCTION IF EXISTS `contador_acceso` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_acceso`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_acceso),0)+1 AS codigo FROM acceso);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_ajuste` */

/*!50003 DROP FUNCTION IF EXISTS `contador_ajuste` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_ajuste`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_ajuste),0)+1 AS codigo FROM ajuste);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_barrio` */

/*!50003 DROP FUNCTION IF EXISTS `contador_barrio` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_barrio`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_barrio),0)+1 AS codigo FROM barrio);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_cierre` */

/*!50003 DROP FUNCTION IF EXISTS `contador_cierre` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_cierre`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_cierre),0)+1 AS codigo FROM cierre);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_cobro` */

/*!50003 DROP FUNCTION IF EXISTS `contador_cobro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_cobro`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_cobro),0)+1 AS codigo FROM cobro);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_contrato` */

/*!50003 DROP FUNCTION IF EXISTS `contador_contrato` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_contrato`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_contrato),0)+1 AS codigo FROM contrato);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_deuda` */

/*!50003 DROP FUNCTION IF EXISTS `contador_deuda` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_deuda`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_deuda),0)+1 AS codigo FROM deuda);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_estado_conexion` */

/*!50003 DROP FUNCTION IF EXISTS `contador_estado_conexion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_estado_conexion`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_estado_conexion),0)+1 AS codigo FROM estado_conexion);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_extension` */

/*!50003 DROP FUNCTION IF EXISTS `contador_extension` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_extension`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_extension),0)+1 AS codigo FROM extension);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_factura` */

/*!50003 DROP FUNCTION IF EXISTS `contador_factura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_factura`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_factura),0)+1 AS codigo FROM factura);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_inicio` */

/*!50003 DROP FUNCTION IF EXISTS `contador_inicio` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_inicio`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_inicio_cierre),0)+1 AS codigo FROM inicio_cierre);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_lectura` */

/*!50003 DROP FUNCTION IF EXISTS `contador_lectura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_lectura`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_lectura),0)+1 AS codigo FROM lectura_medidor);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_longitud_extension` */

/*!50003 DROP FUNCTION IF EXISTS `contador_longitud_extension` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_longitud_extension`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_longitud),0)+1 AS codigo FROM longitud_extension);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_medidor` */

/*!50003 DROP FUNCTION IF EXISTS `contador_medidor` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_medidor`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_medidor),0)+1 AS codigo FROM medidor);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_modelo` */

/*!50003 DROP FUNCTION IF EXISTS `contador_modelo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_modelo`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_modelo_medidor),0)+1 AS codigo FROM modelo_medidor);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_orden_compra` */

/*!50003 DROP FUNCTION IF EXISTS `contador_orden_compra` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_orden_compra`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_orden_compra),0)+1 AS codigo FROM orden_compra);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_pago` */

/*!50003 DROP FUNCTION IF EXISTS `contador_pago` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_pago`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_pago),0)+1 AS codigo FROM pago);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_pedido` */

/*!50003 DROP FUNCTION IF EXISTS `contador_pedido` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_pedido`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_pedido),0)+1 AS codigo FROM pedido);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_precio_conexion` */

/*!50003 DROP FUNCTION IF EXISTS `contador_precio_conexion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_precio_conexion`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_precio_conexion),0)+1 AS codigo FROM precio_conexion);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_recibo` */

/*!50003 DROP FUNCTION IF EXISTS `contador_recibo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_recibo`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(nro_recibo),0)+1 AS codigo FROM recibo_cobro);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_solicitud_conexion` */

/*!50003 DROP FUNCTION IF EXISTS `contador_solicitud_conexion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_solicitud_conexion`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_solicitud_conexion),0)+1 AS codigo FROM solicitud_conexion);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `contador_trabajo` */

/*!50003 DROP FUNCTION IF EXISTS `contador_trabajo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `contador_trabajo`() RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	SET valor=(SELECT IFNULL(MAX(id_trabajo),0)+1 AS codigo FROM trabajo);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `estado_ultima_lectura` */

/*!50003 DROP FUNCTION IF EXISTS `estado_ultima_lectura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `estado_ultima_lectura`(cta varchar(15), med int) RETURNS varchar(11) CHARSET latin1
BEGIN
	DECLARE valor VARCHAR(11);
	set valor='INACTIVO';
	IF EXISTS( SELECT lectura_medidor.`id_lectura` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO') THEN
		SET valor =(SELECT lectura_medidor.`estado`FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' order by lectura_medidor.`fecha` desc limit 1);
	end if;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `facturacion_barrio` */

/*!50003 DROP FUNCTION IF EXISTS `facturacion_barrio` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `facturacion_barrio`(nro int, id int, tp varchar(10)) RETURNS varchar(70) CHARSET latin1
BEGIN
	declare valor varchar(70);
	set valor='';
	if exists (select id_factura from facturacion where id_factura=id and numero_factura=nro and tipo=tp) then
		if (tp='CONSUMO') then
			set valor=(SELECT barrio.nombre_barrio FROM facturacion INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio where facturacion.id_factura=id AND facturacion.numero_factura=nro AND facturacion.tipo=tp limit 1);
		elseIF (tp='SERVICIO') THEN
			SET valor=(select barrio.nombre_barrio from facturacion inner join facturacion_extension on facturacion.`id_factura`=facturacion_extension.`id_factura` and facturacion.`numero_factura`=facturacion_extension.`numero_factura` inner join extension on facturacion_extension.`id_extension`=extension.`id_extension` inner join solicitud_conexion on extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` inner join finca on solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio  WHERE facturacion.id_factura=id AND facturacion.numero_factura=nro AND facturacion.tipo=tp LIMIT 1);
		end if;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `facturacion_cta` */

/*!50003 DROP FUNCTION IF EXISTS `facturacion_cta` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `facturacion_cta`(nro int, id int, tp varchar(10)) RETURNS varchar(15) CHARSET latin1
BEGIN
	declare valor varchar(15);
	set valor='';
	if exists (select id_factura from facturacion where id_factura=id and numero_factura=nro and tipo=tp) then
		if (tp='CONSUMO') then
			set valor=(SELECT lectura_medidor.`cta_cte_catastral` FROM facturacion INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura where facturacion.id_factura=id AND facturacion.numero_factura=nro AND facturacion.tipo=tp limit 1);
		elseIF (tp='SERVICIO') THEN
			SET valor=(select solicitud_conexion.`cta_cte_catastral` from facturacion inner join facturacion_extension on facturacion.`id_factura`=facturacion_extension.`id_factura` and facturacion.`numero_factura`=facturacion_extension.`numero_factura` inner join extension on facturacion_extension.`id_extension`=extension.`id_extension` inner join solicitud_conexion on extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` WHERE facturacion.id_factura=id AND facturacion.numero_factura=nro AND facturacion.tipo=tp LIMIT 1);
		end if;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `lectura_anterior` */

/*!50003 DROP FUNCTION IF EXISTS `lectura_anterior` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `lectura_anterior`(id_lect int) RETURNS int(11)
BEGIN
	declare valor integer;
	declare cta varchar (15);
	declare med int;
	declare fec_lec datetime;
	DECLARE fec_lec_ac DATETIME;
	SET fec_lec='2019-01-01 00:00:00'; #FECHA CUALQUIERA ANTES DEL SISTEMA PARA COMPARAR EN CASO DE QUE NO EXISTA
	set cta=(select lectura_medidor.`cta_cte_catastral` from lectura_medidor where lectura_medidor.`id_lectura`=id_lect);
	SET med=(SELECT lectura_medidor.`id_medidor` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id_lect);
	SET fec_lec_ac=(SELECT lectura_medidor.`fecha` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id_lect);
	set valor=(select conexion.`lectura_inicial` from conexion where conexion.`cta_cte_catastral`=cta and conexion.`id_medidor`=med);
	if exists( select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`cta_cte_catastral`=cta and lectura_medidor.`id_medidor`=med and estado!='ANULADO' and lectura_medidor.`id_lectura`<id_lect) then
		set valor=(SELECT lectura_medidor.`lectura` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' AND lectura_medidor.`id_lectura`<id_lect order by lectura_medidor.`id_lectura` desc limit 1);
		SET fec_lec=(SELECT lectura_medidor.`fecha` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' AND lectura_medidor.`id_lectura`<id_lect ORDER BY lectura_medidor.`id_lectura` DESC LIMIT 1);
	end if;
	IF EXISTS (SELECT estado_conexion.`id_estado_conexion` FROM estado_conexion WHERE estado_conexion.`fecha`>fec_lec and estado_conexion.`fecha`<fec_lec_ac AND estado_conexion.`cta_cte_catastral`=cta AND estado_conexion.`id_medidor`=med AND estado_conexion.`tipo`='RECONEXION') THEN
		SET valor=(SELECT estado_conexion.`lectura` FROM estado_conexion WHERE estado_conexion.`fecha`>fec_lec AND estado_conexion.`fecha`<fec_lec_ac AND estado_conexion.`cta_cte_catastral`=cta AND estado_conexion.`id_medidor`=med AND estado_conexion.`tipo`='RECONEXION' LIMIT 1);
	END IF;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `mes_espanhol` */

/*!50003 DROP FUNCTION IF EXISTS `mes_espanhol` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `mes_espanhol`(cod varchar(2)) RETURNS varchar(10) CHARSET latin1
BEGIN
	DECLARE valor VARCHAR(10);
	SET valor=CASE cod
		WHEN "01" THEN "ENERO"
		WHEN "02" THEN "FEBRERO"
		WHEN "03" THEN "MARZO"
		WHEN "04" THEN "ABRIL"
		WHEN "05" THEN "MAYO"
		WHEN "06" THEN "JUNIO"
		WHEN "07" THEN "JULIO"
		WHEN "08" THEN "AGOSTO"
		WHEN "09" THEN "SEPTIEMBRE"
		WHEN "10" THEN "OCTUBRE"
		WHEN "11" THEN "NOVIEMBRE"
		WHEN "12" THEN "DICIEMBRE"
	END;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `numeros_a_letras` */

/*!50003 DROP FUNCTION IF EXISTS `numeros_a_letras` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `numeros_a_letras`(XNumero NUMERIC(20,2)) RETURNS varchar(512) CHARSET latin1
BEGIN
DECLARE XlnEntero INT; 
DECLARE XlcRetorno VARCHAR(512); 
DECLARE XlnTerna INT; 
DECLARE XlcMiles VARCHAR(512); 
DECLARE XlcCadena VARCHAR(512); 
DECLARE XlnUnidades INT; 
DECLARE XlnDecenas INT; 
DECLARE XlnCentenas INT; 
DECLARE XlnFraccion INT; 
DECLARE Xresultado VARCHAR(512); 
SET XlnEntero = FLOOR(XNumero); 
SET XlnFraccion = (XNumero - XlnEntero) * 100; 
SET XlcRetorno = ''; 
SET XlnTerna = 1 ; 
    WHILE( XlnEntero > 0) DO 
        #Recorro terna por terna 
        SET XlcCadena = ''; 
        SET XlnUnidades = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnDecenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        SET XlnCentenas = XlnEntero MOD 10; 
        SET XlnEntero = FLOOR(XlnEntero/10); 
        #Analizo las unidades 
        SET XlcCadena = 
            CASE # UNIDADES 
                WHEN XlnUnidades = 1 AND XlnTerna = 1 THEN CONCAT('UNO ', XlcCadena) 
                WHEN XlnUnidades = 1 AND XlnTerna <> 1 THEN CONCAT('UN ', XlcCadena) 
                WHEN XlnUnidades = 2 THEN CONCAT('DOS ', XlcCadena) 
                WHEN XlnUnidades = 3 THEN CONCAT('TRES ', XlcCadena) 
                WHEN XlnUnidades = 4 THEN CONCAT('CUATRO ', XlcCadena) 
                WHEN XlnUnidades = 5 THEN CONCAT('CINCO ', XlcCadena) 
                WHEN XlnUnidades = 6 THEN CONCAT('SEIS ', XlcCadena) 
                WHEN XlnUnidades = 7 THEN CONCAT('SIETE ', XlcCadena) 
                WHEN XlnUnidades = 8 THEN CONCAT('OCHO ', XlcCadena) 
                WHEN XlnUnidades = 9 THEN CONCAT('NUEVE ', XlcCadena) 
                ELSE XlcCadena 
            END; #UNIDADES 
        #Analizo las decenas 
        SET XlcCadena = 
            CASE #DECENAS 
                WHEN XlnDecenas = 1 THEN 
                    CASE XlnUnidades 
                        WHEN 0 THEN 'DIEZ ' 
                        WHEN 1 THEN 'ONCE ' 
                        WHEN 2 THEN 'DOCE ' 
                        WHEN 3 THEN 'TRECE ' 
                        WHEN 4 THEN 'CATORCE ' 
                        WHEN 5 THEN 'QUINCE' 
                        ELSE CONCAT('DIECI', XlcCadena) 
                    END 
                WHEN XlnDecenas = 2 AND XlnUnidades = 0 THEN CONCAT('VEINTE ', XlcCadena) 
                WHEN XlnDecenas = 2 AND XlnUnidades <> 0 THEN CONCAT('VEINTI', XlcCadena) 
                WHEN XlnDecenas = 3 AND XlnUnidades = 0 THEN CONCAT('TREINTA ', XlcCadena) 
                WHEN XlnDecenas = 3 AND XlnUnidades <> 0 THEN CONCAT('TREINTA Y ', XlcCadena) 
                WHEN XlnDecenas = 4 AND XlnUnidades = 0 THEN CONCAT('CUARENTA ', XlcCadena) 
                WHEN XlnDecenas = 4 AND XlnUnidades <> 0 THEN CONCAT('CUARENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 5 AND XlnUnidades = 0 THEN CONCAT('CINCUENTA ', XlcCadena) 
                WHEN XlnDecenas = 5 AND XlnUnidades <> 0 THEN CONCAT('CINCUENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 6 AND XlnUnidades = 0 THEN CONCAT('SESENTA ', XlcCadena) 
                WHEN XlnDecenas = 6 AND XlnUnidades <> 0 THEN CONCAT('SESENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 7 AND XlnUnidades = 0 THEN CONCAT('SETENTA ', XlcCadena) 
                WHEN XlnDecenas = 7 AND XlnUnidades <> 0 THEN CONCAT('SETENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 8 AND XlnUnidades = 0 THEN CONCAT('OCHENTA ', XlcCadena) 
                WHEN XlnDecenas = 8 AND XlnUnidades <> 0 THEN CONCAT('OCHENTA Y ', XlcCadena) 
                WHEN XlnDecenas = 9 AND XlnUnidades = 0 THEN CONCAT('NOVENTA ', XlcCadena) 
                WHEN XlnDecenas = 9 AND XlnUnidades <> 0 THEN CONCAT('NOVENTA Y ', XlcCadena) 
                ELSE XlcCadena 
            END; #DECENAS 
        # Analizo las centenas 
        SET XlcCadena = 
            CASE # CENTENAS 
                WHEN XlnCentenas = 1 AND XlnUnidades = 0 AND XlnDecenas = 0 THEN CONCAT('CIEN ', XlcCadena) 
                WHEN XlnCentenas = 1 AND NOT(XlnUnidades = 0 AND XlnDecenas = 0) THEN CONCAT('CIENTO ', XlcCadena) 
                WHEN XlnCentenas = 2 THEN CONCAT('DOSCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 3 THEN CONCAT('TRESCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 4 THEN CONCAT('CUATROCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 5 THEN CONCAT('QUINIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 6 THEN CONCAT('SEISCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 7 THEN CONCAT('SETECIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 8 THEN CONCAT('OCHOCIENTOS ', XlcCadena) 
                WHEN XlnCentenas = 9 THEN CONCAT('NOVECIENTOS ', XlcCadena) 
                ELSE XlcCadena 
            END; #CENTENAS 
        # Analizo la terna 
        SET XlcCadena = 
            CASE # TERNA 
                WHEN XlnTerna = 1 THEN XlcCadena 
                WHEN XlnTerna = 2 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena,  'MIL ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0 THEN CONCAT(XlcCadena, 'MILLON ') 
                WHEN XlnTerna = 3 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) AND NOT (XlnUnidades = 1 AND XlnDecenas = 0 AND XlnCentenas = 0) THEN CONCAT(XlcCadena, 'MILLONES ') 
                WHEN XlnTerna = 4 AND (XlnUnidades + XlnDecenas + XlnCentenas <> 0) THEN CONCAT(XlcCadena, 'MIL MILLONES ') 
                ELSE '' 
            END; #TERNA 
        #Armo el retorno terna a terna 
        SET XlcRetorno = CONCAT(XlcCadena, XlcRetorno); 
        SET XlnTerna = XlnTerna + 1; 
    END WHILE; # WHILE 
    IF XlnTerna = 1 THEN SET XlcRetorno = 'CERO'; END IF; 
SET Xresultado = CONCAT(RTRIM(XlcRetorno)); 
RETURN Xresultado;
END */$$
DELIMITER ;

/* Function  structure for function  `solicitud_esquina` */

/*!50003 DROP FUNCTION IF EXISTS `solicitud_esquina` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitud_esquina`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	declare id_ex int; declare precio1 int; declare precio2 int;
	declare tp varchar(20);
	set valor=0; set precio1=0; set precio2=0;
	SET id_ex=(SELECT id_extension FROM extension WHERE id_solicitud_conexion=id LIMIT 1);
	set tp=(select extension.`tipo` from extension where extension.`id_solicitud_conexion`=id limit 1);
	IF (tp='ASFALTO-ASFALTO') THEN
		SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
	ELSEIF (tp='TIERRA-TIERRA') THEN
		SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
	ELSEIF (tp='ASFALTO-TIERRA') THEN
		SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
		SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
	END IF;
	set valor=precio1+precio2;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `solicitud_precio_tipo` */

/*!50003 DROP FUNCTION IF EXISTS `solicitud_precio_tipo` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `solicitud_precio_tipo`(id int, tp varchar(10)) RETURNS varchar(200) CHARSET latin1
BEGIN
	declare valor varchar(200);
	declare id_ex int;
	declare precio int;
	set valor='';
	SET id_ex=(SELECT id_extension FROM extension WHERE id_solicitud_conexion=id LIMIT 1);
	if (tp='ASFALTO') then
		if exists (SELECT monto FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO') then
			SET precio=(SELECT (longitud*monto) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
			set valor=(select concat(longitud_extension.`monto`,'-',longitud_extension.`longitud`) from longitud_extension where longitud_extension.`id_extension`=id_ex and tipo='ASFALTO' limit 1);
			set valor=concat(valor,'-',precio);
		end if;
	elseIF (tp='TIERRA') THEN
		IF EXISTS (SELECT monto FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA') THEN
			SET precio=(SELECT (longitud*monto) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
			SET valor=(SELECT CONCAT(longitud_extension.`monto`,'-',longitud_extension.`longitud`) FROM longitud_extension WHERE longitud_extension.`id_extension`=id_ex AND tipo='TIERRA' LIMIT 1);
			SET valor=CONCAT(valor,'-',precio);
		end if;
	elseIF (tp='DERECHO') THEN
		SET valor=(SELECT precio_conexion.`monto` FROM precio_conexion INNER JOIN extension ON precio_conexion.`id_precio_conexion`=extension.`id_precio_conexion` WHERE extension.`id_solicitud_conexion`=id LIMIT 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `traer_telefono_correo_cliente` */

/*!50003 DROP FUNCTION IF EXISTS `traer_telefono_correo_cliente` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `traer_telefono_correo_cliente`(cta varchar(20), tp varchar(1)) RETURNS varchar(200) CHARSET latin1
BEGIN
	declare valor varchar(200);
	set valor='';
		if (tp='t') then #TELEFONO
			if exists (select cta_cte_catastral from finca_telefono where cta_cte_catastral=cta) then
				set valor=(select telefono from finca_telefono where cta_cte_catastral=cta limit 1 ); #ACA LIMITAMOS A UNO
			end if;
		elseIF (tp='c') THEN #CORREO
			IF EXISTS (SELECT cta_cte_catastral FROM finca_correo WHERE cta_cte_catastral=cta) THEN
				SET valor=(SELECT correo FROM finca_correo WHERE cta_cte_catastral=cta LIMIT 1 ); #ACA LIMITAMOS A UNO
			END IF;
		end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `traer_telefono_correo_finca` */

/*!50003 DROP FUNCTION IF EXISTS `traer_telefono_correo_finca` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `traer_telefono_correo_finca`(cta varchar(20), tp varchar(1)) RETURNS varchar(200) CHARSET latin1
BEGIN
	declare valor varchar(200);
	set valor='';
		if (tp='t') then #TELEFONO
			if exists (select cta_cte_catastral from finca_telefono where cta_cte_catastral=cta) then
				set valor=(select telefono from finca_telefono where cta_cte_catastral=cta limit 1 ); #ACA LIMITAMOS A UNO
			end if;
		elseIF (tp='c') THEN #CORREO
			IF EXISTS (SELECT cta_cte_catastral FROM finca_correo WHERE cta_cte_catastral=cta) THEN
				SET valor=(SELECT correo FROM finca_correo WHERE cta_cte_catastral=cta LIMIT 1 ); #ACA LIMITAMOS A UNO
			END IF;
		end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ultima_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ultima_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ultima_facturacion`() RETURNS varchar(15) CHARSET latin1
BEGIN
	declare valor varchar(15);
	set valor='0';
	if exists (select id_factura from facturacion) then
		set valor=(select CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo from factura inner join facturacion on factura.id_factura=facturacion.`id_factura` order by facturacion.`fecha` desc, facturacion.`numero_factura` desc limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ultima_lectura` */

/*!50003 DROP FUNCTION IF EXISTS `ultima_lectura` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ultima_lectura`(cta varchar(15), med int) RETURNS int(11)
BEGIN
	declare valor integer;
	DECLARE fec_lec DATETIME;
	set fec_lec='2019-01-01 00:00:00'; #FECHA CUALQUIERA ANTES DEL SISTEMA PARA COMPARAR EN CASO DE QUE NO EXISTA
	set valor=(select conexion.`lectura_inicial` from conexion where conexion.`cta_cte_catastral`=cta and conexion.`id_medidor`=med);
	if exists( select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`cta_cte_catastral`=cta and lectura_medidor.`id_medidor`=med and estado!='ANULADO') then
		set valor=(SELECT lectura_medidor.`lectura` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' order by lectura_medidor.`id_lectura` desc limit 1);
		SET fec_lec=(SELECT lectura_medidor.`fecha` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' ORDER BY lectura_medidor.`id_lectura` DESC LIMIT 1);
	end if;
	if exists (select estado_conexion.`id_estado_conexion` from estado_conexion where estado_conexion.`estado`=1 and estado_conexion.`fecha`>fec_lec and estado_conexion.`cta_cte_catastral`=cta and estado_conexion.`id_medidor`=med and estado_conexion.`tipo`='RECONEXION') then
		set valor=(SELECT estado_conexion.`lectura` FROM estado_conexion WHERE estado_conexion.`estado`=1 AND estado_conexion.`fecha`>fec_lec AND estado_conexion.`cta_cte_catastral`=cta AND estado_conexion.`id_medidor`=med AND estado_conexion.`tipo`='RECONEXION' limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `validar_rol_interfaz` */

/*!50003 DROP FUNCTION IF EXISTS `validar_rol_interfaz` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `validar_rol_interfaz`(id int, interfaz varchar(20)) RETURNS smallint(6)
BEGIN
	declare valor smallint;
	set valor=0;
	if (id=1) then #ADMINISTRADOR
		set valor=1; #TIENE ACCESO A TODAS LAS INTERFACES
	elseIF (id=2) THEN #LECTOR
		SET valor=CASE interfaz
			WHEN "lectura" THEN 1
			WHEN "facturar" THEN 1
			WHEN "listar_facturacion" THEN 1
			WHEN "factura" THEN 1
		END;
	ELSEIF (id=3) THEN #CAJERA
		SET valor=CASE interfaz
			WHEN "nota_credito" THEN 1
			WHEN "apertura_caja" THEN 1
			WHEN "cobro" THEN 1
			WHEN "cierre" THEN 1
		END;
	ELSEIF (id=4) THEN #PLOMERO
		SET valor=CASE interfaz
			WHEN "inventario" THEN 1
			WHEN "orden_trabajo" THEN 1
			WHEN "orden_compra" THEN 1
		END;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_banco_cheque_cobro` */

/*!50003 DROP FUNCTION IF EXISTS `ver_banco_cheque_cobro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_banco_cheque_cobro`(id int) RETURNS varchar(40) CHARSET latin1
BEGIN
	declare valor varchar(40);
	set valor='';
	if exists (select id_cobro from `cobro_cheque` where id_cobro= id) then
		set valor=(SELECT banco FROM `cobro_cheque` WHERE id_cobro= id limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_ciclo_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_ciclo_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_ciclo_facturacion`(id int, nro int) RETURNS varchar(25) CHARSET latin1
BEGIN
	declare valor varchar(25);
	declare id_lec_actual int;
	declare fec_actual datetime;
	DECLARE fec_ant DATETIME;
	DECLARE cta VARCHAR (15);
	DECLARE med INT;
	set valor='';
	if exists (select id_factura from facturacion_lectura where id_factura=id and numero_factura=nro)then
		set id_lec_actual=(select id_lectura from facturacion_lectura WHERE id_factura=id AND numero_factura=nro limit 1);
		set fec_actual=(SELECT fecha FROM lectura_medidor where id_lectura=id_lec_actual);
		SET cta=(SELECT lectura_medidor.`cta_cte_catastral` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id_lec_actual limit 1);
		SET med=(SELECT lectura_medidor.`id_medidor` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id_lec_actual limit 1);
		SET fec_ant=(SELECT conexion.`fecha` FROM conexion WHERE conexion.`cta_cte_catastral`=cta AND conexion.`id_medidor`=med);
		IF EXISTS( SELECT lectura_medidor.`id_lectura` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' AND lectura_medidor.`id_lectura`<id_lec_actual) THEN #LECTURA ANTERIOR 
			SET fec_ant=(SELECT lectura_medidor.`fecha` FROM lectura_medidor WHERE lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_medidor`=med AND estado!='ANULADO' AND lectura_medidor.`id_lectura`<id_lec_actual ORDER BY lectura_medidor.`id_lectura` DESC LIMIT 1);
		end if;
		IF EXISTS (SELECT estado_conexion.`id_estado_conexion` FROM estado_conexion WHERE estado_conexion.`fecha`>fec_ant AND estado_conexion.`fecha`<fec_actual AND estado_conexion.`cta_cte_catastral`=cta AND estado_conexion.`id_medidor`=med AND estado_conexion.`tipo`='RECONEXION') THEN #EN CASO DE QUE SE HAYA DESCONECTADO Y RECONECTADO NUEVAMENTE
			SET fec_ant=(SELECT estado_conexion.`fecha` FROM estado_conexion WHERE estado_conexion.`fecha`>fec_ant AND estado_conexion.`fecha`<fec_actual AND estado_conexion.`cta_cte_catastral`=cta AND estado_conexion.`id_medidor`=med AND estado_conexion.`tipo`='RECONEXION' LIMIT 1);
		END IF;
		set valor=concat(date_format(fec_ant,'%d-%m-%Y'),' / ',DATE_FORMAT(fec_actual,'%d-%m-%Y'));
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_cierre_obs` */

/*!50003 DROP FUNCTION IF EXISTS `ver_cierre_obs` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_cierre_obs`(id int) RETURNS varchar(200) CHARSET latin1
BEGIN
	declare valor varchar(200);
	set valor='';
	if exists (select id_cierre from `observacion_cierre` where id_cierre=id)then
		set valor= (SELECT observacion FROM `observacion_cierre` WHERE id_cierre=id limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_consumo_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_consumo_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_consumo_facturacion`(id int, nro int) RETURNS int(11)
BEGIN
	declare valor int;
	DECLARE id_l INT;
	set valor=0;
	if exists (select id_lectura from facturacion_lectura where id_factura=id and numero_factura=nro) then
		set id_l=(SELECT id_lectura FROM facturacion_lectura WHERE id_factura=id AND numero_factura=nro limit 1);
		set valor=calculo_consumo(id_l);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_detalle_solicitud_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_detalle_solicitud_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_detalle_solicitud_facturacion`(id_ex integer,tp varchar(1)) RETURNS int(11)
BEGIN
	declare valor int;	#RETORNA
	declare precio1 DOUBLE;	#PRECIO ASFALTO
	DECLARE precio2 double;	#PRECIO TIERRA
	DECLARE precio_derecho int;
	declare tipo_ext varchar(20); # TIPO EXTENSION PARA CALCULO
	set valor=0; set precio1=0; set precio2=0; set precio_derecho=0;
	if (tp='e') then #EXTENSION
		if exists (select id_extension from extension where id_extension=id_ex) then
			set tipo_ext=(SELECT tipo FROM extension WHERE id_extension=id_ex limit 1);
			if (tipo_ext='ASFALTO') then
				SET precio1=(select (longitud*monto) from longitud_extension where id_extension=id_ex and tipo='ASFALTO');
			elseIF (tipo_ext='TIERRA') THEN
				SET precio2=(SELECT (longitud*monto) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
			elseIF (tipo_ext='ASFALTO-ASFALTO') THEN
				SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
			ELSEIF (tipo_ext='TIERRA-TIERRA') THEN
				SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
			ELSEIF (tipo_ext='ASFALTO-TIERRA') THEN
				SET precio1=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='ASFALTO');
				SET precio2=(SELECT (longitud*monto/2) FROM longitud_extension WHERE id_extension=id_ex AND tipo='TIERRA');
			end if;
			SET valor=precio1+precio2;
		end if;
	elseIF (tp='d') THEN #DERECHO
		IF EXISTS (SELECT id_extension FROM extension WHERE id_extension=id_ex) THEN
			SET valor=(SELECT precio_conexion.`monto` FROM precio_conexion INNER JOIN extension ON precio_conexion.`id_precio_conexion`=extension.`id_precio_conexion` WHERE extension.`id_extension`=id_ex LIMIT 1);
		end if;	
	end if;	
	set valor=valor-(valor/11);
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_deuda_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_deuda_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_deuda_facturacion`(id int, nro int) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	declare id_deu int;
	SET id_deu=(SELECT id_deuda FROM facturacion_deuda WHERE id_factura=id AND numero_factura=nro limit 1);
	SET valor=0;
	IF EXISTS(SELECT deuda.id_deuda FROM deuda WHERE deuda.id_deuda=id_deu) THEN
		SET valor=(SELECT SUM(deuda_factura.monto) FROM deuda_factura  WHERE deuda_factura.id_deuda=id_deu);
	END IF;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_iva_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_iva_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_iva_facturacion`(id int, nro int, tp varchar(10)) RETURNS int(11)
BEGIN
	declare valor int;
	declare id_det int;
	set valor=0;
	IF (tp='CONSUMO') THEN
		set id_det=(select facturacion_lectura.`id_lectura` from facturacion_lectura where id_factura=id and numero_factura=nro limit 1);
		set valor=calculo_consumo_precio(id_det);
		SET valor=valor/10;
	elseIF (tp='SERVICIO') THEN
		set id_det=(select extension.`id_solicitud_conexion` from extension inner join facturacion_extension on extension.`id_extension`=facturacion_extension.`id_extension` where facturacion_extension.`id_factura`=id and facturacion_extension.`numero_factura`=nro limit 1);
		set valor=calculo_total_solicitud(id_det);
		SET valor=valor/11;
	end if;
	
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_lectura_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_lectura_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_lectura_facturacion`(id int, nro int) RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists (select id_lectura from facturacion_lectura where id_factura=id and numero_factura=nro) then
		set valor=(SELECT lm.`lectura` FROM facturacion_lectura AS fl INNER JOIN lectura_medidor AS lm ON fl.`id_lectura`=lm.`id_lectura` WHERE fl.id_factura=id AND fl.numero_factura=nro limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_monto_a_cerrar` */

/*!50003 DROP FUNCTION IF EXISTS `ver_monto_a_cerrar` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_monto_a_cerrar`() RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists( SELECT c.`id_cobro` FROM cobro AS c WHERE c.`id_cobro` NOT IN (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=c.`id_cobro`)) then
		set valor=(SELECT SUM(c.`monto`) FROM cobro AS c WHERE c.`id_cobro` NOT IN (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=c.`id_cobro`));
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_monto_cierre` */

/*!50003 DROP FUNCTION IF EXISTS `ver_monto_cierre` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_monto_cierre`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists (select id_cobro from cierre_cobro where id_cierre=id) then
		set valor=(SELECT SUM(c.`monto`) FROM cierre_cobro AS cc INNER JOIN cobro AS c ON cc.`id_cobro`=c.`id_cobro` WHERE cc.`id_cierre`=id);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_nombre_pago` */

/*!50003 DROP FUNCTION IF EXISTS `ver_nombre_pago` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_nombre_pago`(id int) RETURNS varchar(105) CHARSET latin1
BEGIN
	declare valor varchar(105);
	set valor='';
	if exists (select id_pago from pago_compra where id_pago=id) then #A FUTURO SE AGREGA IF SALARIO PARA PAGO A FUNCIONARIO
		SET valor=(SELECT pr.`razon` FROM pago_compra AS pc INNER JOIN pedido AS p ON pc.`id_pedido`=p.`id_pedido` INNER JOIN proveedor AS pr ON p.`ruc`=pr.`ruc` where pc.id_pago=id limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_notificacion_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_notificacion_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_notificacion_facturacion`(id INT, nro INT, tp varchar(1)) RETURNS varchar(20) CHARSET latin1
BEGIN
	declare valor varchar(20);
	declare cta varchar(15);
	set valor='';
	if (tp='F') then #NOTIFICACION DE FRACCIONAMIENTO
		if exists (select id_factura from facturacion where id_factura= id and numero_factura=nro and tipo='CONSUMO') then
			SET cta=(SELECT lectura_medidor.`cta_cte_catastral` FROM lectura_medidor inner join facturacion_lectura on lectura_medidor.`id_lectura`=facturacion_lectura.`id_lectura` WHERE facturacion_lectura.`id_factura`=id and facturacion_lectura.`numero_factura`=nro LIMIT 1);
			if exists (SELECT cab.`id_factura` FROM facturacion AS cab INNER JOIN facturacion_lectura AS det ON cab.`id_factura`=det.`id_factura` AND cab.`numero_factura`=det.`numero_factura` INNER JOIN lectura_medidor AS lec ON det.`id_lectura`=lec.`id_lectura` WHERE cab.`estado`='FRACCIONADO' AND lec.`cta_cte_catastral`=cta) then
				set valor='FRACCIONAMIENTO'; #SEGUN EL IF CUENTA CON UNA FACTURA DE CONSUMO QUE FUE FRACCIONADO Y TODAVIO NO PAGO TODO
			end if;
		end if;
	else #NOTIFICACION DE ULTIMO AVISO O DESCONEXION
		if exists (select id_factura from facturacion_deuda where id_factura= id and numero_factura= nro) then
			set valor=(SELECT deuda.descripcion FROM facturacion AS cab INNER JOIN facturacion_deuda AS det ON cab.`id_factura`=det.`id_factura` AND cab.`numero_factura`=det.`numero_factura` INNER JOIN deuda ON det.`id_deuda`=deuda.id_deuda WHERE cab.`id_factura`= id AND cab.`numero_factura`=nro limit 1);
		end if;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_nro_cheque_cobro` */

/*!50003 DROP FUNCTION IF EXISTS `ver_nro_cheque_cobro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_nro_cheque_cobro`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists (select id_cobro from `cobro_cheque` where id_cobro= id) then
		set valor=(SELECT nro_cheque FROM `cobro_cheque` WHERE id_cobro= id limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_recibo_cobro` */

/*!50003 DROP FUNCTION IF EXISTS `ver_recibo_cobro` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_recibo_cobro`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	set valor=0;
	if exists (select `nro_recibo` from `recibo_cobro` where `id_cobro`= id) then
		set valor=(SELECT `nro_recibo` FROM `recibo_cobro` WHERE `id_cobro`= id	 limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_redondeo_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_redondeo_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_redondeo_facturacion`(id INT, nro INT, tp varchar(10)) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	DECLARE id_lect INTEGER;
	DECLARE id_deu INTEGER;
	declare id_sol integer;
	DECLARE consumo INTEGER;
	DECLARE deuda INTEGER;
	DECLARE subtotal INTEGER;
	IF (tp='CONSUMO') THEN
		SET id_lect=(SELECT id_lectura FROM facturacion_lectura WHERE id_factura=id AND numero_factura=nro);
		SET id_deu=(SELECT id_deuda FROM facturacion_deuda WHERE id_factura=id AND numero_factura=nro);
		SET id_lect=IFNULL(id_lect,0);
		SET id_deu=IFNULL(id_deu,0);
		SET consumo=(SELECT calculo_consumo_precio(id_lect));
		SET deuda=calculo_consumo_deuda_facturacion(id_deu);
		SET subtotal =(consumo+(consumo/10)+(consumo/50));
		SET valor=ajuste_redondeo(subtotal);
	ELSEIF (tp='SERVICIO') THEN
		SET id_sol=(SELECT extension.`id_solicitud_conexion` FROM extension INNER JOIN  facturacion_extension ON extension.`id_extension`=facturacion_extension.`id_extension` WHERE facturacion_extension.`id_factura`=id AND facturacion_extension.`numero_factura`=id LIMIT 1);
		SET valor=ajuste_redondeo(calculo_total_solicitud(id_sol));
	END IF;
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_ruc_pago` */

/*!50003 DROP FUNCTION IF EXISTS `ver_ruc_pago` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_ruc_pago`(id int) RETURNS varchar(20) CHARSET latin1
BEGIN
	declare valor varchar(20);
	set valor='';
	if exists (select id_pago from pago_compra where id_pago=id) then #A FUTURO SE AGREGA IF SALARIO PARA PAGO A FUNCIONARIO
		SET valor=(SELECT p.ruc FROM pago_compra AS pc INNER JOIN pedido AS p ON pc.`id_pedido`=p.`id_pedido` where pc.id_pago=id limit 1);
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_subtotal_facturacion` */

/*!50003 DROP FUNCTION IF EXISTS `ver_subtotal_facturacion` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_subtotal_facturacion`(id INT, nro INT) RETURNS int(11)
BEGIN
	DECLARE valor INTEGER;
	DECLARE id_lect INTEGER;
	declare id_sol integer;
	DECLARE consumo INTEGER;
	SET id_lect=(SELECT id_lectura FROM facturacion_lectura WHERE id_factura=id AND numero_factura=nro);
	SET id_lect=IFNULL(id_lect,0);
	SET consumo=(SELECT calculo_consumo_precio(id_lect));
	SET valor =(consumo+(consumo/10)+(consumo/50));
	set valor=valor- ajuste_redondeo(valor);
	RETURN valor;
    END */$$
DELIMITER ;

/* Function  structure for function  `ver_total_cierre` */

/*!50003 DROP FUNCTION IF EXISTS `ver_total_cierre` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` FUNCTION `ver_total_cierre`(id int) RETURNS int(11)
BEGIN
	declare valor int;
	DECLARE ini INT;
	set valor=0;
	if exists (select id_cobro from cierre_cobro where id_cierre=id) then
		set ini=(select inicio_cierre.`monto` from inicio_cierre inner join cierre on inicio_cierre.`id_inicio_cierre`=cierre.`id_inicio_cierre` where cierre.`id_cierre`=id limit 1);
		set valor=(SELECT SUM(c.`monto`) FROM cierre_cobro AS cc INNER JOIN cobro AS c ON cc.`id_cobro`=c.`id_cobro` WHERE cc.`id_cierre`=id);
		set valor=ini+valor;
	end if;
	return valor;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_acceso` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_acceso` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_acceso`(proceso varchar(1), usu varchar(20), ps text, ci int, id int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if exists (select ci_personal from personal where ci_personal=ci) then
				SET valor='EX';
				if not exists (select id_acceso from acceso where usuario=usu) then
					SET valor='YA';
					if not exists (select id_acceso from acceso where ci_personal= ci and estado=1) then
						insert into acceso (id_acceso, usuario, pass, estado, ci_personal) values (contador_acceso(), usu, ps, 1, ci);
						set valor='SI';
					end if;
				end if;
			end if;
		elseIF (proceso='B') THEN	
			if exists (select id_acceso from acceso where id_acceso=id) then
				update acceso set acceso.`estado`=0 where acceso.`id_acceso`=id;
				set valor='SI';
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_ajuste` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_ajuste` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_ajuste`( proceso varchar(1), tp int, des varchar(200), id_a int, cod varchar(20), ct double , id int, out valor varchar(2))
BEGIN
		declare ci int;
		set valor='NO';
		if (proceso='A') then
			if exists (select id_acceso from acceso where id_acceso=id_a) then
				if exists (select cod_barra from producto where cod_barra=cod) then
					set ci=(select ci_personal from acceso where id_acceso=id_a limit 1);
					insert into ajuste( id_ajuste, fecha, tipo, descripcion, ci_personal, cod_barra, cantidad) values (contador_ajuste(), now(), tp, des, ci, cod, ct);
					set valor='SI';
				end if;
			end if;
		elseIF (proceso='B') THEN
			if exists (select id_ajuste from ajuste where id_ajuste=id) then
				delete from ajuste where id_ajuste=id;
				set valor='SI';
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_barrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_barrio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_barrio`(proceso varchar(1), des varchar(70), id int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if not exists (select id_barrio from barrio where barrio.nombre_barrio=des) then
				INSERT INTO barrio(id_barrio, nombre_barrio) values (contador_barrio(), des);
				set valor='SI';
			end if;
		elseIF (proceso='B') THEN
			IF EXISTS (SELECT id_barrio from barrio where barrio.id_barrio=id) then
				SET valor='EX';
				if not exists (select id_barrio from finca where finca.id_barrio=id) then
					DELETE FROM barrio WHERE barrio.id_barrio=id;
					SET valor='SI';
				end if;
			end if;
		elseIF (proceso='M') THEN
			IF EXISTS (SELECT id_barrio FROM barrio WHERE barrio.id_barrio=id) THEN
				SET valor='EX';
				IF NOT EXISTS (SELECT id_barrio FROM barrio WHERE barrio.nombre_barrio=des) THEN
					UPDATE barrio SET barrio.nombre_barrio=des WHERE barrio.id_barrio=id;
					SET valor='SI';
				END IF;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_cliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_cliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_cliente`(proceso varchar(1),ci varchar(20), nom varchar(50), ape varchar(50),out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') THEN
			if not exists (select cliente.ci_cliente from cliente where cliente.ci_cliente=ci) then
				insert into cliente(ci_cliente, nombre, apellido) values (ci, nom, ape);
				set valor='SI';
			end if;
		ELSEIF (proceso='B') then
			IF EXISTS (SELECT cliente.ci_cliente FROM cliente WHERE cliente.ci_cliente=ci) THEN
				SET valor='FC';
				IF NOT EXISTS (SELECT facturacion.`ci_cliente` FROM facturacion WHERE facturacion.`ci_cliente`=ci) THEN
					SET valor='EX';
					IF NOT EXISTS (SELECT finca.ci_cliente FROM finca WHERE finca.ci_cliente=ci) THEN
						delete from cliente where cliente.ci_cliente=ci;
						SET valor='SI';
					end if;
				end if;
			END IF;
		elseif (proceso='M') then
			IF EXISTS (SELECT cliente.ci_cliente FROM cliente WHERE cliente.ci_cliente=ci) THEN
				update cliente set cliente.nombre=nom, cliente.apellido=ape where cliente.ci_cliente=ci;
				SET valor='SI';
			end iF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_conexion`(proceso varchar(1), cta varchar(15), id_med int, lectura int, out valor varchar(2))
BEGIN
		declare ci varchar(20);
		set valor='NO';
		if (proceso='A') THEN
			SET valor='FC';#NO EXISTE FINCA
			if exists (select cta_cte_catastral from finca where cta_cte_catastral=cta) then
				SET valor='MD'; #NO EXISTE MEDIDOR
				IF EXISTS (SELECT id_medidor FROM medidor WHERE id_medidor=id_med) THEN
					SET valor='FE'; #ESTA FINCA CUENTA CON CONEXION ACTIVA
					if not exists (SELECT cta_cte_catastral FROM conexion WHERE cta_cte_catastral=cta AND estado=1) THEN
						SET valor='ME'; #ESTA MEDIDOR CUENTA CON CONEXION ACTIVA
						IF NOT EXISTS (SELECT cta_cte_catastral FROM conexion WHERE id_medidor=id_med AND estado=1) THEN
							SET valor='EX'; #ESTA CONEXION YA EXISTE
							IF NOT EXISTS (SELECT cta_cte_catastral FROM conexion WHERE cta_cte_catastral=cta AND id_medidor=id_med) THEN
								INSERT INTO conexion( cta_cte_catastral, id_medidor, fecha, estado, lectura_inicial) VALUES (cta, id_med, NOW(), 1, lectura);
								set ci=(select ci_cliente from finca where cta_cte_catastral=cta limit 1);
								insert into contrato( id_contrato, descripcion, estado, cta_cte_catastral, id_medidor, ci_cliente) values (contador_contrato(), 'contrato', 'ACTIVO', cta, id_med, ci); 
								SET valor='SI';
							END IF;
						end if;
					end if;
				end if;
			end if;
		ELSEIF (proceso='B') THEN
			if exists (select cta_cte_catastral from conexion where cta_cte_catastral=cta and estado=1 and id_medidor=id_med) then
				update conexion set conexion.estado=0 where conexion.cta_cte_catastral=cta AND id_medidor=id_med;
				update contrato set contrato.`estado`=0 where contrato.cta_cte_catastral=cta AND id_medidor=id_med;
				set valor='SI';
			end if;
		ELSEIF (proceso='M') THEN
			IF EXISTS (SELECT cta_cte_catastral FROM conexion WHERE cta_cte_catastral=cta and id_medidor=id_med and estado=1) THEN
				SET valor='LC'; #CUENTA CON LECTURA ACTIVA
				if not exists (select id_lectura from lectura_medidor WHERE cta_cte_catastral=cta AND id_medidor=id_med AND estado!='ANULADO') then
					update conexion set conexion.lectura_inicial=lectura where cta_cte_catastral=cta and id_medidor=id_med;
					set valor='SI';
				end if;
			end if;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_factura` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_factura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_factura`(proceso varchar(1), n1 varchar(3), n2 varchar(3), des int, has int, id int, out valor varchar(2))
BEGIN
	set valor='NO';
	if (proceso='A') then
		if (des<=has) then
			if not exists (select id_factura from factura where primera_numeracion=n1 and segunda_numeracion=n1 and estado=1 and des between desde and hasta) then #QUE DESDE NO SE ENCUETRE EN UN RANGO
				IF NOT EXISTS (SELECT id_factura FROM factura WHERE primera_numeracion=n1 AND segunda_numeracion=n1 AND estado=1 AND has BETWEEN desde AND hasta) THEN #QUE HASTA NO SE ENCUETRE EN UN RANGO
					insert into factura (id_factura, primera_numeracion, segunda_numeracion, desde, hasta, estado) values (contador_factura(), n1, n2, des, has, 1);
					set valor='SI';
				end if;
			end if;
		END IF;
	elseIF (proceso='B') THEN
		if exists (select id_factura from factura where id_factura=id) then
			update factura set estado=0 where id_factura=id;
			set valor='SI';
		end if;
	end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_finca` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_finca` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_finca`(proceso varchar(1),cta varchar(15), ci varchar(20), dire varchar(100), id_bar int, orden_f double, out valor varchar(2) )
BEGIN
		declare anterior int;
		set valor='NO';
		if (proceso='A')then
			IF not EXISTS (SELECT finca.`cta_cte_catastral` FROM finca WHERE finca.`cta_cte_catastral`=cta) THEN
				SET valor='EX';
				IF EXISTS (SELECT barrio.id_barrio FROM barrio WHERE barrio.id_barrio=id_bar) THEN
					IF EXISTS (SELECT cliente.ci_cliente FROM cliente WHERE cliente.ci_cliente=ci) THEN
						set anterior=(SELECT ifnull(MAX(orden),0)+1 AS c FROM finca);
						insert into finca(cta_cte_catastral, ci_cliente, direccion, id_barrio, orden) values (cta, ci, dire, id_bar, anterior);
						if (anterior!=orden_f) then
							call actualizar_orden(cta, orden_f);
						end if;
						set valor='SI';
					end if;
				end if;
			end if;
		elseIF (proceso='B')THEN
			if exists (select finca.`cta_cte_catastral` from finca where finca.`cta_cte_catastral`=cta) then
				set valor='EX';
				IF NOT EXISTS (SELECT deuda.cta_cte_catastral FROM deuda WHERE deuda.`cta_cte_catastral`=cta) THEN
					IF NOT EXISTS (SELECT cta_cte_catastral FROM solicitud_conexion WHERE `cta_cte_catastral`=cta) THEN
						IF NOT EXISTS (SELECT conexion.`cta_cte_catastral` FROM conexion WHERE conexion.`cta_cte_catastral`=cta) THEN
							delete from finca_correo where finca_correo.`cta_cte_catastral`=cta;
							delete from finca_telefono where finca_telefono.`cta_cte_catastral`=cta;
							delete from finca where finca.`cta_cte_catastral`=cta;
							call enumerar();
							set valor='SI';
						end if;
					end if;
				end if;
			end if;
		elseIF (proceso='M')THEN
			IF EXISTS (SELECT finca.`cta_cte_catastral` FROM finca WHERE finca.`cta_cte_catastral`=cta) THEN
				set valor='EX';
				IF EXISTS (SELECT barrio.id_barrio FROM barrio WHERE barrio.id_barrio=id_bar) THEN
					IF EXISTS (SELECT cliente.ci_cliente FROM cliente WHERE cliente.ci_cliente=ci) THEN
						update finca set finca.`ci_cliente`=ci, finca.`direccion`=dire, finca.`id_barrio`=id_bar where finca.`cta_cte_catastral`=cta;
						set anterior=(select orden from finca where cta_cte_catastral=cta);
						IF (anterior!=orden_f) THEN
							CALL actualizar_orden(cta, orden_f);
						END IF;
						SET valor='SI';
					END IF;
				END IF;
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_lectura` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_lectura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_lectura`(proceso varchar(1),cta varchar(15), med int,lect int, id int)
BEGIN
	declare consumo int;
	DECLARE consumo_ant INT;
	declare id_prec int;
	if(lect!=0) then
		if exists (select cta_cte_catastral from conexion where cta_cte_catastral=cta and id_medidor=med) then
			set consumo_ant=ultima_lectura(cta,med);
			if (proceso='M') then
				set consumo_ant=lectura_anterior(id);
			end if;
			set consumo=lect-consumo_ant;
			if (consumo>=0) then
				SET id_prec=(SELECT id_precio_consumo FROM precio_consumo WHERE desde<= consumo AND hasta>=consumo AND estado=1 LIMIT 1);	
				if (proceso='A') then
					IF not EXISTS (SELECT lectura_medidor.`id_lectura` FROM lectura_medidor WHERE cta_cte_catastral=cta AND id_medidor=med and estado='ACTIVO') THEN #QUE NO EXISTA LECTURA ACTIVA
						INSERT INTO lectura_medidor(id_lectura, cta_cte_catastral, id_medidor, id_precio_consumo, lectura, estado, fecha) values (contador_lectura(), cta, med, id_prec, lect, 'ACTIVO', now());
					end if;
				elseif(proceso='M') then
					if exists (select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`id_lectura`=id) then
						UPDATE lectura_medidor set lectura_medidor.`lectura`=lect, id_precio_consumo=id_prec where lectura_medidor.`id_lectura`=id;
					end if;
				end if;
			end if;
		end if;
	end if;
	IF(proceso='B') THEN
		IF EXISTS (SELECT lectura_medidor.`id_lectura` FROM lectura_medidor WHERE lectura_medidor.`id_lectura`=id) THEN
			UPDATE lectura_medidor SET lectura_medidor.`estado`='ANULADO' WHERE lectura_medidor.`id_lectura`=id;
		END IF;
	END IF;
	
END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_medidor` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_medidor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_medidor`(proceso varchar(1), cod varchar(20), id_model int, id int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') THEN
			if not exists(select medidor.`id_medidor` from medidor where medidor.`codigo`=cod) then
				insert into medidor (id_medidor, codigo, id_modelo_medidor) values (contador_medidor(), cod, id_model);
				set valor='SI';
			end if;
		ELSEIF (proceso='B') THEN
			IF EXISTS (select medidor.`id_medidor` from medidor where medidor.`id_medidor`=id) then
				SET valor='EX';
				if not exists (select conexion.id_medidor from conexion where conexion.id_medidor=id) then
					delete from medidor where medidor.`id_medidor`=id;
					set valor='SI';
				end if;
			end if;
		ELSEIF (proceso='M') THEN
			IF EXISTS (SELECT medidor.`id_medidor` FROM medidor WHERE medidor.`id_medidor`=id) THEN
				SET valor='EX';
				IF NOT EXISTS (SELECT medidor.`id_medidor` FROM medidor WHERE medidor.`codigo`=cod and medidor.`id_medidor`!=id) THEN
					update medidor set medidor.`codigo`=cod, medidor.`id_modelo_medidor`=id_model WHERE medidor.`id_medidor`=id;
					SET valor='SI';
				END IF;
			END IF;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_modelo` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_modelo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_modelo`(proceso VARCHAR(1), des VARCHAR(70), id INT, OUT valor VARCHAR(2))
BEGIN
		SET valor='NO';
		IF (proceso='A') THEN
			IF NOT EXISTS (SELECT id_modelo_medidor FROM modelo_medidor WHERE modelo_medidor.`nombre_modelo`=des) THEN
				INSERT INTO modelo_medidor(id_modelo_medidor, nombre_modelo) VALUES (contador_modelo(), des);
				SET valor='SI';
			END IF;
		ELSEIF (proceso='B') THEN
			IF EXISTS (SELECT id_modelo_medidor FROM modelo_medidor WHERE modelo_medidor.`id_modelo_medidor`=id) THEN
				SET valor='EX';
				IF NOT EXISTS (SELECT id_modelo_medidor FROM medidor WHERE medidor.`id_modelo_medidor`=id) THEN
					DELETE FROM modelo_medidor WHERE modelo_medidor.`id_modelo_medidor`=id;
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='M') THEN
			IF EXISTS (SELECT id_modelo_medidor FROM modelo_medidor WHERE modelo_medidor.`id_modelo_medidor`=id) THEN
				SET valor='EX';
				IF NOT EXISTS (SELECT id_modelo_medidor FROM modelo_medidor WHERE modelo_medidor.`nombre_modelo`=des) THEN
					UPDATE modelo_medidor SET modelo_medidor.`nombre_modelo`=des WHERE modelo_medidor.`id_modelo_medidor`=id;
					SET valor='SI';
				END IF;
			END IF;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_nota_credito` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_nota_credito` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_nota_credito`(proceso varchar(1), nro varchar(20), des varchar(200), mt int, bol int, id_f int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if not exists (select nro_nota_credito from nota_credito where nro_nota_credito=nro and numero_factura=bol and id_factura=id_f) then
				insert into nota_credito ( nro_nota_credito, fecha, descripcion, monto, estado, numero_factura, id_factura) values (nro, now(), des, mt, 1, bol, id_f);
				set valor='SI';
			end if;
		elseIF (proceso='B') THEN
			IF EXISTS (SELECT nro_nota_credito FROM nota_credito WHERE nro_nota_credito=nro AND numero_factura=bol AND id_factura=id_f and descripcion!='ANULACION') THEN
				update nota_credito set estado=0 WHERE nro_nota_credito=nro AND numero_factura=bol AND id_factura=id_f;
				SET valor='SI';
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_nota_debito` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_nota_debito` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_nota_debito`(proceso varchar(1), nro varchar(20), fec date, des varchar(200), mt int, bol varchar(20), id_p int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if not exists (select nro_nota_debito from nota_debito where nro_nota_debito=nro and nro_boleta=bol and id_pedido=id_p) then
				insert into nota_debito ( nro_nota_debito, fecha, descripcion, monto, estado, nro_boleta, id_pedido) values (nro, fec, des, mt, 1, bol, id_p);
				set valor='SI';
			end if;
		elseIF (proceso='B') THEN
			IF EXISTS (SELECT nro_nota_debito FROM nota_debito WHERE nro_nota_debito=nro AND nro_boleta=bol AND id_pedido=id_p) THEN
				update nota_debito set estado=0 WHERE nro_nota_debito=nro AND nro_boleta=bol AND id_pedido=id_p;
				SET valor='SI';
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_pago` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_pago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_pago`(mt int, extr int, bol int, nro varchar(20))
BEGIN
		declare contador int;
		set contador= contador_pago();
		insert into extraccion ( nro_extraccion, fecha, monto, estado, nro_cuenta_banco, id_banco) values (extr, now(), mt, 1, '2238-001/51', 1);
		insert into pago (id_pago, fecha, nro_extraccion, nro_cuenta_banco, id_banco, monto) values (contador, now(), extr, '2238-001/51', 1, mt);
		insert into pago_compra( id_pago, id_pedido, nro_boleta) values (contador, bol, nro);
		if (calculo_saldo_compra(bol)<1) then
			update compra set estado='PAGADO' where id_pedido=bol and nro_boleta=nro;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_personal` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_personal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_personal`(proceso varchar(1),ci int, nom varchar(50), ape varchar(50), dire varchar(100), id_r int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			IF not exists (select ci_personal from personal where ci_personal=ci) then
				if exists (select id_rol from rol where id_rol=id_r) then
					insert into personal (ci_personal, nombre, apellido, direccion, id_rol) values (ci, nom, ape, dire, id_r);
					set valor='SI';
				end if;
			end if;
		elseIF (proceso='B') THEN
			if not exists (select ci_personal from cobro where ci_personal=ci) then
				if not exists (select ci_personal from cierre where ci_personal=ci) then
					if not exists (select ci_personal from salario where ci_personal=ci) then
						if not exists (select ci_personal from orden_compra where ci_personal=ci) then
							if not exists (select ci_personal from trabajo_personal where ci_personal=ci) then
								if not exists (select ci_personal from acceso where ci_personal=ci) then
								IF NOT EXISTS (SELECT ci_personal FROM pedido WHERE ci_personal=ci) THEN
								IF NOT EXISTS (SELECT ci_personal FROM inicio_cierre WHERE ci_personal=ci) THEN
								IF NOT EXISTS (SELECT ci_personal FROM ajuste WHERE ci_personal=ci) THEN
									delete from personal_correo where ci_personal=ci;
									DELETE FROM personal_telefono WHERE ci_personal=ci;
									DELETE FROM personal WHERE ci_personal=ci;
									set valor='SI';
								end if;
								END IF;
								END IF;
								END IF;
							end if;
						end if;
					end if;
				end if;
			end if;
		elseIF (proceso='M') THEN
			if exists (select ci_personal from personal where ci_personal=ci) then
				if exists (select id_rol from rol where id_rol=id_r) then
					update personal set personal.`nombre`=nom, personal.`apellido`=ape, personal.`direccion`=dire, personal.`id_rol`=id_r where personal.`ci_personal`=ci;
					set valor='SI';
				end if;
			end iF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_producto` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_producto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_producto`(proceso VARCHAR(1), cod varchar(20), des varchar(100), iv smallint, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if not exists(select cod_barra from producto where cod_barra=cod) then
				insert into producto( cod_barra, descripcion, iva) values (cod, des, iva);
				set valor='SI';
			end if;
		ELSEIF (proceso='B') THEN
			IF EXISTS(SELECT cod_barra FROM producto WHERE cod_barra=cod) THEN
				IF NOT EXISTS (SELECT cod_barra from trabajo_producto where cod_barra=cod) then
					if not exists (select cod_barra from orden_compra_detalle where cod_barra=cod) then
						IF NOT EXISTS (SELECT cod_barra FROM ajuste WHERE cod_barra=cod) THEN
							IF NOT EXISTS (SELECT cod_barra FROM pedido_detalle WHERE cod_barra=cod) THEN
								delete from producto where cod_barra=cod;
								SET valor='SI';
							end if;
						end if;
					end if;
				end if;
			end if;
		ELSEIF (proceso='M') THEN
			IF EXISTS(SELECT cod_barra FROM producto WHERE cod_barra=cod) THEN
				update producto set descripcion=des, iva=iv where cod_barra=cod;
				set valor='SI';
			end if;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `abm_proveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `abm_proveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `abm_proveedor`(proceso varchar(1), rc varchar(20), rz varchar(100), dire varchar(100), out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			IF NOT EXISTS (select ruc from proveedor where ruc=rc) then
				insert into proveedor( ruc, razon, direccion) values (rc, rz, dire);
				set valor='SI';
			end if;
		elseIF (proceso='B') THEN
			if exists (select ruc from proveedor where ruc=rc) then
				if not exists (select ruc from pedido where ruc=rc) then
					delete from proveedor_correo where ruc=rc;
					delete from proveedor_telefono where ruc=rc;
					delete from proveedor where ruc=rc;
					SET valor='SI';
				end if;
			end if;
		ELSEIF (proceso='M') THEN
			if exists (select ruc from proveedor where ruc=rc) then
				update proveedor set razon=rz, direccion=dire where ruc=rc;
				SET valor='SI';
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_orden` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_orden` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_orden`(cta varchar(15),nro INTEGER)
BEGIN
		declare item varchar(15);
		declare posicion int;
		declare sumar int;
		declare val int;
		declare nuevo_orden double;
		if not exists(select cta_cte_catastral from finca where orden=nro)then
			set item='0';
		else
			SET item=(SELECT cta_cte_catastral FROM finca WHERE orden=nro);	/*	id del orden actual - busco el id que voy a utilizar como parametro*/	
		end if;
		IF(item!=cta)THEN
			if not exists (SELECT orden FROM finca WHERE cta_cte_catastral=cta) then
				set posicion=0;
			else
				SET posicion=(SELECT orden FROM finca WHERE cta_cte_catastral=cta);
			end if;
			SET val=(SELECT COUNT(cta_cte_catastral) FROM finca);
			IF(nro=val)THEN
				SET sumar=nro+1;			
				UPDATE finca SET orden=sumar WHERE cta_cte_catastral=cta;
			ELSE 
				IF(posicion>nro)THEN
					SET nuevo_orden=(nro+0.1);
					UPDATE finca SET orden=nuevo_orden WHERE cta_cte_catastral=item;		/* 3	este es el nuevo que agrego		*/
					UPDATE finca SET orden=nro WHERE cta_cte_catastral=cta; 		/* 4	el que esta le agrego más uno	*/
				ELSE
					IF(posicion<nro)THEN
					SET nuevo_orden=(nro+0.1);
					UPDATE finca SET orden=nuevo_orden WHERE cta_cte_catastral=cta;		/* 3	este es el nuevo que agrego		*/
					UPDATE finca SET orden=nro WHERE cta_cte_catastral=item;		/* 4	el que esta le agrego más uno	*/
					END IF;
				END IF;
			END IF;
		END IF;
		CALL enumerar(); 
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_acceso` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_acceso` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_acceso`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='C')THEN
			select acceso.id_acceso, acceso.usuario, personal.ci_personal, personal.nombre, personal.apellido from acceso inner join personal ON acceso.ci_personal=personal.ci_personal where acceso.estado=1 and personal.ci_personal like CONCAT(dato,'%');
		ELSEIF (tp='N')then
			SELECT acceso.id_acceso, acceso.usuario, personal.ci_personal, personal.nombre, personal.apellido FROM acceso inner join personal on acceso.ci_personal=personal.ci_personal WHERE acceso.estado=1 AND  CONCAT (personal.nombre,' ',personal.apellido) LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_ajuste` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_ajuste` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_ajuste`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='C')THEN
			select ajuste.`id_ajuste`, date_format(ajuste.`fecha`,'%d-%m-%Y') as fecha, ajuste.`descripcion`, ajuste.`tipo`, ajuste.`cod_barra`, producto.`descripcion` AS nombre FROM ajuste inner join producto on ajuste.`cod_barra`=producto.`cod_barra` where ajuste.`cod_barra` LIKE CONCAT(dato,'%');
		ELSEIF (tp='D')THEN
			SELECT ajuste.`id_ajuste`, DATE_FORMAT(ajuste.`fecha`,'%d-%m-%Y') AS fecha, ajuste.`descripcion`, ajuste.`tipo`, ajuste.`cod_barra`, producto.`descripcion` as nombre FROM ajuste INNER JOIN producto ON ajuste.`cod_barra`=producto.`cod_barra` WHERE ajuste.`descripcion` LIKE CONCAT(dato,'%');
		ELSEIF (tp='P')THEN
			SELECT ajuste.`id_ajuste`, DATE_FORMAT(ajuste.`fecha`,'%d-%m-%Y') AS fecha, ajuste.`descripcion`, ajuste.`tipo`, ajuste.`cod_barra`, producto.`descripcion`as nombre FROM ajuste INNER JOIN producto ON ajuste.`cod_barra`=producto.`cod_barra` WHERE producto.`descripcion` LIKE CONCAT(dato,'%');
		ELSEIF (tp='F')then
			SELECT ajuste.`id_ajuste`, DATE_FORMAT(ajuste.`fecha`,'%d-%m-%Y') AS fecha, ajuste.`descripcion`, ajuste.`tipo`, ajuste.`cod_barra`, producto.`descripcion`AS nombre FROM ajuste INNER JOIN producto ON ajuste.`cod_barra`=producto.`cod_barra` WHERE DATE_FORMAT(ajuste.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_barrio` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_barrio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_barrio`(dato VARCHAR(80))
BEGIN
		SELECT id_barrio, nombre_barrio as nombre from barrio where barrio.nombre_barrio LIKE CONCAT(dato,'%');
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_cierre`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='N')THEN
			SELECT c.id_cierre, DATE_FORMAT(c.`fecha`,'%d-%m-%Y') AS fecha, FORMAT(i.`monto`,0,'de_DE') AS inicio, FORMAT(ver_monto_cierre(c.`id_cierre`),0,'de_DE') AS cobro, FORMAT(ver_total_cierre(c.`id_cierre`),0,'de_DE') AS total, CONCAT(p.nombre,' ',p.apellido) AS nomape FROM cierre AS c INNER JOIN inicio_cierre AS i ON c.`id_inicio_cierre`=i.`id_inicio_cierre` INNER JOIN personal AS p ON c.`ci_personal`=p.ci_personal WHERE CONCAT (p.nombre,' ',p.apellido) LIKE CONCAT(dato,'%') order by c.id_cierre DESC;
		ELSEIF (tp='F')then
			SELECT c.id_cierre, DATE_FORMAT(c.`fecha`,'%d-%m-%Y') AS fecha, FORMAT(i.`monto`,0,'de_DE') AS inicio, FORMAT(ver_monto_cierre(c.`id_cierre`),0,'de_DE') AS cobro, FORMAT(ver_total_cierre(c.`id_cierre`),0,'de_DE') AS total, CONCAT(p.nombre,' ',p.apellido) AS nomape FROM cierre AS c INNER JOIN inicio_cierre AS i ON c.`id_inicio_cierre`=i.`id_inicio_cierre` INNER JOIN personal AS p ON c.`ci_personal`=p.ci_personal WHERE DATE_FORMAT(c.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY c.id_cierre DESC;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_cliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_cliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_cliente`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='C')THEN
			select ci_cliente, nombre, apellido from cliente where cliente.ci_cliente like CONCAT(dato,'%');
		ELSEIF (tp='N')then
			SELECT ci_cliente, nombre, apellido FROM cliente WHERE CONCAT (cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_cobro` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_cobro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_cobro`(tp VARCHAR(2),dato VARCHAR(80))
BEGIN
		IF (tp='FA')THEN
			SELECT DATE_FORMAT(co.fecha,'%d-%m-%Y') AS fecha, CONCAT(`fa`.`primera_numeracion`,'-',`fa`.`segunda_numeracion`,'-',CONVERT(LPAD(`cab`.`numero_factura`,7,'0') USING latin1)) AS `num_completo`, cab.`ci_cliente`, CONCAT(cl.nombre,' ',cl.apellido) AS nomape, FORMAT(co.monto,0,'de_DE') AS monto FROM cobro AS co INNER JOIN facturacion AS cab ON co.`id_factura`=cab.`id_factura` AND co.`numero_factura`=cab.`numero_factura` INNER JOIN factura AS fa ON co.`id_factura`=fa.id_factura INNER JOIN cliente AS cl ON cab.`ci_cliente`=cl.ci_cliente where cab.numero_factura LIKE CONCAT(dato,'%') ORDER BY co.id_cobro DESC;
		ELSEIF (tp='CI')THEN
			SELECT DATE_FORMAT(co.fecha,'%d-%m-%Y') AS fecha, CONCAT(`fa`.`primera_numeracion`,'-',`fa`.`segunda_numeracion`,'-',CONVERT(LPAD(`cab`.`numero_factura`,7,'0') USING latin1)) AS `num_completo`, cab.`ci_cliente`, CONCAT(cl.nombre,' ',cl.apellido) AS nomape, FORMAT(co.monto,0,'de_DE') AS monto FROM cobro AS co INNER JOIN facturacion AS cab ON co.`id_factura`=cab.`id_factura` AND co.`numero_factura`=cab.`numero_factura` INNER JOIN factura AS fa ON co.`id_factura`=fa.id_factura INNER JOIN cliente AS cl ON cab.`ci_cliente`=cl.ci_cliente WHERE cab.ci_cliente LIKE CONCAT(dato,'%') ORDER BY co.id_cobro DESC;
		ELSEIF (tp='RZ')THEN
			SELECT DATE_FORMAT(co.fecha,'%d-%m-%Y') AS fecha, CONCAT(`fa`.`primera_numeracion`,'-',`fa`.`segunda_numeracion`,'-',CONVERT(LPAD(`cab`.`numero_factura`,7,'0') USING latin1)) AS `num_completo`, cab.`ci_cliente`, CONCAT(cl.nombre,' ',cl.apellido) AS nomape, FORMAT(co.monto,0,'de_DE') AS monto FROM cobro AS co INNER JOIN facturacion AS cab ON co.`id_factura`=cab.`id_factura` AND co.`numero_factura`=cab.`numero_factura` INNER JOIN factura AS fa ON co.`id_factura`=fa.id_factura INNER JOIN cliente AS cl ON cab.`ci_cliente`=cl.ci_cliente WHERE CONCAT(cl.nombre,' ',cl.apellido) LIKE CONCAT(dato,'%') ORDER BY co.id_cobro DESC;
		ELSEIF (tp='FE')THEN
			SELECT DATE_FORMAT(co.fecha,'%d-%m-%Y') AS fecha, CONCAT(`fa`.`primera_numeracion`,'-',`fa`.`segunda_numeracion`,'-',CONVERT(LPAD(`cab`.`numero_factura`,7,'0') USING latin1)) AS `num_completo`, cab.`ci_cliente`, CONCAT(cl.nombre,' ',cl.apellido) AS nomape, FORMAT(co.monto,0,'de_DE') AS monto FROM cobro AS co INNER JOIN facturacion AS cab ON co.`id_factura`=cab.`id_factura` AND co.`numero_factura`=cab.`numero_factura` INNER JOIN factura AS fa ON co.`id_factura`=fa.id_factura INNER JOIN cliente AS cl ON cab.`ci_cliente`=cl.ci_cliente WHERE DATE_FORMAT(co.fecha,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY co.id_cobro DESC;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_compra`(tp VARCHAR(1),dato VARCHAR(80), interfaz varchar(10))
BEGIN
		if (interfaz='TODOS') then #PARA NOTA DEBITO
			IF (tp='B')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`!='ANULADO' AND compra.`nro_boleta` LIKE CONCAT(dato,'%');
			ELSEIF (tp='F')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`!='ANULADO' AND DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
			ELSEIF (tp='C')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`!='ANULADO' AND pedido.`ruc` LIKE CONCAT(dato,'%');
			ELSEIF (tp='N')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`!='ANULADO' AND proveedor.razon LIKE CONCAT(dato,'%');
			END IF;
		elseIF (interfaz='PAGO') THEN #PARA PAGOS
			IF (tp='B')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`='ACTIVO' AND compra.`nro_boleta` LIKE CONCAT(dato,'%');
			ELSEIF (tp='F')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`='ACTIVO' AND DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
			ELSEIF (tp='C')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`='ACTIVO' AND pedido.`ruc` LIKE CONCAT(dato,'%');
			ELSEIF (tp='N')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, FORMAT(calculo_saldo_compra(compra.`id_pedido`),0, 'de_DE') AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`='ACTIVO' AND proveedor.razon LIKE CONCAT(dato,'%');
			END IF;
		else #SALDO 0 PORQUE NO SE VA A USAR Y PARA AGILIZAR NO LLAMO A LA FUNCION
			IF (tp='B')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, '0' as saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`=interfaz AND compra.`nro_boleta` LIKE CONCAT(dato,'%');
			ELSEIF (tp='F')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, '0' AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`=interfaz AND DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
			ELSEIF (tp='C')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, '0' AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`=interfaz AND pedido.`ruc` LIKE CONCAT(dato,'%');
			ELSEIF (tp='N')THEN
				SELECT compra.`id_pedido`, compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon, FORMAT(calculo_total_compra(compra.`id_pedido`),0, 'de_DE') AS total, '0' AS saldo FROM compra INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`=interfaz AND proveedor.razon LIKE CONCAT(dato,'%');
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_conexion`( tp VARCHAR(2),dato varchar(80))
BEGIN
		if (tp='CT')THEN
			select conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') as fecha, conexion.`estado`, conexion.`id_medidor`, conexion.`lectura_inicial`, finca.`direccion`, finca.`orden`, barrio.nombre_barrio, cliente.ci_cliente, concat(cliente.nombre,' ', cliente.apellido) as nomape, medidor.codigo from conexion INNER join finca on conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER join medidor on conexion.`id_medidor`=medidor.id_medidor INNER join barrio on finca.`id_barrio`=barrio.id_barrio INNER join cliente on finca.`ci_cliente`=cliente.ci_cliente where conexion.`estado`=1 and conexion.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
		ELSEIF (tp='CI')then
			SELECT conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') AS fecha, conexion.`estado`, conexion.`id_medidor`, conexion.`lectura_inicial`, finca.`direccion`, finca.`orden`, barrio.nombre_barrio, cliente.ci_cliente, CONCAT(cliente.nombre,' ', cliente.apellido) AS nomape, medidor.codigo FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.id_medidor INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE conexion.`estado`=1 AND cliente.ci_cliente LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
		ELSEIF (tp='NO')THEN
			SELECT conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') AS fecha, conexion.`estado`, conexion.`id_medidor`, conexion.`lectura_inicial`, finca.`direccion`, finca.`orden`, barrio.nombre_barrio, cliente.ci_cliente, CONCAT(cliente.nombre,' ', cliente.apellido) AS nomape, medidor.codigo FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.id_medidor INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE conexion.`estado`=1 AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_desconexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_desconexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_desconexion`(tp VARCHAR(2),dato VARCHAR(80), interfaz VARCHAR(15))
BEGIN
		if (interfaz='DESCONECTAR') THEN
			IF (tp='CT')THEN
			SELECT conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') AS fecha, conexion.`id_medidor`,  finca.`direccion`,  barrio.nombre_barrio, cliente.ci_cliente, CONCAT(cliente.nombre,' ', cliente.apellido) AS nomape, medidor.codigo FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.id_medidor INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE conexion.`estado`=1 AND conexion.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			ELSEIF (tp='CI')THEN
				SELECT conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') AS fecha, conexion.`id_medidor`,  finca.`direccion`,  barrio.nombre_barrio, cliente.ci_cliente, CONCAT(cliente.nombre,' ', cliente.apellido) AS nomape, medidor.codigo FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.id_medidor INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE conexion.`estado`=1 AND cliente.ci_cliente LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			ELSEIF (tp='NO')THEN
				SELECT conexion.`cta_cte_catastral`, DATE_FORMAT(conexion.`fecha`,'%d-%m-%Y') AS fecha, conexion.`id_medidor`,  finca.`direccion`,  barrio.nombre_barrio, cliente.ci_cliente, CONCAT(cliente.nombre,' ', cliente.apellido) AS nomape, medidor.codigo FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.id_medidor INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE conexion.`estado`=1 AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			END IF;
		ELSEIF (interfaz='RECONECTAR') THEN
			IF (tp='CT')THEN
				SELECT estado_conexion.`cta_cte_catastral`, DATE_FORMAT(estado_conexion.`fecha`,'%d-%m-%Y') AS fecha, estado_conexion.`id_medidor`, finca.`direccion`, barrio.nombre_barrio, finca.`ci_cliente`, CONCAT( cliente.nombre,' ',cliente.apellido) AS nomape, medidor.codigo FROM estado_conexion INNER JOIN finca ON estado_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN medidor ON estado_conexion.`id_medidor`=medidor.id_medidor WHERE estado_conexion.`estado`=1 AND estado_conexion.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			ELSEIF (tp='CI')THEN
				SELECT estado_conexion.`cta_cte_catastral`, DATE_FORMAT(estado_conexion.`fecha`,'%d-%m-%Y') AS fecha, estado_conexion.`id_medidor`, finca.`direccion`, barrio.nombre_barrio, finca.`ci_cliente`, CONCAT( cliente.nombre,' ',cliente.apellido) AS nomape, medidor.codigo FROM estado_conexion INNER JOIN finca ON estado_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN medidor ON estado_conexion.`id_medidor`=medidor.id_medidor WHERE estado_conexion.`estado`=1 AND cliente.ci_cliente LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			ELSEIF (tp='NO')THEN
				SELECT estado_conexion.`cta_cte_catastral`, DATE_FORMAT(estado_conexion.`fecha`,'%d-%m-%Y') AS fecha, estado_conexion.`id_medidor`, finca.`direccion`, barrio.nombre_barrio, finca.`ci_cliente`, CONCAT( cliente.nombre,' ',cliente.apellido) AS nomape, medidor.codigo FROM estado_conexion INNER JOIN finca ON estado_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN medidor ON estado_conexion.`id_medidor`=medidor.id_medidor WHERE estado_conexion.`estado`=1 AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_factura` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_factura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_factura`(dato VARCHAR(80))
BEGIN
		SELECT id_factura, primera_numeracion, segunda_numeracion, desde, hasta from factura where estado=1 and desde LIKE CONCAT(dato,'%');
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_facturacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_facturacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_facturacion`(tp VARCHAR(2),dato VARCHAR(80), interfaz VARCHAR(10))
BEGIN
		IF (interfaz='TODOS') THEN #SALDO 0 SOLO PARA REUTILIZAR // POR EL MOMENTO SE USA SOLO PARA NOTA CREDITO, ENTONCES MODIFICO PARA NO TOCAR COBRO Y DEJO CODIGO ORIGINAL COMENTADO
			IF (tp='CI')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NF') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;
			/*IF (tp='CI')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`!='ANULADO' and facturacion.`estado`!='VENCIDO' AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`!='ANULADO' AND facturacion.`estado`!='VENCIDO' AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`!='ANULADO' AND facturacion.`estado`!='VENCIDO' AND facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NF') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`!='ANULADO' AND facturacion.`estado`!='VENCIDO' AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`!='ANULADO' AND facturacion.`estado`!='VENCIDO' AND DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;*/
		elseIF (interfaz='CONSUMO') THEN #SALDO 0 SOLO PARA REUTILIZAR 
			IF (tp='CI')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',  lectura_medidor.`cta_cte_catastral`, barrio.nombre_barrio, format(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'CONSUMO'),0, 'de_DE') as total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio where facturacion.`estado`='ACTIVO' and facturacion.`tipo`=interfaz and facturacion.`ci_cliente` like CONCAT(dato,'%') ORDER BY facturacion.`orden` asc, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',  lectura_medidor.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'CONSUMO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='ACTIVO' AND facturacion.`tipo`=interfaz AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',  lectura_medidor.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'CONSUMO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='ACTIVO' AND facturacion.`tipo`=interfaz AND lectura_medidor.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			elseif (tp='NF') then
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',  lectura_medidor.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'CONSUMO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='ACTIVO' AND facturacion.`tipo`=interfaz AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',  lectura_medidor.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'CONSUMO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_lectura ON facturacion.`id_factura`=facturacion_lectura.`id_factura` AND facturacion.`numero_factura`=facturacion_lectura.`numero_factura` INNER JOIN lectura_medidor ON facturacion_lectura.`id_lectura`=lectura_medidor.id_lectura INNER JOIN finca ON lectura_medidor.cta_cte_catastral=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='ACTIVO' AND facturacion.`tipo`=interfaz AND date_format(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;
		ELSEIF (interfaz='SERVICIO') THEN #SALDO 0 SOLO PARA REUTILIZAR 
			IF (tp='CI')THEN
				select facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', solicitud_conexion.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'SERVICIO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente inner join facturacion_extension on facturacion.`id_factura`=facturacion_extension.`id_factura` and facturacion.`numero_factura`=facturacion_extension.`numero_factura` inner join extension on facturacion_extension.`id_extension`=extension.`id_extension` inner join solicitud_conexion on extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` inner join finca on solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`tipo`=interfaz AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', solicitud_conexion.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'SERVICIO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_extension ON facturacion.`id_factura`=facturacion_extension.`id_factura` AND facturacion.`numero_factura`=facturacion_extension.`numero_factura` INNER JOIN extension ON facturacion_extension.`id_extension`=extension.`id_extension` INNER JOIN solicitud_conexion ON extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`tipo`=interfaz AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', solicitud_conexion.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'SERVICIO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_extension ON facturacion.`id_factura`=facturacion_extension.`id_factura` AND facturacion.`numero_factura`=facturacion_extension.`numero_factura` INNER JOIN extension ON facturacion_extension.`id_extension`=extension.`id_extension` INNER JOIN solicitud_conexion ON extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`tipo`=interfaz AND solicitud_conexion.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NF') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', solicitud_conexion.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'SERVICIO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_extension ON facturacion.`id_factura`=facturacion_extension.`id_factura` AND facturacion.`numero_factura`=facturacion_extension.`numero_factura` INNER JOIN extension ON facturacion_extension.`id_extension`=extension.`id_extension` INNER JOIN solicitud_conexion ON extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`tipo`=interfaz AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', solicitud_conexion.`cta_cte_catastral`, barrio.nombre_barrio, FORMAT(calculo_total_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, 'SERVICIO'),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente INNER JOIN facturacion_extension ON facturacion.`id_factura`=facturacion_extension.`id_factura` AND facturacion.`numero_factura`=facturacion_extension.`numero_factura` INNER JOIN extension ON facturacion_extension.`id_extension`=extension.`id_extension` INNER JOIN solicitud_conexion ON extension.`id_solicitud_conexion`=solicitud_conexion.`id_solicitud_conexion` INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`tipo`=interfaz AND DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;
		ELSEIF (interfaz='FRACCION') THEN # PARA PAGAR FRACCION, TAMBIEN MOSTRAR SALDO Y TOTAL A PAGAR CON DESCUENTO DE NOTA CREDITO
			IF (tp='CI')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') as saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NF') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CD') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, FORMAT(calculo_saldo_factura(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='FRACCIONADO' AND LPAD(facturacion.`numero_factura`,7,'0') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;
		ELSEIF (interfaz='ACTIVO') THEN # SALDO 0 SOLO PARA REUTILIZAR  TOTAL A PAGAR CON DESCUENTO DE NOTA CREDITO
			IF (tp='CI')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' as saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NO')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CT')THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='NF') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND facturacion.`numero_factura` LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='FE') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			ELSEIF (tp='CD') THEN
				SELECT facturacion.`id_factura`, facturacion.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',CONVERT(LPAD(facturacion.`numero_factura`,7,'0') USING latin1)) AS num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha,  CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente',   facturacion_cta(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS cta_cte_catastral,  facturacion_barrio(facturacion.`numero_factura`, facturacion.`id_factura`, facturacion.tipo) AS nombre_barrio, FORMAT(calculo_total_a_pagar(facturacion.`id_factura`, facturacion.`numero_factura`),0, 'de_DE') AS total , facturacion.orden, '0' AS saldo FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`estado`='ACTIVO' AND lpad(facturacion.`numero_factura`,7,'0') LIKE CONCAT(dato,'%') ORDER BY facturacion.`orden` ASC, facturacion.`numero_factura` ASC;
			END IF;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_finca` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_finca` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_finca`(tp VARCHAR(2),dato VARCHAR(80))
BEGIN
		IF (tp='CT')THEN
			SELECT finca.cta_cte_catastral, finca.ci_cliente, concat(cliente.nombre,' ',cliente.apellido) AS nombre, finca.direccion, barrio.nombre_barrio from finca INNER join cliente on finca.`ci_cliente`=cliente.ci_cliente INNER join barrio on finca.`id_barrio`=barrio.id_barrio where finca.`cta_cte_catastral`  LIKE CONCAT(dato,'%') order by finca.`orden` ASC;
		ELSEIF (tp='CI')THEN
			SELECT finca.cta_cte_catastral, finca.ci_cliente, CONCAT(cliente.nombre,' ',cliente.apellido) AS nombre, finca.direccion, barrio.nombre_barrio FROM finca INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE finca.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
		ELSEIF (tp='NO')THEN
			SELECT finca.cta_cte_catastral, finca.ci_cliente, CONCAT(cliente.nombre,' ',cliente.apellido) AS nombre, finca.direccion, barrio.nombre_barrio FROM finca INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN barrio ON finca.`id_barrio`=barrio.id_barrio WHERE CONCAT (cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY finca.`orden` ASC;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_inicio_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_inicio_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_inicio_cierre`()
BEGIN
		SELECT DATE_FORMAT(ini.`fecha`,'%d-%m-%Y %H:%i:%s') AS fecha, ini.`ci_personal`, CONCAT(p.nombre,' ',p.apellido) AS nomape, FORMAT(ini.`monto`,0,'de_DE') AS monto FROM inicio_cierre AS ini INNER JOIN personal AS p ON ini.`ci_personal`=p.ci_personal WHERE ini.`estado`=1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_inventario` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_inventario` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_inventario`(tp varchar(1), dato VARCHAR(80))
BEGIN
		if (tp='C') then
			SELECT cod_barra, descripcion, FORMAT(calculo_stock(cod_barra), 2, 'de_DE') as cantidad FROM producto WHERE producto.`cod_barra` LIKE CONCAT(dato,'%');
		elseIF (tp='D') THEN
			SELECT cod_barra, descripcion, FORMAT(calculo_stock(cod_barra), 2, 'de_DE') AS cantidad FROM producto WHERE producto.`descripcion` LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_lectura` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_lectura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_lectura`(tp VARCHAR(2),dato VARCHAR(80), interfaz varchar(1))
BEGIN
		if (interfaz='L') then #LECTURA
			IF (tp='CI')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(lectura_anterior(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'l_anterior', FORMAT(lectura_medidor.`lectura`,0, 'de_DE') AS 'l_actual', format(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'consumo_lts' FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND finca.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			ELSEIF (tp='NO')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(lectura_anterior(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'l_anterior', FORMAT(lectura_medidor.`lectura`,0, 'de_DE') AS 'l_actual', format(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') as 'consumo_lts' FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND concat(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			ELSEIF (tp='CT')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(lectura_anterior(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'l_anterior', FORMAT(lectura_medidor.`lectura`,0, 'de_DE') AS 'l_actual', format(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'consumo_lts' FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND finca.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			END IF;
		elseif (interfaz='F') then #FACTURAR
			IF (tp='CI')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'consumo_lts', FORMAT(`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`),0, 'de_DE') AS `consumo_gs`,FORMAT(`calculo_consumo_facturar`(`lectura_medidor`.`id_lectura`,'T'),0, 'de_DE') AS `total` FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND finca.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			ELSEIF (tp='NO')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'consumo_lts', FORMAT(`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`),0, 'de_DE') AS `consumo_gs`,FORMAT(`calculo_consumo_facturar`(`lectura_medidor`.`id_lectura`,'T'),0, 'de_DE') AS `total` FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			ELSEIF (tp='CT')THEN
				SELECT lectura_medidor.`id_lectura`, lectura_medidor.`cta_cte_catastral`, finca.`direccion`, barrio.nombre_barrio, CONCAT(`cliente`.`ci_cliente`, ' - ', `cliente`.`nombre`,' ',`cliente`.`apellido`) AS 'cliente', lectura_medidor.`id_medidor`, FORMAT(calculo_consumo(lectura_medidor.`id_lectura`),0, 'de_DE') AS 'consumo_lts', FORMAT(`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`),0, 'de_DE') AS `consumo_gs`,FORMAT(`calculo_consumo_facturar`(`lectura_medidor`.`id_lectura`,'T'),0, 'de_DE') AS `total` FROM lectura_medidor INNER JOIN conexion ON lectura_medidor.`cta_cte_catastral`=conexion.`cta_cte_catastral` AND lectura_medidor.`id_medidor`=conexion.`id_medidor` INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente WHERE lectura_medidor.`estado`='ACTIVO' AND finca.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY lectura_medidor.id_lectura DESC;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_medidor` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_medidor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_medidor`(dato varchar(80))
BEGIN
		SELECT medidor.`id_medidor`, medidor.`codigo`, modelo_medidor.`nombre_modelo` FROM medidor INNER join modelo_medidor on medidor.`id_modelo_medidor`=modelo_medidor.`id_modelo_medidor` WHERE medidor.`codigo` LIKE CONCAT(dato,'%');
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_modelo` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_modelo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_modelo`( dato varchar(80))
BEGIN
		SELECT id_modelo_medidor, nombre_modelo FROM modelo_medidor WHERE modelo_medidor.nombre_modelo LIKE CONCAT(dato,'%');
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_nota_credito` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_nota_credito` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_nota_credito`(tp VARCHAR(2),dato VARCHAR(80))
BEGIN
		IF (tp='NT')THEN
			SELECT nota_credito.nro_nota_credito, nota_credito.id_factura, nota_credito.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(nota_credito.numero_factura,7,'0')) AS num_completo, DATE_FORMAT(nota_credito.fecha,'%d-%m-%Y') AS fecha, facturacion.`ci_cliente`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, FORMAT(nota_credito.`monto`,0,'de_DE') AS monto FROM nota_credito INNER JOIN facturacion ON nota_credito.`id_factura`=facturacion.`id_factura` AND nota_credito.`numero_factura`=facturacion.`numero_factura` INNER JOIN factura ON nota_credito.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE nota_credito.`estado`=1 and nota_credito.`nro_nota_credito` LIKE  CONCAT(dato,'%');
		elseIF (tp='BO')THEN
			SELECT nota_credito.nro_nota_credito, nota_credito.id_factura, nota_credito.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(nota_credito.numero_factura,7,'0')) AS num_completo, DATE_FORMAT(nota_credito.fecha,'%d-%m-%Y') AS fecha, facturacion.`ci_cliente`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, FORMAT(nota_credito.`monto`,0,'de_DE') AS monto FROM nota_credito INNER JOIN facturacion ON nota_credito.`id_factura`=facturacion.`id_factura` AND nota_credito.`numero_factura`=facturacion.`numero_factura` INNER JOIN factura ON nota_credito.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE nota_credito.`estado`=1 and nota_credito.`numero_factura` like  CONCAT(dato,'%');
		ELSEIF (tp='FE')THEN
			SELECT nota_credito.nro_nota_credito, nota_credito.id_factura, nota_credito.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(nota_credito.numero_factura,7,'0')) AS num_completo, DATE_FORMAT(nota_credito.fecha,'%d-%m-%Y') AS fecha, facturacion.`ci_cliente`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, FORMAT(nota_credito.`monto`,0,'de_DE') AS monto FROM nota_credito INNER JOIN facturacion ON nota_credito.`id_factura`=facturacion.`id_factura` AND nota_credito.`numero_factura`=facturacion.`numero_factura` INNER JOIN factura ON nota_credito.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE nota_credito.`estado`=1 AND DATE_FORMAT(nota_credito.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		ELSEIF (tp='RC')THEN
			SELECT nota_credito.nro_nota_credito, nota_credito.id_factura, nota_credito.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(nota_credito.numero_factura,7,'0')) AS num_completo, DATE_FORMAT(nota_credito.fecha,'%d-%m-%Y') AS fecha, facturacion.`ci_cliente`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, FORMAT(nota_credito.`monto`,0,'de_DE') AS monto FROM nota_credito INNER JOIN facturacion ON nota_credito.`id_factura`=facturacion.`id_factura` AND nota_credito.`numero_factura`=facturacion.`numero_factura` INNER JOIN factura ON nota_credito.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE nota_credito.`estado`=1 AND facturacion.`ci_cliente` LIKE CONCAT(dato,'%');
		ELSEIF (tp='RZ')THEN
			SELECT nota_credito.nro_nota_credito, nota_credito.id_factura, nota_credito.`numero_factura`, CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(nota_credito.numero_factura,7,'0')) AS num_completo, DATE_FORMAT(nota_credito.fecha,'%d-%m-%Y') AS fecha, facturacion.`ci_cliente`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, FORMAT(nota_credito.`monto`,0,'de_DE') AS monto FROM nota_credito INNER JOIN facturacion ON nota_credito.`id_factura`=facturacion.`id_factura` AND nota_credito.`numero_factura`=facturacion.`numero_factura` INNER JOIN factura ON nota_credito.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE nota_credito.`estado`=1 AND concat(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%');
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_nota_debito` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_nota_debito` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_nota_debito`(tp VARCHAR(2),dato VARCHAR(80))
BEGIN
		IF (tp='NT')THEN
			SELECT nota_debito.`id_pedido`, nota_debito.`nro_boleta`, nota_debito.`nro_nota_debito`, DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.`razon`, FORMAT(nota_debito.`monto`,0, 'de_DE') AS monto FROM nota_debito INNER JOIN pedido ON nota_debito.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE nota_debito.`estado`=1 AND nota_debito.`nro_nota_debito` LIKE  CONCAT(dato,'%');
		elseIF (tp='BO')THEN
			SELECT nota_debito.`id_pedido`, nota_debito.`nro_boleta`, nota_debito.`nro_nota_debito`, DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.`razon`, FORMAT(nota_debito.`monto`,0, 'de_DE') AS monto FROM nota_debito INNER JOIN pedido ON nota_debito.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` where nota_debito.`estado`=1 and nota_debito.`nro_boleta` like  CONCAT(dato,'%');
		ELSEIF (tp='FE')THEN
			SELECT nota_debito.`id_pedido`, nota_debito.`nro_boleta`, nota_debito.`nro_nota_debito`, DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.`razon`, FORMAT(nota_debito.`monto`,0, 'de_DE') AS monto FROM nota_debito INNER JOIN pedido ON nota_debito.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE nota_debito.`estado`=1 AND DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		ELSEIF (tp='RC')THEN
			SELECT nota_debito.`id_pedido`, nota_debito.`nro_boleta`, nota_debito.`nro_nota_debito`, DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.`razon`, FORMAT(nota_debito.`monto`,0, 'de_DE') AS monto FROM nota_debito INNER JOIN pedido ON nota_debito.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE nota_debito.`estado`=1 AND pedido.`ruc` LIKE CONCAT(dato,'%');
		ELSEIF (tp='RZ')THEN
			SELECT nota_debito.`id_pedido`, nota_debito.`nro_boleta`, nota_debito.`nro_nota_debito`, DATE_FORMAT(nota_debito.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.`razon`, FORMAT(nota_debito.`monto`,0, 'de_DE') AS monto FROM nota_debito INNER JOIN pedido ON nota_debito.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE nota_debito.`estado`=1 AND proveedor.razon LIKE CONCAT(dato,'%');
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_orden_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_orden_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_orden_compra`(tp varchar(1), dato VARCHAR(80), interfaz varchar(10))
BEGIN
		if (tp='F') then
			SELECT `orden_compra`.`id_orden_compra`, DATE_FORMAT(`orden_compra`.`fecha`,'%d-%m-%Y') AS fecha, `orden_compra`.`ci_personal`, CONCAT(personal.`nombre`,' ',`personal`.`apellido`) AS nomape FROM orden_compra INNER JOIN personal ON orden_compra.ci_personal=personal.ci_personal WHERE `orden_compra`.`estado`=interfaz AND DATE_FORMAT(`orden_compra`.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		elseIF (tp='C') THEN
			SELECT `orden_compra`.`id_orden_compra`, DATE_FORMAT(`orden_compra`.`fecha`,'%d-%m-%Y') AS fecha, `orden_compra`.`ci_personal`, CONCAT(personal.`nombre`,' ',`personal`.`apellido`) AS nomape FROM orden_compra INNER JOIN personal ON orden_compra.ci_personal=personal.ci_personal WHERE `orden_compra`.`estado`=interfaz AND personal.ci_personal LIKE CONCAT(dato,'%');
		ELSEIF (tp='N') THEN
			SELECT `orden_compra`.`id_orden_compra`, DATE_FORMAT(`orden_compra`.`fecha`,'%d-%m-%Y') AS fecha, `orden_compra`.`ci_personal`, CONCAT(personal.`nombre`,' ',`personal`.`apellido`) AS nomape FROM orden_compra INNER JOIN personal ON orden_compra.ci_personal=personal.ci_personal WHERE `orden_compra`.`estado`=interfaz AND CONCAT(personal.`nombre`,' ',`personal`.`apellido`) LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_pago` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_pago` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_pago`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='C')THEN
			SELECT pago.`id_pago`, DATE_FORMAT(pago.`fecha`,'%d-%m-%Y') AS fecha, FORMAT(pago.`monto`,0,'de_DE') AS monto, ver_ruc_pago(pago.`id_pago`) AS ruc, ver_nombre_pago(pago.`id_pago`) AS razon FROM pago WHERE ver_ruc_pago(pago.`id_pago`) LIKE CONCAT(dato,'%');
		ELSEIF (tp='N')then
			SELECT pago.`id_pago`, DATE_FORMAT(pago.`fecha`,'%d-%m-%Y') AS fecha, FORMAT(pago.`monto`,0,'de_DE') AS monto, ver_ruc_pago(pago.`id_pago`) AS ruc, ver_nombre_pago(pago.`id_pago`) AS razon FROM pago WHERE ver_nombre_pago(pago.`id_pago`) LIKE CONCAT(dato,'%');
		ELSEIF (tp='F')THEN
			SELECT pago.`id_pago`, DATE_FORMAT(pago.`fecha`,'%d-%m-%Y') AS fecha, FORMAT(pago.`monto`,0,'de_DE') AS monto, ver_ruc_pago(pago.`id_pago`) AS ruc, ver_nombre_pago(pago.`id_pago`) AS razon FROM pago WHERE DATE_FORMAT(pago.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_pedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_pedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_pedido`(tp VARCHAR(1),dato VARCHAR(80), interfaz varchar(10))
BEGIN
		IF (tp='F')THEN
			select pedido.`id_pedido`, date_format(pedido.`fecha`,'%d-%m-%Y') as fecha, pedido.`ruc`, proveedor.razon FROM pedido inner join proveedor on pedido.`ruc`=proveedor.ruc where pedido.`estado`=interfaz AND DATE_FORMAT(pedido.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		ELSEIF (tp='C')THEN
			SELECT pedido.`id_pedido`, DATE_FORMAT(pedido.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon FROM pedido INNER JOIN proveedor ON pedido.`ruc`=proveedor.ruc WHERE pedido.`estado`=interfaz AND pedido.`ruc` LIKE CONCAT(dato,'%');
		ELSEIF (tp='N')THEN
			SELECT pedido.`id_pedido`, DATE_FORMAT(pedido.`fecha`,'%d-%m-%Y') AS fecha, pedido.`ruc`, proveedor.razon FROM pedido INNER JOIN proveedor ON pedido.`ruc`=proveedor.ruc WHERE pedido.`estado`=interfaz AND proveedor.razon LIKE CONCAT(dato,'%');
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_personal` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_personal` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_personal`( tp VARCHAR(1),dato varchar(80))
BEGIN
		if (tp='C')THEN
			select ci_personal, nombre, apellido, direccion from personal where personal.ci_personal like CONCAT(dato,'%');
		ELSEIF (tp='N')then
			SELECT ci_personal, nombre, apellido,direccion FROM personal WHERE CONCAT (personal.nombre,' ',personal.apellido) LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_precio_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_precio_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_precio_conexion`(tp varchar(1), dato VARCHAR(80))
BEGIN
		if (tp='C') then
			SELECT id_precio_conexion as id_precio, 'DERECHO DE CONEXIÃ“N' as descripcion, format(monto,0, 'de_DE') as monto FROM precio_conexion where estado=1;
		elseif (tp='E') then
			select '0' as id_precio, tipo as descripcion, FORMAT(monto,0, 'de_DE') AS monto from precio_extension where estado=1;	
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_producto` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_producto` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_producto`(tp varchar(1), dato VARCHAR(80))
BEGIN
		if (tp='C') then
			SELECT cod_barra, descripcion FROM producto WHERE producto.`cod_barra` LIKE CONCAT(dato,'%');
		elseIF (tp='D') THEN
			SELECT cod_barra, descripcion FROM producto WHERE producto.`descripcion` LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_proveedor` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_proveedor` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_proveedor`(tp varchar(2), dato VARCHAR(80))
BEGIN
		if (tp='RC') then
			SELECT ruc, razon, direccion FROM proveedor WHERE proveedor.`ruc` LIKE CONCAT(dato,'%');
		elseIF (tp='RZ') THEN
			SELECT ruc, razon, direccion FROM proveedor WHERE proveedor.`razon` LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_solicitud_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_solicitud_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_solicitud_conexion`(tp VARCHAR(2),dato VARCHAR(80), est varchar(20))
BEGIN
		IF (tp='CT')THEN
			select solicitud_conexion.`id_solicitud_conexion`, solicitud_conexion.`cta_cte_catastral`, solicitud_conexion.`ci_cliente`, date_format(solicitud_conexion.`fecha`,'%d-%m-%Y') AS `fecha`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, finca.direccion, format(calculo_total_solicitud(solicitud_conexion.`id_solicitud_conexion`),0, 'de_DE') AS total from solicitud_conexion inner join finca on solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` inner join cliente on solicitud_conexion.`ci_cliente`=cliente.ci_cliente where solicitud_conexion.`estado`=est and solicitud_conexion.`cta_cte_catastral` LIKE CONCAT(dato,'%') ORDER BY solicitud_conexion.`fecha` DESC;
		ELSEIF (tp='CI')THEN
			SELECT solicitud_conexion.`id_solicitud_conexion`, solicitud_conexion.`cta_cte_catastral`, solicitud_conexion.`ci_cliente`, DATE_FORMAT(solicitud_conexion.`fecha`,'%d-%m-%Y') AS `fecha`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, finca.direccion, FORMAT(calculo_total_solicitud(solicitud_conexion.`id_solicitud_conexion`),0, 'de_DE') AS total FROM solicitud_conexion INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN cliente ON solicitud_conexion.`ci_cliente`=cliente.ci_cliente WHERE solicitud_conexion.`estado`=est AND solicitud_conexion.`ci_cliente` LIKE CONCAT(dato,'%') ORDER BY solicitud_conexion.`fecha` DESC;
		ELSEIF (tp='NO')THEN
			SELECT solicitud_conexion.`id_solicitud_conexion`, solicitud_conexion.`cta_cte_catastral`, solicitud_conexion.`ci_cliente`, DATE_FORMAT(solicitud_conexion.`fecha`,'%d-%m-%Y') AS `fecha`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, finca.direccion, FORMAT(calculo_total_solicitud(solicitud_conexion.`id_solicitud_conexion`),0, 'de_DE') AS total FROM solicitud_conexion INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN cliente ON solicitud_conexion.`ci_cliente`=cliente.ci_cliente WHERE solicitud_conexion.`estado`=est AND CONCAT(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') ORDER BY solicitud_conexion.`fecha` DESC;
		ELSEIF (tp='FC')THEN
			SELECT solicitud_conexion.`id_solicitud_conexion`, solicitud_conexion.`cta_cte_catastral`, solicitud_conexion.`ci_cliente`, DATE_FORMAT(solicitud_conexion.`fecha`,'%d-%m-%Y') AS `fecha`, CONCAT(cliente.nombre,' ',cliente.apellido) AS nomape, finca.direccion, FORMAT(calculo_total_solicitud(solicitud_conexion.`id_solicitud_conexion`),0, 'de_DE') AS total FROM solicitud_conexion INNER JOIN finca ON solicitud_conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN cliente ON solicitud_conexion.`ci_cliente`=cliente.ci_cliente WHERE solicitud_conexion.`estado`=est AND DATE_FORMAT(solicitud_conexion.`fecha`,'%d-%m-%Y') LIKE CONCAT(dato,'%') ORDER BY solicitud_conexion.`fecha` DESC;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `buscar_trabajo` */

/*!50003 DROP PROCEDURE IF EXISTS  `buscar_trabajo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_trabajo`( tp VARCHAR(1),dato VARCHAR(80))
BEGIN
		if (tp='F') then
			select id_trabajo, date_format(fecha,'%d-%m-%Y') as fecha, descripcion from trabajo where estado=1 and DATE_FORMAT(fecha,'%d-%m-%Y') LIKE CONCAT(dato,'%');
		elseIF (tp='D') THEN
			SELECT id_trabajo, DATE_FORMAT(fecha,'%d-%m-%Y') AS fecha, descripcion FROM trabajo WHERE estado=1 AND descripcion LIKE CONCAT(dato,'%');
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cargar_combo_mes_facturacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `cargar_combo_mes_facturacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_combo_mes_facturacion`()
BEGIN
		select distinct  DATE_FORMAT(`facturacion`.`fecha`,'%m-%Y') as fecha, CONCAT(`mes_espanhol`(DATE_FORMAT(`facturacion`.`fecha`,'%m')),' ',CONVERT(DATE_FORMAT(`facturacion`.`fecha`,'%Y') USING latin1)) AS `fecha_letra` FROM facturacion  ORDER BY facturacion.`fecha` DESC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cargar_combo_mes_lectura` */

/*!50003 DROP PROCEDURE IF EXISTS  `cargar_combo_mes_lectura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_combo_mes_lectura`()
BEGIN
		select distinct DATE_FORMAT(`lectura_medidor`.`fecha`,'%m-%Y') as fecha, CONCAT(`mes_espanhol`(DATE_FORMAT(`lectura_medidor`.`fecha`,'%m')),' ',CONVERT(DATE_FORMAT(`lectura_medidor`.`fecha`,'%Y') USING latin1)) AS `fecha_letra` FROM `lectura_medidor` WHERE lectura_medidor.`estado`!='ANULADO' ORDER BY `lectura_medidor`.`fecha` DESC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cargar_datos_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `cargar_datos_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_datos_cierre`()
BEGIN
		declare ini int;
		declare cobro int;
		DECLARE total INT;
		set ini=0; set cobro=0;
		if exists (select id_inicio_cierre from inicio_cierre where estado=1) then
			set ini=(SELECT monto FROM inicio_cierre WHERE estado=1 limit 1);
			set cobro=ver_monto_a_cerrar();
		end if;
		set total=ini+cobro;
		select format(ini,0,'de_DE') as ini,FORMAT(cobro,0,'de_DE') AS cobro, FORMAT(total,0,'de_DE') AS total;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cargar_tabla_cobro_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `cargar_tabla_cobro_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_tabla_cobro_cierre`()
BEGIN
		SELECT DATE_FORMAT(co.fecha,'%d-%m-%Y') AS fecha, CONCAT(`fa`.`primera_numeracion`,'-',`fa`.`segunda_numeracion`,'-',CONVERT(LPAD(`cab`.`numero_factura`,7,'0') USING latin1)) AS `num_completo`, cab.`ci_cliente`, CONCAT(cl.nombre,' ',cl.apellido) AS nomape, FORMAT(co.monto,0,'de_DE') AS monto FROM cobro AS co INNER JOIN facturacion AS cab ON co.`id_factura`=cab.`id_factura` AND co.`numero_factura`=cab.`numero_factura` INNER JOIN factura AS fa ON co.`id_factura`=fa.id_factura INNER JOIN cliente AS cl ON cab.`ci_cliente`=cl.ci_cliente WHERE co.id_cobro not in (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=co.`id_cobro`) ORDER BY co.id_cobro ASC;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `cargar_tabla_lectura` */

/*!50003 DROP PROCEDURE IF EXISTS  `cargar_tabla_lectura` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `cargar_tabla_lectura`(tp VARCHAR(2),dato VARCHAR(80))
BEGIN
		IF (tp='CI')THEN
			SELECT concat(cliente.ci_cliente, ' - ', cliente.nombre,' ',cliente.apellido) as 'cliente', finca.`cta_cte_catastral`, finca.`direccion`, medidor.`id_medidor`, barrio.`nombre_barrio`, FORMAT(ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`),0, 'de_DE') as 'l_anterior' from conexion INNER join finca on conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER join medidor on conexion.`id_medidor`=medidor.`id_medidor` INNER join cliente on finca.`ci_cliente`=cliente.ci_cliente INNER join barrio on finca.`id_barrio`=barrio.`id_barrio` WHERE conexion.`estado`=1 and finca.`ci_cliente` LIKE CONCAT(dato,'%') and estado_ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`)!='ACTIVO' order by finca.`orden` asc;
		ELSEIF (tp='NO')THEN
			SELECT CONCAT(cliente.ci_cliente, ' - ', cliente.nombre,' ',cliente.apellido) AS 'cliente', finca.`cta_cte_catastral`, finca.`direccion`, medidor.`id_medidor`, barrio.`nombre_barrio`, FORMAT(ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`),0, 'de_DE') AS 'l_anterior' FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.`id_medidor` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` WHERE conexion.`estado`=1 AND concat(cliente.nombre,' ',cliente.apellido) LIKE CONCAT(dato,'%') AND estado_ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`)!='ACTIVO' ORDER BY finca.`orden` ASC;
		ELSEIF (tp='CT')THEN
			SELECT CONCAT(cliente.ci_cliente, ' - ', cliente.nombre,' ',cliente.apellido) AS 'cliente', finca.`cta_cte_catastral`, finca.`direccion`, medidor.`id_medidor`, barrio.`nombre_barrio`, FORMAT(ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`),0, 'de_DE') AS 'l_anterior' FROM conexion INNER JOIN finca ON conexion.`cta_cte_catastral`=finca.`cta_cte_catastral` INNER JOIN medidor ON conexion.`id_medidor`=medidor.`id_medidor` INNER JOIN cliente ON finca.`ci_cliente`=cliente.ci_cliente INNER JOIN barrio ON finca.`id_barrio`=barrio.`id_barrio` WHERE conexion.`estado`=1 AND finca.`cta_cte_catastral` LIKE CONCAT(dato,'%') AND estado_ultima_lectura(conexion.`cta_cte_catastral`,conexion.`id_medidor`)!='ACTIVO' ORDER BY finca.`orden` ASC;
		END IF;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `enumerar` */

/*!50003 DROP PROCEDURE IF EXISTS  `enumerar` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `enumerar`()
BEGIN
		DECLARE done INT DEFAULT FALSE;	
		DECLARE nro INTEGER DEFAULT 0;		
		DECLARE cod1 varchar(15);
		DECLARE cur1 CURSOR FOR SELECT cta_cte_catastral FROM finca order by orden;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;	
		OPEN cur1;
			
		read_loop: LOOP
			FETCH cur1 INTO cod1;
			IF done THEN 
				LEAVE read_loop;
			END IF;
				SET nro=nro+1;				
				UPDATE finca SET orden=nro WHERE cta_cte_catastral=cod1;
			END LOOP;
		CLOSE cur1;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `finca_telefono_correo` */

/*!50003 DROP PROCEDURE IF EXISTS  `finca_telefono_correo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `finca_telefono_correo`(proceso varchar(2), tel_cor varchar(100), cta varchar(15), out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='TA') THEN
			if not exists (select finca_telefono.`telefono` from finca_telefono where finca_telefono.`telefono`=tel_cor and finca_telefono.`cta_cte_catastral`=cta) then
				set valor='EX';
				if exists (select finca.`cta_cte_catastral` from finca where finca.`cta_cte_catastral`=cta) then
					insert into finca_telefono( cta_cte_catastral, telefono) values (cta, tel_cor);
					set valor='SI';
				end if;
			end if;
		elseIF (proceso='TB') THEN
			IF EXISTS (SELECT finca_telefono.`telefono` FROM finca_telefono WHERE finca_telefono.`telefono`=tel_cor) THEN
				SET valor='EX';
				IF EXISTS (SELECT finca.`cta_cte_catastral` FROM finca WHERE finca.`cta_cte_catastral`=cta) THEN
					DELETE FROM finca_telefono where finca_telefono.`cta_cte_catastral`=cta and finca_telefono.`telefono`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CA') THEN
			IF NOT EXISTS (SELECT finca_correo.`correo` FROM finca_correo WHERE finca_correo.`correo`=tel_cor AND finca_correo.`cta_cte_catastral`=cta) THEN
				SET valor='EX';
				IF EXISTS (SELECT finca.`cta_cte_catastral` FROM finca WHERE finca.`cta_cte_catastral`=cta) THEN
					insert into finca_correo( cta_cte_catastral, correo) values (cta, tel_cor);
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CB') THEN
			IF EXISTS (SELECT finca_correo.`correo` FROM finca_correo WHERE finca_correo.`correo`=tel_cor) THEN
				SET valor='EX';
				IF EXISTS (SELECT finca.`cta_cte_catastral` FROM finca WHERE finca.`cta_cte_catastral`=cta) THEN
					DELETE FROM finca_correo where finca_correo.`cta_cte_catastral`=cta and finca_correo.`correo`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertar_inicio_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertar_inicio_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_inicio_cierre`(id_a int, mt int, out valor varchar(2))
BEGIN
		DECLARE ci INT;
		DECLARE contador INT;
		SET valor='NO';
		SET ci=(SELECT ci_personal FROM acceso WHERE id_acceso=id_a LIMIT 1);
		if not exists (select id_inicio_cierre from inicio_cierre where estado=1) then
			insert into inicio_cierre( id_inicio_cierre, fecha, monto, ci_personal, estado) values (contador_inicio(), now(), mt, ci, 1);
			set valor='SI';
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `insertar_orden_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `insertar_orden_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_orden_compra`(cod varchar(20), cabecera int, cant double)
BEGIN
		if exists( select cod_barra from producto where cod_barra=cod) then
			if exists ( select id_orden_compra from orden_compra where id_orden_compra=cabecera) then
				insert into orden_compra_detalle( id_orden_compra, cod_barra, cantidad) values (cabecera, cod, cant);
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `iva_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `iva_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `iva_compra`(des date, has date)
BEGIN
		
		SELECT compra.`nro_boleta`, DATE_FORMAT(compra.`fecha`,'%d-%m-%Y') AS fecha, compra.`fecha` AS fecha_sin, pedido.`ruc`, proveedor.`razon`, FORMAT(calculo_iva_compra(compra.`id_pedido`,5),0,'de_DE') as iva_cinco, FORMAT(calculo_iva_compra(compra.`id_pedido`,10),0,'de_DE') AS iva_diez FROM `compra` INNER JOIN pedido ON compra.`id_pedido`=pedido.`id_pedido` INNER JOIN proveedor ON pedido.`ruc`=proveedor.`ruc` WHERE compra.`estado`!='ANULADO' AND compra.`fecha` between des and has union
		SELECT nc.`nro_nota_credito` AS nro_boleta, DATE_FORMAT(nc.`fecha`,'%d-%m-%Y') AS fecha, nc.`fecha` AS fecha_sin, fc.`ci_cliente` AS ruc, CONCAT(cl.nombre,' ',cl.apellido) AS razon, '0' AS iva_cinco, FORMAT(nc.`monto`/11,0,'de_DE') AS iva_diez FROM nota_credito AS nc INNER JOIN facturacion AS fc ON nc.`id_factura`=fc.`id_factura` AND nc.`numero_factura`=fc.`numero_factura` INNER JOIN cliente AS cl ON fc.`ci_cliente`=cl.ci_cliente WHERE nc.estado=1 AND nc.fecha BETWEEN des AND has ORDER BY fecha_sin;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `iva_venta` */

/*!50003 DROP PROCEDURE IF EXISTS  `iva_venta` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `iva_venta`(des date, has date)
BEGIN
		select CONCAT(factura.primera_numeracion,'-',factura.segunda_numeracion,'-',LPAD(facturacion.`numero_factura`,7,'0')) as num_completo, DATE_FORMAT(facturacion.`fecha`,'%d-%m-%Y') AS fecha, facturacion.`fecha` as fecha_sin, `cliente`.`ci_cliente` as ruc, CONCAT(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS razon, format(ver_iva_facturacion(facturacion.`id_factura`, facturacion.`numero_factura`, facturacion.`tipo`),0,'de_DE') as iva_diez FROM facturacion INNER JOIN factura ON facturacion.`id_factura`=factura.id_factura INNER JOIN cliente ON facturacion.`ci_cliente`=cliente.ci_cliente WHERE facturacion.`fecha` BETWEEN des AND has UNION
		select nota_debito.`nro_nota_debito` as num_completo, date_format(nota_debito.`fecha`,'%d-%m-%Y') as fecha, nota_debito.`fecha` as fecha_sin, proveedor.`ruc`, proveedor.`razon`, format(nota_debito.`monto`/11,0,'de_DE') as iva_diez from nota_debito inner join pedido on nota_debito.`id_pedido`=pedido.`id_pedido` inner join proveedor on pedido.`ruc`=proveedor.`ruc` where nota_debito.`estado`=1 and nota_debito.`fecha` BETWEEN des AND has ORDER BY fecha_sin, num_completo;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `modificar_precio_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `modificar_precio_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `modificar_precio_conexion`(proceso varchar(1), mt int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='D') then #DERECHO CONEXION
			update precio_conexion set estado=0;
			IF EXISTS (SELECT id_precio_conexion from precio_conexion where monto=mt) then
				update precio_conexion set estado=1 WHERE monto=mt;
			else
				insert into precio_conexion (id_precio_conexion, monto, estado) values (contador_precio_conexion(), mt, 1);
			end if;
			set valor='SI';
		elseIF (proceso='A') THEN #EXTENSION POR ASFALTO
			update precio_extension set estado=0 WHERE tipo='ASFALTO';
			if exists (select monto from precio_extension where monto=mt and tipo='ASFALTO') then
				update precio_extension set estado=1 WHERE monto=mt AND tipo='ASFALTO';
			else
				insert into precio_extension (monto, tipo, estado) values (mt, 'ASFALTO', 1);
			end if;
			set valor='SI';
		elseIF (proceso='T') THEN #EXTENSION POR TIERRA
			UPDATE precio_extension SET estado=0 WHERE tipo='TIERRA';
			IF EXISTS (SELECT monto FROM precio_extension WHERE monto=mt AND tipo='TIERRA') THEN
				UPDATE precio_extension SET estado=1 WHERE monto=mt AND tipo='TIERRA';
			ELSE
				INSERT INTO precio_extension (monto, tipo, estado) VALUES (mt, 'TIERRA', 1);
			END IF;
			SET valor='SI';
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_cierre` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_cierre` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_cierre`(id_a int, efe int, cheq int, nro_dep int, obs varchar(200), out valor varchar(2))
BEGIN
	DECLARE ci INT;
	declare id_ini int;
	DECLARE id_cob INT;
	declare i int;
	declare contador int;
	set valor='NO';#NO EXISTE INICIO
	if exists (select id_inicio_cierre from inicio_cierre where estado=1) then
		set valor='MV';#NO EXISTE MOVIMIENTO
		if exists (SELECT c.`id_cobro` FROM cobro AS c WHERE c.`id_cobro` NOT IN (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=c.`id_cobro`)) then
			SET ci=(SELECT ci_personal FROM acceso WHERE id_acceso=id_a LIMIT 1);
			set contador=contador_cierre();
			set id_ini=(SELECT id_inicio_cierre FROM inicio_cierre WHERE estado=1 limit 1);
			insert into deposito (nro_deposito, fecha, monto, estado, nro_cuenta_banco, id_banco) values (nro_dep, now(), ver_monto_a_cerrar(), 1, '2238-001/51', 1);
			insert into cierre (id_cierre, ci_personal, fecha, nro_deposito, nro_cuenta_banco, id_banco, id_inicio_cierre,efectivo_caja, cheque_caja) values (contador, ci, now(), nro_dep, '2238-001/51', 1, id_ini, efe, cheq);
			update inicio_cierre set estado=0 where id_inicio_cierre=id_ini;
			if (obs!='') then
				insert into observacion_cierre( observacion, id_cierre) values (obs, contador);
			end if;
			set i=1;
			WHILE i>0 DO
				IF EXISTS (SELECT c.`id_cobro` FROM cobro AS c WHERE c.`id_cobro` NOT IN (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=c.`id_cobro`)) THEN
					SET id_cob=(SELECT c.`id_cobro` FROM cobro AS c WHERE c.`id_cobro` NOT IN (SELECT cc.`id_cobro` FROM cierre_cobro AS cc WHERE cc.`id_cobro`=c.`id_cobro`) LIMIT 1);
					INSERT INTO cierre_cobro(id_cierre,id_cobro) VALUES (contador,id_cob);
				else
					set i=0;
				end if;
			END WHILE;
			set valor='SI';
		end if;
	end if;
END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_cobro` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_cobro` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_cobro`(proceso varchar(2), mt int, tp varchar(10), nro int, id_f int, cheq int, bc varchar(40),id_a int, out valor int)
BEGIN
		DECLARE ci INT;
		declare contador int;
		set valor=0;
		SET ci=(SELECT ci_personal FROM acceso WHERE id_acceso=id_a LIMIT 1);
		if (proceso='FA') then #FACTURA
			set contador=contador_cobro();
			insert into cobro ( id_cobro, fecha, monto, tipo_cobro, numero_factura, id_factura, ci_personal, id_caja) values (contador, now(), mt, tp, nro, id_f, ci, 1);
			if (tp='CHEQUE') then
				insert into cobro_cheque (id_cobro, monto, banco, nro_cheque) values (contador, mt, bc, cheq);
			end if;
			update facturacion set estado='COBRADO' where id_factura=id_f and numero_factura=nro;
			set valor=1;
		elseIF (proceso='FR') THEN #FRACCION
			SET contador=contador_cobro();
			INSERT INTO cobro ( id_cobro, fecha, monto, tipo_cobro, numero_factura, id_factura, ci_personal, id_caja) VALUES (contador, NOW(), mt, tp, nro, id_f, ci, 1);
			set valor=contador_recibo();
			if (calculo_saldo_factura(id_f, nro)>0) then
				insert into recibo_cobro (nro_recibo, descripcion, id_cobro) values (valor,'PAGO DE FRACCIONAMIENTO', contador); 
			else
				INSERT INTO recibo_cobro (nro_recibo, descripcion, id_cobro) VALUES (valor,'CANCELACION DE FRACCIONAMIENTO', contador); 
				UPDATE facturacion SET estado='COBRADO' WHERE id_factura=id_f AND numero_factura=nro;
			end if;
			IF (tp='CHEQUE') THEN
				INSERT INTO cobro_cheque (id_cobro, monto, banco, nro_cheque) VALUES (contador, mt, bc, cheq);
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_compra`(proceso varchar(1), nro varchar(20), fec date, id_p int, cd varchar(10), out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='A') then
			if exists (select id_pedido from pedido where id_pedido=id_p) then
				IF not EXISTS (SELECT id_pedido FROM compra WHERE id_pedido=id_p and nro_boleta=nro) THEN
					insert into compra (nro_boleta, fecha, id_pedido, condicion, estado) values (nro, fec, id_p, cd, 'ACTIVO');
					UPDATE pedido SET estado='COMPRADO' WHERE id_pedido=id_p;
					SET valor='SI';
				end if;
			end if;
		elseIF (proceso='B') THEN
			IF EXISTS (SELECT id_pedido FROM compra WHERE id_pedido=id_p AND nro_boleta=nro) THEN
					update compra set estado='ANULADO' WHERE id_pedido=id_p AND nro_boleta=nro;
					update pedido set estado='ACTIVO' WHERE id_pedido=id_p;
					SET valor='SI';
				END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_desconexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_desconexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_desconexion`(proceso varchar(1), cta varchar(15), med int, lec int)
BEGIN
		if (proceso='D') then #DESCONEXION
			if exists (select cta_cte_catastral from conexion where cta_cte_catastral=cta and id_medidor=med) then
				UPDATE estado_conexion SET estado=0 WHERE cta_cte_catastral=cta AND id_medidor=med;
				insert into estado_conexion( id_estado_conexion, cta_cte_catastral, id_medidor, fecha, tipo, lectura, estado) values (contador_estado_conexion(), cta, med, now(), 'DESCONEXION', lec, 1);
				update conexion set estado=0 WHERE cta_cte_catastral=cta AND id_medidor=med;
			end if;
		elseIF (proceso='R') THEN #RECONEXION
			IF EXISTS (SELECT cta_cte_catastral FROM conexion WHERE cta_cte_catastral=cta AND id_medidor=med) THEN
				update estado_conexion SET estado=0 WHERE cta_cte_catastral=cta AND id_medidor=med;
				INSERT INTO estado_conexion( id_estado_conexion, cta_cte_catastral, id_medidor, fecha, tipo, lectura, estado) VALUES (contador_estado_conexion(), cta, med, NOW(), 'RECONEXION', lec, 1);
				UPDATE conexion SET estado=1 WHERE cta_cte_catastral=cta AND id_medidor=med;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_facturacion` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_facturacion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_facturacion`(proceso varchar(1), cta varchar(15), fec date, vencim date, id integer, nro_an integer)
BEGIN
		declare nro int;
		declare id_fact int;
		declare hasta_f int;
		declare ci varchar(20);
		declare id_lect int;
		declare id_deuda int;
		declare nro_in varchar(20);
		declare venc date;
		declare m_deuda int;
		declare orr int;
		if (proceso='A') then
			set nro=calculo_factura();
			SET orr=(SELECT IFNULL(MAX(orden),0)+1 AS codigo FROM facturacion);
			if (nro>0) then
				IF EXISTS (SELECT cta_cte_catastral FROM finca WHERE cta_cte_catastral=cta) THEN
					SET id_fact=(SELECT factura.`id_factura` FROM factura WHERE factura.`estado`=1 ORDER BY id_factura DESC LIMIT 1);
					SET hasta_f=(SELECT factura.`hasta` FROM factura WHERE factura.`id_factura`=id_fact limit 1);
					set ci=(select finca.`ci_cliente` from finca where finca.`cta_cte_catastral`=cta limit 1);
					insert into facturacion(numero_factura, id_factura, fecha, vencimiento, estado, tipo, ci_cliente, orden) values (nro, id_fact, fec, vencim, 'ACTIVO', 'CONSUMO',ci, orr); 
					IF (nro=hasta_f) THEN
						UPDATE factura SET factura.`estado`=0 WHERE factura.`id_factura`=id_fact;
					END IF;
					SET id_lect=(SELECT lectura_medidor.`id_lectura` FROM lectura_medidor WHERE lectura_medidor.`estado`='ACTIVO' AND lectura_medidor.`cta_cte_catastral`=cta AND lectura_medidor.`id_lectura` NOT IN (SELECT facturacion_lectura.id_lectura FROM facturacion_lectura LEFT JOIN facturacion ON facturacion_lectura.numero_factura=facturacion.`numero_factura` and facturacion_lectura.id_factura=facturacion.`id_factura` WHERE facturacion.`estado`='ACTIVO') order by id_lectura desc LIMIT 1);
					if (id_lect!='0') then
						insert into facturacion_lectura (numero_factura, id_factura, id_lectura) values (nro, id_fact, id_lect);
						update lectura_medidor set lectura_medidor.`estado`='FACTURADO' where lectura_medidor.`id_lectura`=id_lect;
					end if;
					set id_deuda=(select deuda.id_deuda from deuda where deuda.cta_cte_catastral=cta and estado=1 order by id_deuda desc limit 1);
					if (id_deuda!='0') then
						insert into facturacion_deuda(numero_factura, id_factura, id_deuda) values (nro, id_fact, id_deuda);
						update deuda set deuda.estado=0 where deuda.id_deuda=id_deuda;
					end if; 
				end if;
			end if;
		ELSEIF (proceso='V') THEN
			IF EXISTS(SELECT facturacion.`id_factura` FROM facturacion WHERE facturacion.`id_factura`=id AND facturacion.`numero_factura`=nro_an) THEN
			if not exists (select id_deuda from deuda where cta_cte_catastral=cta and estado=1) then #SOLO UNA DEUDA A LA VEZ
					update facturacion set facturacion.`estado`='VENCIDO' WHERE facturacion.`id_factura`=id AND facturacion.`numero_factura`=nro_an;
					SET id_deuda=contador_deuda();
					set venc=(select vencimiento FROM facturacion WHERE facturacion.`id_factura`=id AND facturacion.`numero_factura`=nro_an);
					set nro_in=concat('001-001-',CONVERT(LPAD(nro_an,7,'0') USING latin1));
					set m_deuda=calculo_total_a_pagar(id,nro_an);
					if exists (select facturacion_deuda.`id_factura` FROM facturacion_deuda WHERE `id_factura`=id AND `numero_factura`=nro_an) THEN
						INSERT INTO deuda(id_deuda, cta_cte_catastral, descripcion, estado) VALUES (id_deuda, cta, 'DESCONEXION', 1);
						INSERT INTO deuda_factura(nro_factura, monto, vencimiento, id_deuda) VALUES (nro_in, m_deuda, venc, id_deuda);
					else
						INSERT INTO deuda(id_deuda, cta_cte_catastral, descripcion, estado) VALUES (id_deuda, cta, 'ULTIMO AVISO', 1);
						INSERT INTO deuda_factura(nro_factura, monto, vencimiento, id_deuda) VALUES (nro_in, m_deuda, venc, id_deuda);
					end if;
				end if;
			end if;
		ELSEIF (proceso='F') THEN
			IF EXISTS(SELECT facturacion.`id_factura` FROM facturacion WHERE facturacion.`id_factura`=id AND facturacion.`numero_factura`=nro_an) THEN		
				UPDATE facturacion SET facturacion.`estado`='FRACCIONADO' WHERE facturacion.`id_factura`=id AND facturacion.`numero_factura`=nro_an;
			END IF;
		/*elseif (proceso='B') then
			if exists(select facturacion.`cta_cte_catastral` from facturacion where facturacion.`id_factura`=id and facturacion.`numero_factura`=nro) then		
				if exists(select facturacion_lectura.id_lectura from facturacion_lectura where id_factura=id and numero_factura=nro) then		
					set id_lect=(SELECT facturacion_lectura.id_lectura FROM facturacion_lectura WHERE id_factura=id AND numero_factura=nro limit 1);
					if not exists(select lectura_medidor.`id_lectura` from lectura_medidor where lectura_medidor.`id_lectura`>id_lect and estado!='ANULADO' and cta_cte_catastral=cta) then		
						if exists(select facturacion_deuda.id_deuda from facturacion_deuda where id_factura=id and numero_factura=nro) then
							set id_deuda=(SELECT facturacion_deuda.id_deuda FROM facturacion_deuda WHERE id_factura=id AND numero_factura=nro limit 1);
							if not exists (select deuda.id_deuda from deuda where cta_cte_catastral=cta and id_deuda>id_deudad)then 
								update facturacion set estado='ANULADO' where id_factura=id and numero_factura=nro;
								update lectura_medidor set estado='ACTIVO' where id_lectura=id_lect;
								update deuda set estado=1 where id_deuda=id_deuda;
							end if;
						else
							UPDATE facturacion SET estado='ANULADO' WHERE id_factura=id AND numero_factura=nro;
							UPDATE lectura_medidor SET estado='ACTIVO' WHERE id_lectura=id_lect;
						end if;
					end if;
				end if;
			end if;*/
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_facturacion_servicio` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_facturacion_servicio` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_facturacion_servicio`(proceso varchar(1), id_sol int, id int, nro_an int)
BEGIN
		DECLARE nro INT;
		DECLARE id_fact INT;
		DECLARE hasta_f INT;
		DECLARE ci VARCHAR(20);
		declare id_ex int;
		DECLARE orr INT;
		if (proceso='A') then
			SET nro=calculo_factura();
			SET orr=(SELECT IFNULL(MAX(orden),0)+1 AS codigo FROM facturacion);
			IF (nro>0) THEN
				IF EXISTS (SELECT id_solicitud_conexion FROM solicitud_conexion WHERE id_solicitud_conexion=id_sol) THEN
					SET id_fact=(SELECT factura.`id_factura` FROM factura WHERE factura.`estado`=1 ORDER BY id_factura DESC LIMIT 1);
					SET hasta_f=(SELECT factura.`hasta` FROM factura WHERE factura.`id_factura`=id_fact LIMIT 1);
					SET ci=(SELECT solicitud_conexion.`ci_cliente` from solicitud_conexion where id_solicitud_conexion=id_sol limit 1);
					SET id_ex=(SELECT id_extension from extension WHERE id_solicitud_conexion=id_sol LIMIT 1);
					INSERT INTO facturacion(numero_factura, id_factura, fecha, vencimiento, estado, tipo, ci_cliente, orden) VALUES (nro, id_fact, now(), now(), 'FRACCIONADO', 'SERVICIO',ci, orr); 
					insert into facturacion_extension( numero_factura, id_factura, id_extension) values (nro, id_fact, id_ex);
					update solicitud_conexion set estado='FACTURADO' where id_solicitud_conexion=id_sol;
					update extension set estado='INACTIVO' where id_extension=id_ex;
					IF (nro=hasta_f) THEN
						UPDATE factura SET factura.`estado`=0 WHERE factura.`id_factura`=id_fact;
					END IF;
				end if;
			end if;
		elseIF (proceso='B') THEN
			set id_ex=0;#PARA NO DEJAR VACIO ELSE Y QUE NO TIRE ERROR
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_orden_compra` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_orden_compra` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_orden_compra`(proceso varchar(1),id_a int, id int, out valor int)
BEGIN
		DECLARE ci INT;
		set valor=contador_orden_compra();
		if (proceso='A') then
			IF EXISTS (SELECT id_acceso FROM acceso WHERE id_acceso=id_a) THEN
				SET ci=(SELECT ci_personal FROM acceso WHERE id_acceso=id_a LIMIT 1);
				insert into orden_compra( `id_orden_compra`, `fecha`, `estado`, `ci_personal`) values (valor, now(), 'ACTIVO', ci);
			end if;
		elseif(proceso='B') then
			IF exists (select id_orden_compra from orden_compra WHERE id_orden_compra=id and estado='ACTIVO') then
				update orden_compra set estado='ANULADO'  where id_orden_compra=id;
			end if;
		ELSEIF(proceso='P') THEN #YA PEDIDO O COMPRADO
			UPDATE orden_compra SET estado='PEDIDO'  WHERE id_orden_compra=id;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_pedido` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_pedido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_pedido`(proceso varchar(1), id_a int, rc varchar(20), id int, out valor int)
BEGIN
		DECLARE ci INT;
		SET valor=contador_pedido();
		IF (proceso='A') THEN
			IF EXISTS (SELECT id_acceso FROM acceso WHERE id_acceso=id_a) THEN
				SET ci=(SELECT ci_personal FROM acceso WHERE id_acceso=id_a LIMIT 1);
				IF EXISTS (SELECT ruc FROM proveedor WHERE ruc=rc) THEN
					insert into pedido( id_pedido, fecha, estado, ci_personal, ruc) values (valor, now(), 'ACTIVO', ci, rc);
				end if;
			end if;
		elseIF (proceso='B') THEN
			if exists (select id_pedido FROM pedido WHERE id_pedido=id and estado='ACTIVO') then
				update pedido set estado='ANULADO' where id_pedido=id;
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_pedido_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_pedido_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_pedido_detalle`(proceso varchar(1), cod varchar(20), cabecera int, ct double, prec int )
BEGIN
		declare iv smallint;
		if (proceso='A') then
			set iv=(select iva from producto where cod_barra=cod limit 1);
			insert into pedido_detalle( cod_barra, id_pedido, cant, precio, iva) values (cod, cabecera, ct, prec, iv);
		elseIF (proceso='M') THEN
			update pedido_detalle set precio=prec WHERE cod_barra=cod and id_pedido=cabecera;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_solicitud_conexion` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_solicitud_conexion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_solicitud_conexion`(proceso varchar(1), ci varchar(20), cta varchar(15), tp varchar(20), la double, lt double, id int, out valor varchar(2), out id_sol int)
BEGIN
		declare id_ext int;
		declare id_der int;
		declare mt_ext int;
		set valor='NO';
		SET id_sol= contador_solicitud_conexion();
		if (proceso='A') then
			SET valor='CT'; #NO EXISTE CTA
			if exists (select cta_cte_catastral from finca where cta_cte_catastral=cta) then
				SET valor='CL'; #NO EXISTE CLIENTE
				IF EXISTS (SELECT ci_cliente FROM cliente WHERE ci_cliente=ci) THEN
					set valor='CN'; #CUENTA CON CONEXION ACTIVA
					IF NOT EXISTS (select cta_cte_catastral from conexion where estado=1 and cta_cte_catastral=cta) then
						SET id_ext= contador_extension();
						set id_der=(select id_precio_conexion from precio_conexion where estado=1 limit 1);# PRECIO DE CONEXION ACTIVO
						insert into solicitud_conexion (id_solicitud_conexion, cta_cte_catastral, ci_cliente, fecha, estado) values (id_sol, cta, ci, now(), 'ACTIVO');
						insert into extension (id_extension, id_solicitud_conexion, id_precio_conexion, tipo, estado) values (id_ext, id_sol, id_der, tp, 'ACTIVO');
						if (la>0) then
							set mt_ext=(select monto from precio_extension where estado=1 and tipo='ASFALTO');# PRECIO DE EXTENSION POR ASFALTO ACTIVO
							insert into longitud_extension (id_longitud, id_extension, longitud, monto, tipo) values (contador_longitud_extension(), id_ext, la, mt_ext, 'ASFALTO');
						end if; 
						IF (lt>0) THEN
							SET mt_ext=(SELECT monto FROM precio_extension WHERE estado=1 AND tipo='TIERRA');# PRECIO DE EXTENSION POR TIERRA ACTIVO
							INSERT INTO longitud_extension (id_longitud, id_extension, longitud, monto, tipo) VALUES (contador_longitud_extension(), id_ext, lt, mt_ext, 'TIERRA');
						END IF; 
						set valor='SI';
					end if;
				end if;
			end if;
		elseif (proceso='B') then
			set valor='FC'; #YA FUE FACTURADO
			if exists (select id_solicitud_conexion from solicitud_conexion where id_solicitud_conexion=id and estado='ACTIVO') then
				update solicitud_conexion set estado='ANULADO' where id_solicitud_conexion=id;
				set valor='SI';
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_trabajo` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_trabajo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_trabajo`(proceso varchar(1), des varchar(100), id int, out valor int)
BEGIN
		set valor=contador_trabajo();
		if (proceso='A') then
			insert into trabajo (id_trabajo, descripcion, fecha, estado) values (valor, des, now(), 1);
		elseIF (proceso='B') THEN
			if exists (select id_trabajo from trabajo where id_trabajo=id) then
				update trabajo set estado=0 WHERE id_trabajo=id;
			end if;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `mov_trabajo_detalle` */

/*!50003 DROP PROCEDURE IF EXISTS  `mov_trabajo_detalle` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `mov_trabajo_detalle`(proceso varchar(2),cabecera int, cod varchar(20), cant double)
BEGIN
		if (proceso='PR') then #PRODUCTO
			insert into trabajo_producto( id_trabajo, cod_barra, cantidad) values (cabecera, cod, cant);
		elseif (proceso='PE') then #PERSONAL
			insert into trabajo_personal( id_trabajo, ci_personal) values (cabecera, cod);
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `personal_telefono_correo` */

/*!50003 DROP PROCEDURE IF EXISTS  `personal_telefono_correo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `personal_telefono_correo`(proceso varchar(2), tel_cor varchar(100), ci int, out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='TA') THEN
			if not exists (select personal_telefono.`telefono` from personal_telefono where personal_telefono.`telefono`=tel_cor) then
				set valor='EX';
				if exists (select ci_personal from personal where ci_personal=ci) then
					insert into personal_telefono( ci_personal, telefono) values (ci, tel_cor);
					set valor='SI';
				end if;
			end if;
		elseIF (proceso='TB') THEN
			IF EXISTS (SELECT personal_telefono.`telefono` FROM personal_telefono WHERE personal_telefono.`telefono`=tel_cor) THEN
				SET valor='EX';
				IF EXISTS (SELECT ci_personal FROM personal WHERE ci_personal=ci) THEN
					DELETE FROM personal_telefono where personal_telefono.`ci_personal`=ci and personal_telefono.`telefono`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CA') THEN
			IF NOT EXISTS (SELECT personal_correo.`correo` FROM personal_correo WHERE personal_correo.`correo`=tel_cor) THEN
				SET valor='EX';
				iF EXISTS (SELECT ci_personal FROM personal WHERE ci_personal=ci) THEN
					insert into personal_correo( ci_personal, correo) values (ci, tel_cor);
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CB') THEN
			IF EXISTS (SELECT personal_correo.`correo` FROM personal_correo WHERE personal_correo.`correo`=tel_cor) THEN
				SET valor='EX';
				iF EXISTS (SELECT ci_personal FROM personal WHERE ci_personal=ci) THEN
					DELETE FROM personal_correo where personal_correo.`ci_personal`=ci and personal_correo.`correo`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		end if;
	END */$$
DELIMITER ;

/* Procedure structure for procedure `proveedor_telefono_correo` */

/*!50003 DROP PROCEDURE IF EXISTS  `proveedor_telefono_correo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `proveedor_telefono_correo`(proceso varchar(2), tel_cor varchar(100), rc varchar(20), out valor varchar(2))
BEGIN
		set valor='NO';
		if (proceso='TA') THEN
			if not exists (select proveedor_telefono.`telefono` from proveedor_telefono where proveedor_telefono.`telefono`=tel_cor and proveedor_telefono.`ruc`=rc) then
				set valor='EX';
				if exists (select proveedor.`ruc` from proveedor where proveedor.`ruc`=rc) then
					insert into proveedor_telefono( ruc, telefono) values (rc, tel_cor);
					set valor='SI';
				end if;
			end if;
		elseIF (proceso='TB') THEN
			IF EXISTS (SELECT proveedor_telefono.`telefono` FROM proveedor_telefono WHERE proveedor_telefono.`telefono`=tel_cor) THEN
				SET valor='EX';
				IF EXISTS (SELECT proveedor.`ruc` FROM proveedor WHERE proveedor.`ruc`=rc) THEN
					DELETE FROM proveedor_telefono where proveedor_telefono.`ruc`=rc and proveedor_telefono.`telefono`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CA') THEN
			IF NOT EXISTS (SELECT proveedor_correo.`correo` FROM proveedor_correo WHERE proveedor_correo.`correo`=tel_cor AND proveedor_correo.`ruc`=rc) THEN
				SET valor='EX';
				IF EXISTS (SELECT proveedor.`ruc` FROM proveedor WHERE proveedor.`ruc`=rc) THEN
					insert into proveedor_correo( ruc, correo) values (rc, tel_cor);
					SET valor='SI';
				END IF;
			END IF;
		ELSEIF (proceso='CB') THEN
			IF EXISTS (SELECT proveedor_correo.`correo` FROM proveedor_correo WHERE proveedor_correo.`correo`=tel_cor) THEN
				SET valor='EX';
				IF EXISTS (SELECT proveedor.`ruc` FROM proveedor WHERE proveedor.`ruc`=rc) THEN
					DELETE FROM proveedor_correo where proveedor_correo.`ruc`=rc and proveedor_correo.`correo`=tel_cor;
					SET valor='SI';
				END IF;
			END IF;
		end if;
	END */$$
DELIMITER ;

/*Table structure for table `cabecera_cierre` */

DROP TABLE IF EXISTS `cabecera_cierre`;

/*!50001 DROP VIEW IF EXISTS `cabecera_cierre` */;
/*!50001 DROP TABLE IF EXISTS `cabecera_cierre` */;

/*!50001 CREATE TABLE  `cabecera_cierre`(
 `id_cierre` int(11) ,
 `fecha` varchar(10) ,
 `hora` varchar(10) ,
 `nro_deposito` int(11) ,
 `nomape` varchar(101) ,
 `total_letra` varchar(512) ,
 `obs` varchar(200) 
)*/;

/*Table structure for table `cabecera_factura_consumo` */

DROP TABLE IF EXISTS `cabecera_factura_consumo`;

/*!50001 DROP VIEW IF EXISTS `cabecera_factura_consumo` */;
/*!50001 DROP TABLE IF EXISTS `cabecera_factura_consumo` */;

/*!50001 CREATE TABLE  `cabecera_factura_consumo`(
 `id_factura` int(11) ,
 `razon` varchar(101) ,
 `ci_cliente` varchar(20) ,
 `direccion` varchar(117) ,
 `numero_factura` int(11) ,
 `num_completo` varchar(15) ,
 `mes` varchar(10) ,
 `codigo` varchar(20) ,
 `fecha` varchar(10) ,
 `vencimiento` varchar(10) ,
 `ciclo` varchar(25) ,
 `notificacion` varchar(20) ,
 `fraccionamiento` varchar(20) ,
 `l_anterior` varchar(47) ,
 `l_actual` varchar(47) ,
 `consumo_lts` varchar(47) ,
 `total` varchar(47) ,
 `total_letras` varchar(512) ,
 `cta_cte_catastral` varchar(15) ,
 `id_medidor` int(11) ,
 `num_cod` varchar(7) ,
 `orden` int(11) ,
 `id_lectura` int(11) 
)*/;

/*Table structure for table `cabecera_factura_solicitud` */

DROP TABLE IF EXISTS `cabecera_factura_solicitud`;

/*!50001 DROP VIEW IF EXISTS `cabecera_factura_solicitud` */;
/*!50001 DROP TABLE IF EXISTS `cabecera_factura_solicitud` */;

/*!50001 CREATE TABLE  `cabecera_factura_solicitud`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `razon` varchar(101) ,
 `ci_cliente` varchar(20) ,
 `direccion` varchar(117) ,
 `num_completo` varchar(15) ,
 `fecha` varchar(10) ,
 `total` varchar(47) ,
 `total_letras` varchar(512) ,
 `num_cod` varchar(7) ,
 `id_extension` int(11) 
)*/;

/*Table structure for table `detalle_cierre` */

DROP TABLE IF EXISTS `detalle_cierre`;

/*!50001 DROP VIEW IF EXISTS `detalle_cierre` */;
/*!50001 DROP TABLE IF EXISTS `detalle_cierre` */;

/*!50001 CREATE TABLE  `detalle_cierre`(
 `id_cierre` int(11) ,
 `nomape` varchar(101) ,
 `num_completo` varchar(15) ,
 `monto` int(11) ,
 `nro_cheque` int(11) ,
 `banco` varchar(40) ,
 `nro_recibo` int(11) ,
 `id_cobro` int(11) 
)*/;

/*Table structure for table `detalle_factura_consumo` */

DROP TABLE IF EXISTS `detalle_factura_consumo`;

/*!50001 DROP VIEW IF EXISTS `detalle_factura_consumo` */;
/*!50001 DROP TABLE IF EXISTS `detalle_factura_consumo` */;

/*!50001 CREATE TABLE  `detalle_factura_consumo`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `consumo` int(11) ,
 `iva` varchar(54) ,
 `erssan` varchar(54) ,
 `deuda` varchar(47) ,
 `redondeo` int(11) 
)*/;

/*Table structure for table `detalle_factura_consumo_anterior` */

DROP TABLE IF EXISTS `detalle_factura_consumo_anterior`;

/*!50001 DROP VIEW IF EXISTS `detalle_factura_consumo_anterior` */;
/*!50001 DROP TABLE IF EXISTS `detalle_factura_consumo_anterior` */;

/*!50001 CREATE TABLE  `detalle_factura_consumo_anterior`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `mes` varchar(10) ,
 `l_anterior` varchar(47) ,
 `l_actual` varchar(47) ,
 `consumo_lts` varchar(47) ,
 `consumo_gs` varchar(47) ,
 `estado` varchar(12) ,
 `cta_cte_catastral` varchar(15) ,
 `id_medidor` int(11) ,
 `id_lectura` int(11) ,
 `fecha_sin` date 
)*/;

/*Table structure for table `detalle_factura_solicitud` */

DROP TABLE IF EXISTS `detalle_factura_solicitud`;

/*!50001 DROP VIEW IF EXISTS `detalle_factura_solicitud` */;
/*!50001 DROP TABLE IF EXISTS `detalle_factura_solicitud` */;

/*!50001 CREATE TABLE  `detalle_factura_solicitud`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `derecho` varchar(47) ,
 `extension` varchar(47) ,
 `iva` varchar(54) ,
 `redondeo` varchar(47) 
)*/;

/*Table structure for table `detalle_ficha_usuario` */

DROP TABLE IF EXISTS `detalle_ficha_usuario`;

/*!50001 DROP VIEW IF EXISTS `detalle_ficha_usuario` */;
/*!50001 DROP TABLE IF EXISTS `detalle_ficha_usuario` */;

/*!50001 CREATE TABLE  `detalle_ficha_usuario`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `num_completo` varchar(15) ,
 `orden` int(11) ,
 `fecha` varchar(10) ,
 `cta_cte_catastral` varchar(15) ,
 `total` varchar(47) ,
 `estado` varchar(12) ,
 `lectura` varchar(47) ,
 `consumo_lts` varchar(47) 
)*/;

/*Table structure for table `impresion_contrato` */

DROP TABLE IF EXISTS `impresion_contrato`;

/*!50001 DROP VIEW IF EXISTS `impresion_contrato` */;
/*!50001 DROP TABLE IF EXISTS `impresion_contrato` */;

/*!50001 CREATE TABLE  `impresion_contrato`(
 `id_contrato` int(11) ,
 `fecha` varchar(10) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `cta_cte_catastral` varchar(15) ,
 `nombre_barrio` varchar(70) ,
 `direccion` varchar(100) ,
 `id_medidor` int(11) 
)*/;

/*Table structure for table `impresion_prefacturar` */

DROP TABLE IF EXISTS `impresion_prefacturar`;

/*!50001 DROP VIEW IF EXISTS `impresion_prefacturar` */;
/*!50001 DROP TABLE IF EXISTS `impresion_prefacturar` */;

/*!50001 CREATE TABLE  `impresion_prefacturar`(
 `id_lectura` int(11) ,
 `estado` varchar(10) ,
 `cta_cte_catastral` varchar(15) ,
 `orden` double ,
 `ci_nomape` varchar(124) ,
 `direccion` varchar(100) ,
 `nombre_barrio` varchar(70) ,
 `l_anterior` varchar(47) ,
 `l_actual` varchar(47) ,
 `consumo_lts` varchar(47) ,
 `consumo_gs` varchar(47) ,
 `deuda` varchar(47) ,
 `iva` varchar(54) ,
 `erssan` varchar(54) ,
 `redondeo` int(11) ,
 `total` varchar(47) 
)*/;

/*Table structure for table `impresion_presupuesto_solicitud` */

DROP TABLE IF EXISTS `impresion_presupuesto_solicitud`;

/*!50001 DROP VIEW IF EXISTS `impresion_presupuesto_solicitud` */;
/*!50001 DROP TABLE IF EXISTS `impresion_presupuesto_solicitud` */;

/*!50001 CREATE TABLE  `impresion_presupuesto_solicitud`(
 `id_solicitud_conexion` int(11) ,
 `fecha` varchar(10) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `cta_cte_catastral` varchar(15) ,
 `nombre_barrio` varchar(70) ,
 `direccion` varchar(100) ,
 `derecho` varchar(200) ,
 `asfalto` varchar(200) ,
 `tierra` varchar(200) ,
 `esquina` int(11) ,
 `total` int(11) ,
 `total_letra` varchar(512) 
)*/;

/*Table structure for table `impresion_recibo` */

DROP TABLE IF EXISTS `impresion_recibo`;

/*!50001 DROP VIEW IF EXISTS `impresion_recibo` */;
/*!50001 DROP TABLE IF EXISTS `impresion_recibo` */;

/*!50001 CREATE TABLE  `impresion_recibo`(
 `nro_recibo` int(11) ,
 `descripcion` varchar(50) ,
 `fecha` varchar(25) ,
 `monto` varchar(47) ,
 `monto_letra` varchar(512) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `numero_factura` int(11) ,
 `id_factura` int(11) ,
 `tipo_cobro` varchar(10) ,
 `total` varchar(47) ,
 `saldo` varchar(47) ,
 `nro_cheque` int(11) ,
 `banco` varchar(40) 
)*/;

/*Table structure for table `impresion_recibo_cobro` */

DROP TABLE IF EXISTS `impresion_recibo_cobro`;

/*!50001 DROP VIEW IF EXISTS `impresion_recibo_cobro` */;
/*!50001 DROP TABLE IF EXISTS `impresion_recibo_cobro` */;

/*!50001 CREATE TABLE  `impresion_recibo_cobro`(
 `nro_recibo` int(11) ,
 `monto` varchar(47) ,
 `numero_factura` int(11) ,
 `id_factura` int(11) 
)*/;

/*Table structure for table `informe_facturacion` */

DROP TABLE IF EXISTS `informe_facturacion`;

/*!50001 DROP VIEW IF EXISTS `informe_facturacion` */;
/*!50001 DROP TABLE IF EXISTS `informe_facturacion` */;

/*!50001 CREATE TABLE  `informe_facturacion`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `num_completo` varchar(15) ,
 `estado` varchar(12) ,
 `notificacion` varchar(20) ,
 `orden` int(11) ,
 `l_anterior` varchar(47) ,
 `l_actual` varchar(47) ,
 `consumo_lts` varchar(47) ,
 `consumo_gs` int(11) ,
 `iva` varchar(54) ,
 `erssan` varchar(54) ,
 `deuda` varchar(47) ,
 `redondeo` int(11) ,
 `total` varchar(47) ,
 `cta_cte_catastral` varchar(15) ,
 `nombre_barrio` varchar(70) ,
 `fecha_filtro` varchar(7) 
)*/;

/*Table structure for table `para_rango_facturacion` */

DROP TABLE IF EXISTS `para_rango_facturacion`;

/*!50001 DROP VIEW IF EXISTS `para_rango_facturacion` */;
/*!50001 DROP TABLE IF EXISTS `para_rango_facturacion` */;

/*!50001 CREATE TABLE  `para_rango_facturacion`(
 `id_factura` int(11) ,
 `numero_factura` int(11) ,
 `num_completo` varchar(15) 
)*/;

/*Table structure for table `vista_acceso` */

DROP TABLE IF EXISTS `vista_acceso`;

/*!50001 DROP VIEW IF EXISTS `vista_acceso` */;
/*!50001 DROP TABLE IF EXISTS `vista_acceso` */;

/*!50001 CREATE TABLE  `vista_acceso`(
 `id_acceso` int(11) ,
 `ci_personal` int(11) ,
 `usuario` varchar(20) ,
 `personal` varchar(101) ,
 `estado` bit(1) ,
 `id_rol` int(11) ,
 `pass` text 
)*/;

/*Table structure for table `vista_cobro` */

DROP TABLE IF EXISTS `vista_cobro`;

/*!50001 DROP VIEW IF EXISTS `vista_cobro` */;
/*!50001 DROP TABLE IF EXISTS `vista_cobro` */;

/*!50001 CREATE TABLE  `vista_cobro`(
 `id_cobro` int(11) ,
 `fecha` varchar(10) ,
 `fecha_sin` date ,
 `num_completo` varchar(15) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `monto` varchar(47) 
)*/;

/*Table structure for table `vista_compra` */

DROP TABLE IF EXISTS `vista_compra`;

/*!50001 DROP VIEW IF EXISTS `vista_compra` */;
/*!50001 DROP TABLE IF EXISTS `vista_compra` */;

/*!50001 CREATE TABLE  `vista_compra`(
 `nro_boleta` varchar(20) ,
 `fecha` varchar(10) ,
 `fecha_sin` date ,
 `ruc` varchar(20) ,
 `razon` varchar(100) ,
 `estado` varchar(10) ,
 `total` varchar(47) ,
 `saldo` varchar(47) 
)*/;

/*Table structure for table `vista_conexion` */

DROP TABLE IF EXISTS `vista_conexion`;

/*!50001 DROP VIEW IF EXISTS `vista_conexion` */;
/*!50001 DROP TABLE IF EXISTS `vista_conexion` */;

/*!50001 CREATE TABLE  `vista_conexion`(
 `cta_cte_catastral` varchar(15) ,
 `nombre_barrio` varchar(70) ,
 `direccion` varchar(100) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `id_medidor` int(11) ,
 `fecha` varchar(10) ,
 `codigo` varchar(20) ,
 `nombre_modelo` varchar(20) ,
 `estado` bit(1) ,
 `lectura_inicial` int(11) ,
 `l_anterior` varchar(47) ,
 `orden` double 
)*/;

/*Table structure for table `vista_finca` */

DROP TABLE IF EXISTS `vista_finca`;

/*!50001 DROP VIEW IF EXISTS `vista_finca` */;
/*!50001 DROP TABLE IF EXISTS `vista_finca` */;

/*!50001 CREATE TABLE  `vista_finca`(
 `cta_cte_catastral` varchar(15) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `direccion` varchar(100) ,
 `nombre_barrio` varchar(70) ,
 `id_barrio` int(11) ,
 `orden` double 
)*/;

/*Table structure for table `vista_lectura` */

DROP TABLE IF EXISTS `vista_lectura`;

/*!50001 DROP VIEW IF EXISTS `vista_lectura` */;
/*!50001 DROP TABLE IF EXISTS `vista_lectura` */;

/*!50001 CREATE TABLE  `vista_lectura`(
 `id_lectura` int(11) ,
 `estado` varchar(10) ,
 `fecha` varchar(10) ,
 `cta_cte_catastral` varchar(15) ,
 `direccion` varchar(100) ,
 `nombre_barrio` varchar(70) ,
 `ci_cliente` varchar(20) ,
 `nomape` varchar(101) ,
 `id_medidor` int(11) ,
 `l_anterior` varchar(47) ,
 `l_actual` varchar(47) ,
 `consumo_lts` varchar(47) ,
 `consumo_gs` varchar(47) ,
 `codigo` varchar(20) ,
 `orden` double ,
 `fecha_filtro` varchar(7) 
)*/;

/*Table structure for table `vista_medidor` */

DROP TABLE IF EXISTS `vista_medidor`;

/*!50001 DROP VIEW IF EXISTS `vista_medidor` */;
/*!50001 DROP TABLE IF EXISTS `vista_medidor` */;

/*!50001 CREATE TABLE  `vista_medidor`(
 `id_medidor` int(11) ,
 `codigo` varchar(20) ,
 `id_modelo_medidor` int(11) ,
 `modelo` varchar(20) 
)*/;

/*Table structure for table `vista_pago` */

DROP TABLE IF EXISTS `vista_pago`;

/*!50001 DROP VIEW IF EXISTS `vista_pago` */;
/*!50001 DROP TABLE IF EXISTS `vista_pago` */;

/*!50001 CREATE TABLE  `vista_pago`(
 `id_pago` int(11) ,
 `fecha` varchar(10) ,
 `fecha_sin` date ,
 `nro_boleta` varchar(20) ,
 `ruc` varchar(20) ,
 `razon` varchar(105) ,
 `monto` varchar(47) 
)*/;

/*View structure for view cabecera_cierre */

/*!50001 DROP TABLE IF EXISTS `cabecera_cierre` */;
/*!50001 DROP VIEW IF EXISTS `cabecera_cierre` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cabecera_cierre` AS (select `cierre`.`id_cierre` AS `id_cierre`,date_format(`cierre`.`fecha`,'%d-%m-%Y') AS `fecha`,date_format(`cierre`.`fecha`,'%H:%i') AS `hora`,`cierre`.`nro_deposito` AS `nro_deposito`,concat(`personal`.`nombre`,' ',`personal`.`apellido`) AS `nomape`,`numeros_a_letras`(`ver_monto_cierre`(`cierre`.`id_cierre`)) AS `total_letra`,`ver_cierre_obs`(`cierre`.`id_cierre`) AS `obs` from (`cierre` join `personal` on((`cierre`.`ci_personal` = `personal`.`ci_personal`)))) */;

/*View structure for view cabecera_factura_consumo */

/*!50001 DROP TABLE IF EXISTS `cabecera_factura_consumo` */;
/*!50001 DROP VIEW IF EXISTS `cabecera_factura_consumo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cabecera_factura_consumo` AS (select `facturacion`.`id_factura` AS `id_factura`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `razon`,`facturacion`.`ci_cliente` AS `ci_cliente`,concat(`finca`.`cta_cte_catastral`,', ',`finca`.`direccion`) AS `direccion`,`facturacion`.`numero_factura` AS `numero_factura`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,`mes_espanhol`(date_format((`facturacion`.`fecha` - interval 1 month),'%m')) AS `mes`,`medidor`.`codigo` AS `codigo`,date_format(`facturacion`.`fecha`,'%d-%m-%Y') AS `fecha`,date_format(`facturacion`.`vencimiento`,'%d-%m-%Y') AS `vencimiento`,`ver_ciclo_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`) AS `ciclo`,`ver_notificacion_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'N') AS `notificacion`,`ver_notificacion_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'F') AS `fraccionamiento`,format(`lectura_anterior`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `l_anterior`,format(`lectura_medidor`.`lectura`,0,'de_DE') AS `l_actual`,format(`calculo_consumo`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_lts`,format(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'CONSUMO'),0,'de_DE') AS `total`,`numeros_a_letras`(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'CONSUMO')) AS `total_letras`,`lectura_medidor`.`cta_cte_catastral` AS `cta_cte_catastral`,`lectura_medidor`.`id_medidor` AS `id_medidor`,convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1) AS `num_cod`,`facturacion`.`orden` AS `orden`,`facturacion_lectura`.`id_lectura` AS `id_lectura` from ((((((`facturacion` join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`))) join `factura` on((`facturacion`.`id_factura` = `factura`.`id_factura`))) join `facturacion_lectura` on(((`facturacion`.`id_factura` = `facturacion_lectura`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_lectura`.`numero_factura`)))) join `lectura_medidor` on((`facturacion_lectura`.`id_lectura` = `lectura_medidor`.`id_lectura`))) join `medidor` on((`lectura_medidor`.`id_medidor` = `medidor`.`id_medidor`))) join `finca` on((`lectura_medidor`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`)))) */;

/*View structure for view cabecera_factura_solicitud */

/*!50001 DROP TABLE IF EXISTS `cabecera_factura_solicitud` */;
/*!50001 DROP VIEW IF EXISTS `cabecera_factura_solicitud` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `cabecera_factura_solicitud` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `razon`,`facturacion`.`ci_cliente` AS `ci_cliente`,concat(`finca`.`cta_cte_catastral`,', ',`finca`.`direccion`) AS `direccion`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,date_format(`facturacion`.`fecha`,'%d-%m-%Y') AS `fecha`,format(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'SERVICIO'),0,'de_DE') AS `total`,`numeros_a_letras`(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'SERVICIO')) AS `total_letras`,convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1) AS `num_cod`,`facturacion_extension`.`id_extension` AS `id_extension` from ((((((`facturacion` join `factura` on((`facturacion`.`id_factura` = `factura`.`id_factura`))) join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`))) join `facturacion_extension` on(((`facturacion`.`id_factura` = `facturacion_extension`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_extension`.`numero_factura`)))) join `extension` on((`facturacion_extension`.`id_extension` = `extension`.`id_extension`))) join `solicitud_conexion` on((`extension`.`id_solicitud_conexion` = `solicitud_conexion`.`id_solicitud_conexion`))) join `finca` on((`solicitud_conexion`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`)))) */;

/*View structure for view detalle_cierre */

/*!50001 DROP TABLE IF EXISTS `detalle_cierre` */;
/*!50001 DROP VIEW IF EXISTS `detalle_cierre` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_cierre` AS (select `cierre_cobro`.`id_cierre` AS `id_cierre`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,`cobro`.`monto` AS `monto`,`ver_nro_cheque_cobro`(`cobro`.`id_cobro`) AS `nro_cheque`,`ver_banco_cheque_cobro`(`cobro`.`id_cobro`) AS `banco`,`ver_recibo_cobro`(`cobro`.`id_cobro`) AS `nro_recibo`,`cierre_cobro`.`id_cobro` AS `id_cobro` from ((((`cierre_cobro` join `cobro` on((`cierre_cobro`.`id_cobro` = `cobro`.`id_cobro`))) join `facturacion` on(((`cobro`.`numero_factura` = `facturacion`.`numero_factura`) and (`cobro`.`id_factura` = `facturacion`.`id_factura`)))) join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`))) join `factura` on((`facturacion`.`id_factura` = `factura`.`id_factura`)))) */;

/*View structure for view detalle_factura_consumo */

/*!50001 DROP TABLE IF EXISTS `detalle_factura_consumo` */;
/*!50001 DROP VIEW IF EXISTS `detalle_factura_consumo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_factura_consumo` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,`calculo_consumo_precio`(`facturacion_lectura`.`id_lectura`) AS `consumo`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 10),0,'de_DE') AS `iva`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 50),0,'de_DE') AS `erssan`,format(`ver_deuda_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`),0,'de_DE') AS `deuda`,`ver_redondeo_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'CONSUMO') AS `redondeo` from ((`facturacion` join `facturacion_lectura` on(((`facturacion`.`id_factura` = `facturacion_lectura`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_lectura`.`numero_factura`)))) join `lectura_medidor` on((`facturacion_lectura`.`id_lectura` = `lectura_medidor`.`id_lectura`)))) */;

/*View structure for view detalle_factura_consumo_anterior */

/*!50001 DROP TABLE IF EXISTS `detalle_factura_consumo_anterior` */;
/*!50001 DROP VIEW IF EXISTS `detalle_factura_consumo_anterior` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_factura_consumo_anterior` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,`mes_espanhol`(date_format((`facturacion`.`fecha` - interval 1 month),'%m')) AS `mes`,format(`lectura_anterior`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `l_anterior`,format(`lectura_medidor`.`lectura`,0,'de_DE') AS `l_actual`,format(`calculo_consumo`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_lts`,format(`ver_subtotal_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`),0,'de_DE') AS `consumo_gs`,`facturacion`.`estado` AS `estado`,`lectura_medidor`.`cta_cte_catastral` AS `cta_cte_catastral`,`lectura_medidor`.`id_medidor` AS `id_medidor`,`facturacion_lectura`.`id_lectura` AS `id_lectura`,`facturacion`.`fecha` AS `fecha_sin` from ((`facturacion` join `facturacion_lectura` on(((`facturacion`.`id_factura` = `facturacion_lectura`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_lectura`.`numero_factura`)))) join `lectura_medidor` on((`facturacion_lectura`.`id_lectura` = `lectura_medidor`.`id_lectura`)))) */;

/*View structure for view detalle_factura_solicitud */

/*!50001 DROP TABLE IF EXISTS `detalle_factura_solicitud` */;
/*!50001 DROP VIEW IF EXISTS `detalle_factura_solicitud` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_factura_solicitud` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,format(`ver_detalle_solicitud_facturacion`(`extension`.`id_extension`,'d'),0,'de_DE') AS `derecho`,format(`ver_detalle_solicitud_facturacion`(`extension`.`id_extension`,'e'),0,'de_DE') AS `extension`,format((`calculo_total_solicitud`(`extension`.`id_solicitud_conexion`) / 11),0,'de_DE') AS `iva`,format(`ajuste_redondeo`(`calculo_total_solicitud`(`extension`.`id_solicitud_conexion`)),0,'de_DE') AS `redondeo` from ((`facturacion` join `facturacion_extension` on(((`facturacion`.`id_factura` = `facturacion_extension`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_extension`.`numero_factura`)))) join `extension` on((`facturacion_extension`.`id_extension` = `extension`.`id_extension`)))) */;

/*View structure for view detalle_ficha_usuario */

/*!50001 DROP TABLE IF EXISTS `detalle_ficha_usuario` */;
/*!50001 DROP VIEW IF EXISTS `detalle_ficha_usuario` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `detalle_ficha_usuario` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,`facturacion`.`orden` AS `orden`,date_format(`facturacion`.`fecha`,'%d-%m-%Y') AS `fecha`,`facturacion_cta`(`facturacion`.`numero_factura`,`facturacion`.`id_factura`,`facturacion`.`tipo`) AS `cta_cte_catastral`,format(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,`facturacion`.`tipo`),0,'de_DE') AS `total`,`facturacion`.`estado` AS `estado`,format(`ver_lectura_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`),0,'de_DE') AS `lectura`,format(`ver_consumo_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`),0,'de_DE') AS `consumo_lts` from (`facturacion` join `factura` on((`facturacion`.`id_factura` = `factura`.`id_factura`)))) */;

/*View structure for view impresion_contrato */

/*!50001 DROP TABLE IF EXISTS `impresion_contrato` */;
/*!50001 DROP VIEW IF EXISTS `impresion_contrato` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `impresion_contrato` AS (select `contrato`.`id_contrato` AS `id_contrato`,date_format(`conexion`.`fecha`,'%d-%m-%Y') AS `fecha`,`contrato`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`contrato`.`cta_cte_catastral` AS `cta_cte_catastral`,`barrio`.`nombre_barrio` AS `nombre_barrio`,`finca`.`direccion` AS `direccion`,`contrato`.`id_medidor` AS `id_medidor` from ((((`contrato` join `conexion` on(((`contrato`.`cta_cte_catastral` = `conexion`.`cta_cte_catastral`) and (`contrato`.`id_medidor` = `conexion`.`id_medidor`)))) join `cliente` on((`contrato`.`ci_cliente` = `cliente`.`ci_cliente`))) join `finca` on((`contrato`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`)))) */;

/*View structure for view impresion_prefacturar */

/*!50001 DROP TABLE IF EXISTS `impresion_prefacturar` */;
/*!50001 DROP VIEW IF EXISTS `impresion_prefacturar` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `impresion_prefacturar` AS (select `lectura_medidor`.`id_lectura` AS `id_lectura`,`lectura_medidor`.`estado` AS `estado`,`lectura_medidor`.`cta_cte_catastral` AS `cta_cte_catastral`,`finca`.`orden` AS `orden`,concat(`cliente`.`ci_cliente`,' / ',`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `ci_nomape`,`finca`.`direccion` AS `direccion`,`barrio`.`nombre_barrio` AS `nombre_barrio`,format(`lectura_anterior`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `l_anterior`,format(`lectura_medidor`.`lectura`,0) AS `l_actual`,format(`calculo_consumo`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_lts`,format(`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_gs`,format(`calculo_consumo_deuda`(`conexion`.`cta_cte_catastral`),0,'de_DE') AS `deuda`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 10),0,'de_DE') AS `iva`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 50),0,'de_DE') AS `erssan`,`calculo_consumo_facturar`(`lectura_medidor`.`id_lectura`,'R') AS `redondeo`,format(`calculo_consumo_facturar`(`lectura_medidor`.`id_lectura`,'T'),0,'de_DE') AS `total` from ((((`lectura_medidor` join `conexion` on(((`lectura_medidor`.`cta_cte_catastral` = `conexion`.`cta_cte_catastral`) and (`lectura_medidor`.`id_medidor` = `conexion`.`id_medidor`)))) join `finca` on((`conexion`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `cliente` on((`finca`.`ci_cliente` = `cliente`.`ci_cliente`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`)))) */;

/*View structure for view impresion_presupuesto_solicitud */

/*!50001 DROP TABLE IF EXISTS `impresion_presupuesto_solicitud` */;
/*!50001 DROP VIEW IF EXISTS `impresion_presupuesto_solicitud` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `impresion_presupuesto_solicitud` AS (select `solicitud_conexion`.`id_solicitud_conexion` AS `id_solicitud_conexion`,date_format(`solicitud_conexion`.`fecha`,'%d-%m-%Y') AS `fecha`,`cliente`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`finca`.`cta_cte_catastral` AS `cta_cte_catastral`,`barrio`.`nombre_barrio` AS `nombre_barrio`,`finca`.`direccion` AS `direccion`,`solicitud_precio_tipo`(`solicitud_conexion`.`id_solicitud_conexion`,'DERECHO') AS `derecho`,`solicitud_precio_tipo`(`solicitud_conexion`.`id_solicitud_conexion`,'ASFALTO') AS `asfalto`,`solicitud_precio_tipo`(`solicitud_conexion`.`id_solicitud_conexion`,'TIERRA') AS `tierra`,`solicitud_esquina`(`solicitud_conexion`.`id_solicitud_conexion`) AS `esquina`,`calculo_total_solicitud`(`solicitud_conexion`.`id_solicitud_conexion`) AS `total`,`numeros_a_letras`(`calculo_total_solicitud`(`solicitud_conexion`.`id_solicitud_conexion`)) AS `total_letra` from (((`solicitud_conexion` join `cliente` on((`solicitud_conexion`.`ci_cliente` = `cliente`.`ci_cliente`))) join `finca` on((`solicitud_conexion`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`)))) */;

/*View structure for view impresion_recibo */

/*!50001 DROP TABLE IF EXISTS `impresion_recibo` */;
/*!50001 DROP VIEW IF EXISTS `impresion_recibo` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `impresion_recibo` AS (select `recibo_cobro`.`nro_recibo` AS `nro_recibo`,`recibo_cobro`.`descripcion` AS `descripcion`,concat(date_format(`cobro`.`fecha`,'%d'),' DE ',convert(`mes_espanhol`(date_format(`cobro`.`fecha`,'%m')) using utf8),' DEL ',date_format(`cobro`.`fecha`,'%Y')) AS `fecha`,format(`cobro`.`monto`,0,'de_DE') AS `monto`,`numeros_a_letras`(`cobro`.`monto`) AS `monto_letra`,`facturacion`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`cobro`.`numero_factura` AS `numero_factura`,`cobro`.`id_factura` AS `id_factura`,`cobro`.`tipo_cobro` AS `tipo_cobro`,format(`calculo_total_a_pagar`(`cobro`.`id_factura`,`cobro`.`numero_factura`),0,'de_DE') AS `total`,format(`calculo_saldo_factura`(`cobro`.`id_factura`,`cobro`.`numero_factura`),0,'de_DE') AS `saldo`,`ver_nro_cheque_cobro`(`cobro`.`id_cobro`) AS `nro_cheque`,`ver_banco_cheque_cobro`(`cobro`.`id_cobro`) AS `banco` from (((`recibo_cobro` join `cobro` on((`recibo_cobro`.`id_cobro` = `cobro`.`id_cobro`))) join `facturacion` on(((`cobro`.`id_factura` = `facturacion`.`id_factura`) and (`cobro`.`numero_factura` = `facturacion`.`numero_factura`)))) join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`)))) */;

/*View structure for view impresion_recibo_cobro */

/*!50001 DROP TABLE IF EXISTS `impresion_recibo_cobro` */;
/*!50001 DROP VIEW IF EXISTS `impresion_recibo_cobro` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `impresion_recibo_cobro` AS (select `recibo_cobro`.`nro_recibo` AS `nro_recibo`,format(`cobro`.`monto`,0,'de_DE') AS `monto`,`cobro`.`numero_factura` AS `numero_factura`,`cobro`.`id_factura` AS `id_factura` from (`recibo_cobro` join `cobro` on((`recibo_cobro`.`id_cobro` = `cobro`.`id_cobro`)))) */;

/*View structure for view informe_facturacion */

/*!50001 DROP TABLE IF EXISTS `informe_facturacion` */;
/*!50001 DROP VIEW IF EXISTS `informe_facturacion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `informe_facturacion` AS (select `facturacion`.`id_factura` AS `id_factura`,`facturacion`.`numero_factura` AS `numero_factura`,`facturacion`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,`facturacion`.`estado` AS `estado`,`ver_notificacion_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'N') AS `notificacion`,`facturacion`.`orden` AS `orden`,format(`lectura_anterior`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `l_anterior`,format(`lectura_medidor`.`lectura`,0,'de_DE') AS `l_actual`,format(`calculo_consumo`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_lts`,`calculo_consumo_precio`(`facturacion_lectura`.`id_lectura`) AS `consumo_gs`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 10),0,'de_DE') AS `iva`,format((`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`) / 50),0,'de_DE') AS `erssan`,format(`ver_deuda_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`),0,'de_DE') AS `deuda`,`ver_redondeo_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'CONSUMO') AS `redondeo`,format(`calculo_total_facturacion`(`facturacion`.`id_factura`,`facturacion`.`numero_factura`,'CONSUMO'),0,'de_DE') AS `total`,`lectura_medidor`.`cta_cte_catastral` AS `cta_cte_catastral`,`barrio`.`nombre_barrio` AS `nombre_barrio`,date_format(`facturacion`.`fecha`,'%m-%Y') AS `fecha_filtro` from (((((((`facturacion` join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`))) join `factura` on((`facturacion`.`id_factura` = `factura`.`id_factura`))) join `facturacion_lectura` on(((`facturacion`.`id_factura` = `facturacion_lectura`.`id_factura`) and (`facturacion`.`numero_factura` = `facturacion_lectura`.`numero_factura`)))) join `lectura_medidor` on((`facturacion_lectura`.`id_lectura` = `lectura_medidor`.`id_lectura`))) join `medidor` on((`lectura_medidor`.`id_medidor` = `medidor`.`id_medidor`))) join `finca` on((`lectura_medidor`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`)))) */;

/*View structure for view para_rango_facturacion */

/*!50001 DROP TABLE IF EXISTS `para_rango_facturacion` */;
/*!50001 DROP VIEW IF EXISTS `para_rango_facturacion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `para_rango_facturacion` AS (select `cab`.`id_factura` AS `id_factura`,`cab`.`numero_factura` AS `numero_factura`,concat(`tal`.`primera_numeracion`,'-',`tal`.`segunda_numeracion`,'-',convert(lpad(`cab`.`numero_factura`,7,'0') using latin1)) AS `num_completo` from (`facturacion` `cab` join `factura` `tal` on((`cab`.`id_factura` = `tal`.`id_factura`)))) */;

/*View structure for view vista_acceso */

/*!50001 DROP TABLE IF EXISTS `vista_acceso` */;
/*!50001 DROP VIEW IF EXISTS `vista_acceso` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_acceso` AS (select `acceso`.`id_acceso` AS `id_acceso`,`acceso`.`ci_personal` AS `ci_personal`,`acceso`.`usuario` AS `usuario`,concat(`personal`.`nombre`,' ',`personal`.`apellido`) AS `personal`,`acceso`.`estado` AS `estado`,`personal`.`id_rol` AS `id_rol`,`acceso`.`pass` AS `pass` from (`acceso` join `personal` on((`acceso`.`ci_personal` = `personal`.`ci_personal`)))) */;

/*View structure for view vista_cobro */

/*!50001 DROP TABLE IF EXISTS `vista_cobro` */;
/*!50001 DROP VIEW IF EXISTS `vista_cobro` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_cobro` AS (select `cobro`.`id_cobro` AS `id_cobro`,date_format(`cobro`.`fecha`,'%d-%m-%Y') AS `fecha`,`cobro`.`fecha` AS `fecha_sin`,concat(`factura`.`primera_numeracion`,'-',`factura`.`segunda_numeracion`,'-',convert(lpad(`facturacion`.`numero_factura`,7,'0') using latin1)) AS `num_completo`,`facturacion`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,format(`cobro`.`monto`,0,'de_DE') AS `monto` from (((`cobro` join `facturacion` on(((`cobro`.`id_factura` = `facturacion`.`id_factura`) and (`cobro`.`numero_factura` = `facturacion`.`numero_factura`)))) join `factura` on((`cobro`.`id_factura` = `factura`.`id_factura`))) join `cliente` on((`facturacion`.`ci_cliente` = `cliente`.`ci_cliente`)))) */;

/*View structure for view vista_compra */

/*!50001 DROP TABLE IF EXISTS `vista_compra` */;
/*!50001 DROP VIEW IF EXISTS `vista_compra` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_compra` AS (select `compra`.`nro_boleta` AS `nro_boleta`,date_format(`compra`.`fecha`,'%d-%m-%Y') AS `fecha`,`compra`.`fecha` AS `fecha_sin`,`pedido`.`ruc` AS `ruc`,`proveedor`.`razon` AS `razon`,`compra`.`estado` AS `estado`,format(`calculo_total_compra`(`compra`.`id_pedido`),0,'de_DE') AS `total`,format(`calculo_saldo_compra`(`compra`.`id_pedido`),0,'de_DE') AS `saldo` from ((`compra` join `pedido` on((`compra`.`id_pedido` = `pedido`.`id_pedido`))) join `proveedor` on((`pedido`.`ruc` = `proveedor`.`ruc`)))) */;

/*View structure for view vista_conexion */

/*!50001 DROP TABLE IF EXISTS `vista_conexion` */;
/*!50001 DROP VIEW IF EXISTS `vista_conexion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_conexion` AS (select `conexion`.`cta_cte_catastral` AS `cta_cte_catastral`,`barrio`.`nombre_barrio` AS `nombre_barrio`,`finca`.`direccion` AS `direccion`,`finca`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`conexion`.`id_medidor` AS `id_medidor`,date_format(`conexion`.`fecha`,'%d-%m-%Y') AS `fecha`,`medidor`.`codigo` AS `codigo`,`modelo_medidor`.`nombre_modelo` AS `nombre_modelo`,`conexion`.`estado` AS `estado`,`conexion`.`lectura_inicial` AS `lectura_inicial`,format(`ultima_lectura`(`conexion`.`cta_cte_catastral`,`conexion`.`id_medidor`),0,'de_DE') AS `l_anterior`,`finca`.`orden` AS `orden` from (((((`conexion` join `finca` on((`conexion`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`))) join `cliente` on((`finca`.`ci_cliente` = `cliente`.`ci_cliente`))) join `medidor` on((`conexion`.`id_medidor` = `medidor`.`id_medidor`))) join `modelo_medidor` on((`medidor`.`id_modelo_medidor` = `modelo_medidor`.`id_modelo_medidor`)))) */;

/*View structure for view vista_finca */

/*!50001 DROP TABLE IF EXISTS `vista_finca` */;
/*!50001 DROP VIEW IF EXISTS `vista_finca` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_finca` AS (select `finca`.`cta_cte_catastral` AS `cta_cte_catastral`,`finca`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`finca`.`direccion` AS `direccion`,`barrio`.`nombre_barrio` AS `nombre_barrio`,`finca`.`id_barrio` AS `id_barrio`,`finca`.`orden` AS `orden` from ((`finca` join `cliente` on((`finca`.`ci_cliente` = `cliente`.`ci_cliente`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`)))) */;

/*View structure for view vista_lectura */

/*!50001 DROP TABLE IF EXISTS `vista_lectura` */;
/*!50001 DROP VIEW IF EXISTS `vista_lectura` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_lectura` AS (select `lectura_medidor`.`id_lectura` AS `id_lectura`,`lectura_medidor`.`estado` AS `estado`,date_format(`lectura_medidor`.`fecha`,'%d-%m-%Y') AS `fecha`,`lectura_medidor`.`cta_cte_catastral` AS `cta_cte_catastral`,`finca`.`direccion` AS `direccion`,`barrio`.`nombre_barrio` AS `nombre_barrio`,`cliente`.`ci_cliente` AS `ci_cliente`,concat(`cliente`.`nombre`,' ',`cliente`.`apellido`) AS `nomape`,`lectura_medidor`.`id_medidor` AS `id_medidor`,format(`lectura_anterior`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `l_anterior`,format(`lectura_medidor`.`lectura`,0,'de_DE') AS `l_actual`,format(`calculo_consumo`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_lts`,format(`calculo_consumo_precio`(`lectura_medidor`.`id_lectura`),0,'de_DE') AS `consumo_gs`,`medidor`.`codigo` AS `codigo`,`finca`.`orden` AS `orden`,date_format(`lectura_medidor`.`fecha`,'%m-%Y') AS `fecha_filtro` from (((((`lectura_medidor` join `conexion` on(((`lectura_medidor`.`cta_cte_catastral` = `conexion`.`cta_cte_catastral`) and (`lectura_medidor`.`id_medidor` = `conexion`.`id_medidor`)))) join `finca` on((`conexion`.`cta_cte_catastral` = `finca`.`cta_cte_catastral`))) join `barrio` on((`finca`.`id_barrio` = `barrio`.`id_barrio`))) join `cliente` on((`finca`.`ci_cliente` = `cliente`.`ci_cliente`))) join `medidor` on((`lectura_medidor`.`id_medidor` = `medidor`.`id_medidor`)))) */;

/*View structure for view vista_medidor */

/*!50001 DROP TABLE IF EXISTS `vista_medidor` */;
/*!50001 DROP VIEW IF EXISTS `vista_medidor` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_medidor` AS (select `medidor`.`id_medidor` AS `id_medidor`,`medidor`.`codigo` AS `codigo`,`medidor`.`id_modelo_medidor` AS `id_modelo_medidor`,`modelo_medidor`.`nombre_modelo` AS `modelo` from (`medidor` join `modelo_medidor` on((`medidor`.`id_modelo_medidor` = `modelo_medidor`.`id_modelo_medidor`)))) */;

/*View structure for view vista_pago */

/*!50001 DROP TABLE IF EXISTS `vista_pago` */;
/*!50001 DROP VIEW IF EXISTS `vista_pago` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pago` AS (select `pago`.`id_pago` AS `id_pago`,date_format(`pago`.`fecha`,'%d-%m-%Y') AS `fecha`,`pago`.`fecha` AS `fecha_sin`,`pago_compra`.`nro_boleta` AS `nro_boleta`,`ver_ruc_pago`(`pago`.`id_pago`) AS `ruc`,`ver_nombre_pago`(`pago`.`id_pago`) AS `razon`,format(`pago`.`monto`,0,'de_DE') AS `monto` from (`pago` join `pago_compra` on((`pago`.`id_pago` = `pago_compra`.`id_pago`)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
