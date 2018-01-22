-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 22, 2018 at 06:52 PM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 5.6.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ventor`
--
CREATE DATABASE IF NOT EXISTS `ventor` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ventor`;

-- --------------------------------------------------------

--
-- Table structure for table `almacen`
--

CREATE TABLE `almacen` (
  `id` bigint(20) NOT NULL,
  `Tipo` tinyint(4) NOT NULL COMMENT '1 Entrada / 2 Salida / 3 Devolucion',
  `Usuario_id` int(11) NOT NULL,
  `Producto_id` int(11) NOT NULL,
  `ProductoNombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `UnidadMedida_id` varchar(10) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Cantidad` decimal(10,2) NOT NULL,
  `Precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Fecha` varchar(10) COLLATE utf16_spanish_ci NOT NULL,
  `Empresa_id` int(11) NOT NULL,
  `Comprobante_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `almacen`
--

INSERT INTO `almacen` (`id`, `Tipo`, `Usuario_id`, `Producto_id`, `ProductoNombre`, `UnidadMedida_id`, `Cantidad`, `Precio`, `Fecha`, `Empresa_id`, `Comprobante_id`) VALUES
(1, 1, 6, 1, '[Renzo] - Billetera', '1', '5.00', '150.00', '2018/01/13', 4, NULL),
(2, 1, 6, 2, '[Rezon Costa] - Cartera', '1', '10.00', '100.00', '2018/01/13', 4, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cliente`
--

CREATE TABLE `cliente` (
  `id` int(11) NOT NULL,
  `Ruc` varchar(11) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Dni` varchar(8) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Nombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `Correo` varchar(50) COLLATE utf16_spanish_ci NOT NULL,
  `Telefono1` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `Telefono2` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `Direccion` text COLLATE utf16_spanish_ci NOT NULL,
  `Empresa_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `cliente`
--

INSERT INTO `cliente` (`id`, `Ruc`, `Dni`, `Nombre`, `Correo`, `Telefono1`, `Telefono2`, `Direccion`, `Empresa_id`) VALUES
(1, '12345678952', '70116577', 'Segundo Mike ', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4),
(2, '11111111111', '10458757', 'Adriano Andre', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4),
(3, '12345678952', '70116577', 'Segundo Mike ', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4),
(4, '11111111111', '10458757', 'Adriano Andre', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4),
(5, '12345678952', '70116577', 'Segundo Mike ', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4),
(6, '11111111111', '10458757', 'Adriano Andre', 'ccarhuas.mike@gmail.com', '412587', '425875', 'Mz G Lote 5 Asc Paraiso florido', 4);

-- --------------------------------------------------------

--
-- Table structure for table `comprobante`
--

CREATE TABLE `comprobante` (
  `id` bigint(20) NOT NULL,
  `Empresa_id` int(11) NOT NULL DEFAULT '0',
  `Serie` varchar(5) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Correlativo` varchar(20) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Cliente_id` int(11) NOT NULL DEFAULT '0',
  `ClienteIdentidad` varchar(11) COLLATE utf16_spanish_ci DEFAULT '',
  `ClienteNombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL DEFAULT '',
  `ClienteDireccion` text COLLATE utf16_spanish_ci,
  `ComprobanteTipo_id` tinyint(4) NOT NULL DEFAULT '0',
  `Estado` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 Pendiente 2 Aprobada 3 Anulada',
  `FechaRegistro` varchar(10) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `FechaEmitido` varchar(10) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `Iva` decimal(10,2) NOT NULL DEFAULT '0.00',
  `IvaTotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `SubTotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `TotalCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Ganancia` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Usuario_id` int(11) NOT NULL DEFAULT '0',
  `Glosa` text COLLATE utf16_spanish_ci,
  `Impresion` tinyint(4) NOT NULL DEFAULT '0',
  `UsuarioImprimiendo_id` int(11) DEFAULT NULL,
  `Devolucion` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 Pendiente 1 Cerrado',
  `ubigeoRecept` varchar(10) COLLATE utf16_spanish_ci DEFAULT NULL,
  `TipoRucRecept` varchar(6) COLLATE utf16_spanish_ci DEFAULT NULL,
  `DirRecepUrbaniza` varchar(25) COLLATE utf16_spanish_ci DEFAULT NULL,
  `DirRecepCodPais` varchar(2) COLLATE utf16_spanish_ci DEFAULT NULL,
  `CodigoAutorizacion` varchar(30) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Sustento` varchar(100) COLLATE utf16_spanish_ci DEFAULT NULL,
  `TipoNotaCredito` varchar(2) COLLATE utf16_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `comprobante`
--

INSERT INTO `comprobante` (`id`, `Empresa_id`, `Serie`, `Correlativo`, `Cliente_id`, `ClienteIdentidad`, `ClienteNombre`, `ClienteDireccion`, `ComprobanteTipo_id`, `Estado`, `FechaRegistro`, `FechaEmitido`, `Iva`, `IvaTotal`, `SubTotal`, `Total`, `TotalCompra`, `Ganancia`, `Usuario_id`, `Glosa`, `Impresion`, `UsuarioImprimiendo_id`, `Devolucion`, `ubigeoRecept`, `TipoRucRecept`, `DirRecepUrbaniza`, `DirRecepCodPais`, `CodigoAutorizacion`, `Sustento`, `TipoNotaCredito`) VALUES
(1, 4, 'S001', '000001', 1, '70116577', 'Segundo Mike', 'Mz G lote 15', 1, 1, '2018-01-01', '2018-01-01', '0.18', '0.18', '100.00', '120.00', '120.00', '20.00', 1, '1', 1, 1, 0, '01|01|01', '1', 'Urb Paraiso Florido', '01', '000111', 'sustento', '00');

-- --------------------------------------------------------

--
-- Table structure for table `comprobantedetalle`
--

CREATE TABLE `comprobantedetalle` (
  `id` bigint(20) NOT NULL,
  `Tipo` tinyint(4) DEFAULT NULL COMMENT '1 Producto / 2 Servicio',
  `Comprobante_Id` bigint(20) NOT NULL DEFAULT '0',
  `Producto_id` int(11) NOT NULL DEFAULT '0',
  `ProductoNombre` varchar(100) COLLATE utf16_spanish_ci DEFAULT NULL,
  `PrecioUnitarioCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PrecioTotalCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `UnidadMedida_id` char(10) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `PrecioUnitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `PrecioTotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Cantidad` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Devuelto` decimal(10,2) DEFAULT '0.00',
  `Ganancia` decimal(10,2) NOT NULL DEFAULT '0.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `comprobantedetalle`
--

INSERT INTO `comprobantedetalle` (`id`, `Tipo`, `Comprobante_Id`, `Producto_id`, `ProductoNombre`, `PrecioUnitarioCompra`, `PrecioTotalCompra`, `UnidadMedida_id`, `PrecioUnitario`, `PrecioTotal`, `Cantidad`, `Devuelto`, `Ganancia`) VALUES
(1, 1, 1, 1, 'Billetera', '50.00', '50.00', '1', '50.00', '50.00', '1.00', '0.00', '20.00'),
(2, 1, 1, 1, 'Cartera', '50.00', '50.00', '1', '50.00', '50.00', '1.00', '0.00', '50.00');

-- --------------------------------------------------------

--
-- Table structure for table `configuracion`
--

CREATE TABLE `configuracion` (
  `Empresa_id` int(11) NOT NULL,
  `RazonSocial` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `Ruc` varchar(11) COLLATE utf16_spanish_ci NOT NULL,
  `Direccion` text COLLATE utf16_spanish_ci,
  `Iva` decimal(4,2) NOT NULL,
  `Moneda_id` varchar(10) COLLATE utf16_spanish_ci NOT NULL,
  `SBoleta` varchar(5) COLLATE utf16_spanish_ci NOT NULL,
  `NBoleta` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `SFactura` varchar(5) COLLATE utf16_spanish_ci NOT NULL,
  `NFactura` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `BoletaFormato` text COLLATE utf16_spanish_ci NOT NULL,
  `FacturaFormato` text COLLATE utf16_spanish_ci NOT NULL,
  `BoletaFoto` varchar(50) COLLATE utf16_spanish_ci DEFAULT NULL,
  `FacturaFoto` varchar(50) COLLATE utf16_spanish_ci DEFAULT NULL,
  `Lineas` tinyint(4) NOT NULL DEFAULT '15',
  `Impresion` tinyint(4) NOT NULL DEFAULT '1',
  `Zeros` tinyint(4) DEFAULT '5',
  `Anio` int(4) DEFAULT '2013',
  `UbigeoEmisor` varchar(10) COLLATE utf16_spanish_ci DEFAULT NULL,
  `TipoRucEmis` varchar(6) COLLATE utf16_spanish_ci DEFAULT NULL,
  `UrbanizaEmis` varchar(25) COLLATE utf16_spanish_ci DEFAULT NULL,
  `PaisEmis` varchar(2) COLLATE utf16_spanish_ci DEFAULT NULL,
  `ComuEmis` varchar(6) COLLATE utf16_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `configuracion`
--

INSERT INTO `configuracion` (`Empresa_id`, `RazonSocial`, `Ruc`, `Direccion`, `Iva`, `Moneda_id`, `SBoleta`, `NBoleta`, `SFactura`, `NFactura`, `BoletaFormato`, `FacturaFormato`, `BoletaFoto`, `FacturaFoto`, `Lineas`, `Impresion`, `Zeros`, `Anio`, `UbigeoEmisor`, `TipoRucEmis`, `UrbanizaEmis`, `PaisEmis`, `ComuEmis`) VALUES
(4, 'Prueba', '12345678978', 'Solo Para Pruebas', '18.00', 'S/.', '002', '14', '002', '2', '#fecha?left: 674px; top: 58px;|#cliente?left: 94px; top: 105px;|#ruc?left: 94px; top: 196px;|#direccion?left: 93px; top: 134px;|#serie?left: 674px; top: 41px;|#SubTotal?left: 708px; top: 413px;|#total?left: 701px; top: 429px;|#TotalLetras?left: 175px; top: 472px;|#IvaTotal?left: 220px; top: 474px;|#Iva?left: 743px; top: 406px;|#detalle?left: 23px; top: 214px;|#detalle .row?width: 74px;!width: 428px;!width: 107px;!width: 110px;', '#fecha?left: 674px; top: 219px;|#cliente?left: 94px; top: 159px;|#ruc?left: 93px; top: 215px;|#direccion?left: 94px; top: 189px;|#serie?left: 650px; top: 110px;|#SubTotal?left: 691px; top: 490px;|#total?left: 686px; top: 533px;|#TotalLetras?left: 72px; top: 481px;|#IvaTotal?left: 695px; top: 512px;|#Iva?left: 602px; top: 511px;|#detalle?left: 2px; top: 250px;|#detalle .row?width: 74px;!width: 428px;!width: 107px;!width: 110px;', '4_boleta.jpg', '4_factura.jpg', 15, 1, 5, 2013, '01|01|01', '1', 'Urb Santa rosa', '01', '010101');

-- --------------------------------------------------------

--
-- Table structure for table `empresa`
--

CREATE TABLE `empresa` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `Estado` tinyint(4) NOT NULL DEFAULT '1',
  `ruc` varchar(11) COLLATE utf16_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `empresa`
--

INSERT INTO `empresa` (`id`, `Nombre`, `Estado`, `ruc`) VALUES
(4, 'DEMO', 1, '12345678978');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `Class` varchar(50) COLLATE utf16_spanish_ci NOT NULL DEFAULT '',
  `Css` varchar(50) COLLATE utf16_spanish_ci NOT NULL DEFAULT '',
  `Nombre` varchar(50) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `Url` varchar(100) COLLATE utf16_spanish_ci NOT NULL DEFAULT '',
  `Padre` int(11) NOT NULL DEFAULT '0',
  `Orden` tinyint(4) DEFAULT '1',
  `Separador` tinyint(4) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`id`, `Class`, `Css`, `Nombre`, `Url`, `Padre`, `Orden`, `Separador`) VALUES
(1, 'inicio', 'glyphicon-home', 'Inicio', '', 0, 1, 0),
(2, 'ventas', 'glyphicon-credit-card', 'Ventas', '#', 0, 2, 0),
(3, 'mantenimiento', 'glyphicon-cog', 'Mantenimiento', '#', 0, 4, 0),
(4, '', '', 'Comprobantes', 'ventas/comprobantes', 2, 1, 0),
(5, '', '', 'Reportes', 'ventas/reportes', 2, 2, 1),
(6, '', '', 'Usuarios', 'mantenimiento/usuarios', 3, 1, 0),
(7, '', '', 'Clientes', 'mantenimiento/clientes', 3, 2, 0),
(8, '', '', 'Productos', 'mantenimiento/productos', 3, 3, 0),
(9, '', '', 'Servicios', 'mantenimiento/servicios', 3, 4, 0),
(10, '', '', 'Configuración', 'mantenimiento/configuracion', 3, 6, 1),
(11, '', '', 'Copia De Seguridad', 'respaldo/index', 3, 5, 1),
(12, 'almacen', 'glyphicon-th', 'Almacen', '#', 0, 3, 0),
(13, '', '', 'Entrada/Salida', 'almacen/index', 12, 1, 0),
(14, '', '', 'Kardex', 'almacen/kardex', 12, 2, 1),
(16, '', '', 'Admin', 'mantenimiento/administrador', 3, 7, 0);

-- --------------------------------------------------------

--
-- Table structure for table `menusuario`
--

CREATE TABLE `menusuario` (
  `UsuarioTipo_id` int(11) NOT NULL,
  `Menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `menusuario`
--

INSERT INTO `menusuario` (`UsuarioTipo_id`, `Menu_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 7),
(2, 8),
(2, 9),
(2, 12),
(2, 13),
(4, 1),
(4, 3),
(4, 8),
(4, 9),
(4, 12),
(4, 13),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 7),
(5, 8),
(5, 9),
(5, 12),
(5, 13),
(5, 14);

-- --------------------------------------------------------

--
-- Table structure for table `planilla`
--

CREATE TABLE `planilla` (
  `Id` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `planilla`
--

INSERT INTO `planilla` (`Id`, `Nombre`, `Value`) VALUES
(1, 'Planilla 1', 1),
(2, 'Planilla 2', 2);

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `UnidadMedida_id` char(5) COLLATE utf16_spanish_ci NOT NULL,
  `PrecioCompra` decimal(10,2) NOT NULL,
  `Precio` decimal(10,2) NOT NULL,
  `Stock` decimal(10,2) NOT NULL DEFAULT '0.00',
  `StockMinimo` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Marca` varchar(50) COLLATE utf16_spanish_ci NOT NULL,
  `Empresa_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 CHECKSUM=1 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id`, `Nombre`, `UnidadMedida_id`, `PrecioCompra`, `Precio`, `Stock`, `StockMinimo`, `Marca`, `Empresa_id`) VALUES
(1, 'Billetera', '1', '150.00', '250.00', '25.00', '0.00', 'Renzo', 4),
(2, 'Cartera', '1', '100.00', '150.00', '45.00', '0.00', 'Rezon Costa', 4),
(3, 'Bolsa', '1', '50.00', '100.00', '15.00', '0.00', 'Renzo Costa', 4);

-- --------------------------------------------------------

--
-- Table structure for table `servicio`
--

CREATE TABLE `servicio` (
  `id` int(11) NOT NULL,
  `Nombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `PrecioCompra` decimal(10,2) NOT NULL DEFAULT '0.00',
  `Precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `UnidadMedida_id` char(5) COLLATE utf16_spanish_ci NOT NULL DEFAULT 'UND',
  `Empresa_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tabladato`
--

CREATE TABLE `tabladato` (
  `id` int(11) NOT NULL,
  `Relacion` varchar(20) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `Value` varchar(10) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `Nombre` varchar(50) COLLATE utf16_spanish_ci NOT NULL DEFAULT '0',
  `Orden` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `tabladato`
--

INSERT INTO `tabladato` (`id`, `Relacion`, `Value`, `Nombre`, `Orden`) VALUES
(1, 'comprobantetipo', '1', 'Proforma', 1),
(2, 'comprobantetipo', '2', 'Boleta', 2),
(3, 'comprobantetipo', '3', 'Factura', 3),
(5, 'comprobanteestado', '2', 'Aprobado', 1),
(6, 'comprobanteestado', '3', 'Anulado', 2),
(7, 'comprobantetipo', '4', 'Menudeo', 3),
(8, 'moneda', 'S/.', 'Nuevo Soles', 1),
(9, 'comprobanteestado', '1', 'Pendiente', 1),
(10, 'comprobanteestado', '4', 'Revisión', 2),
(11, 'usuariotipo', '1', 'Administrador', 1),
(12, 'usuariotipo', '2', 'Vendedor', 3),
(13, 'usuariotipo', '3', 'Suspendido', 5),
(14, 'estilo', 'light', 'Light Theme', 0),
(15, 'estilo', 'dark', 'Dark Theme', 0),
(16, 'almacentipo', '1', 'Entrada', 0),
(17, 'almacentipo', '2', 'Salida', 0),
(18, 'almacentipo', '3', 'Devolución', 0),
(19, 'usuariotipo', '4', 'Almacenero', 4),
(20, 'usuariotipo', '5', 'Super Usuario', 2);

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `Tipo` int(11) NOT NULL DEFAULT '2' COMMENT '1 Administrador 2 Vendedor 3 Suspendido',
  `Nombre` varchar(100) COLLATE utf16_spanish_ci NOT NULL,
  `Usuario` varchar(20) COLLATE utf16_spanish_ci NOT NULL,
  `Contrasena` varchar(32) COLLATE utf16_spanish_ci NOT NULL,
  `Empresa_id` int(11) NOT NULL,
  `ruc` varchar(11) COLLATE utf16_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_spanish_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`id`, `Tipo`, `Nombre`, `Usuario`, `Contrasena`, `Empresa_id`, `ruc`) VALUES
(6, 1, 'Administrador', 'demo', 'e10adc3949ba59abbe56e057f20f883e', 4, '12345678978'),
(10, 5, 'Super Usuario', 'super', 'e10adc3949ba59abbe56e057f20f883e', 4, '12345678978'),
(11, 2, 'Vendedor', 'vendedor', 'e10adc3949ba59abbe56e057f20f883e', 4, ''),
(12, 4, 'Almacenero', 'almacen', 'e10adc3949ba59abbe56e057f20f883e', 4, ''),
(13, 3, 'Suspendido', 'Suspendido', 'e10adc3949ba59abbe56e057f20f883e', 4, ''),
(14, 1, 'Mikeeeee', 'Demo', 'e10adc3949ba59abbe56e057f20f883e', 4, ''),
(15, 1, 'Administrador', 'Eduar', 'sdadasdasdasdasdasda', 4, ''),
(16, 1, 'Administrador', 'Eduar', 'sdadasdasdasdasdasda', 4, '12345678');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`id`),
  ADD KEY `almacen_producto` (`Producto_id`);

--
-- Indexes for table `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comprobante`
--
ALTER TABLE `comprobante`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Serie_Correlativo_Empresa_id` (`Serie`,`Correlativo`,`Empresa_id`);

--
-- Indexes for table `comprobantedetalle`
--
ALTER TABLE `comprobantedetalle`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`Empresa_id`);

--
-- Indexes for table `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `menusuario`
--
ALTER TABLE `menusuario`
  ADD PRIMARY KEY (`UsuarioTipo_id`,`Menu_id`);

--
-- Indexes for table `planilla`
--
ALTER TABLE `planilla`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `servicio`
--
ALTER TABLE `servicio`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tabladato`
--
ALTER TABLE `tabladato`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `almacen`
--
ALTER TABLE `almacen`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `cliente`
--
ALTER TABLE `cliente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `comprobante`
--
ALTER TABLE `comprobante`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `comprobantedetalle`
--
ALTER TABLE `comprobantedetalle`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `empresa`
--
ALTER TABLE `empresa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `planilla`
--
ALTER TABLE `planilla`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `servicio`
--
ALTER TABLE `servicio`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tabladato`
--
ALTER TABLE `tabladato`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
