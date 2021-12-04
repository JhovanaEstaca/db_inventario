/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100418
 Source Host           : localhost:3306
 Source Schema         : inventario_electronico

 Target Server Type    : MySQL
 Target Server Version : 100418
 File Encoding         : 65001

 Date: 02/12/2021 21:25:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for almacen
-- ----------------------------
DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `coordenada` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `id_productos` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_prodc`(`id_productos`) USING BTREE,
  CONSTRAINT `fk_prodc` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of almacen
-- ----------------------------
INSERT INTO `almacen` VALUES (1, 'caja color rojo', 'fila: 3, columa 5', 6);
INSERT INTO `almacen` VALUES (9, 'caja color guindo', 'fila: 2, columa 13', 9);

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `CI` varchar(10) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 229 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES (1, 'LUNA', '8010025', 'lu@gmail.com', '60542175');
INSERT INTO `cliente` VALUES (2, 'Javier', '1215744', 'javi@gmail.com', '70006128');
INSERT INTO `cliente` VALUES (3, 'juancito', '10067099', 'juan@gmail.com', '60595932');
INSERT INTO `cliente` VALUES (4, 'ricardos', '8794578', 'riky@gmail.com', '77954684');
INSERT INTO `cliente` VALUES (227, 'PERICLES', '342423', 'asda@gmail.com', '67317215');
INSERT INTO `cliente` VALUES (228, 'jose paredez', '1231223', 'jop@gmail.com', '60598475');

-- ----------------------------
-- Table structure for entrada
-- ----------------------------
DROP TABLE IF EXISTS `entrada`;
CREATE TABLE `entrada`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(20) NOT NULL,
  `id_proveedor` int(11) NOT NULL,
  `id_productos` int(11) NOT NULL,
  `fecha` varchar(20) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Fk_compo`(`id_proveedor`) USING BTREE,
  INDEX `Fk_producto`(`id_productos`) USING BTREE,
  CONSTRAINT `Fk_prodd` FOREIGN KEY (`id_productos`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Fk_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of entrada
-- ----------------------------
INSERT INTO `entrada` VALUES (5, 50, 3, 6, '30/11/2021');
INSERT INTO `entrada` VALUES (8, 15, 3, 6, '2021-11-30');
INSERT INTO `entrada` VALUES (9, 13, 1, 6, '2021-11-25');
INSERT INTO `entrada` VALUES (20, 1, 1, 6, '2021-12-01');
INSERT INTO `entrada` VALUES (34, 66, 3, 13, '2021-11-06');
INSERT INTO `entrada` VALUES (35, 50, 3, 11, '2021-12-24');
INSERT INTO `entrada` VALUES (36, 25, 2, 11, '2021-12-24');
INSERT INTO `entrada` VALUES (37, 15, 2, 11, '2021-12-03');
INSERT INTO `entrada` VALUES (38, 20, 1, 13, '2021-12-30');
INSERT INTO `entrada` VALUES (39, 50, 2, 13, '2021-12-02');
INSERT INTO `entrada` VALUES (41, 4, 3, 9, '2021-12-02');

-- ----------------------------
-- Table structure for productos
-- ----------------------------
DROP TABLE IF EXISTS `productos`;
CREATE TABLE `productos`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_producto` varchar(50) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `descripcion` varchar(100) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `entrada_inicial` int(30) NOT NULL,
  `stock` int(30) NOT NULL,
  `precio` decimal(30, 0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of productos
-- ----------------------------
INSERT INTO `productos` VALUES (5, 'resistencias', 'resistencias de 200 ohm', 20, 20, 1);
INSERT INTO `productos` VALUES (6, 'integrados', 'integrados 779 ', 100, 169, 5);
INSERT INTO `productos` VALUES (9, 'yanpers', 'conectores con punta metalica', 10000, 9954, 1);
INSERT INTO `productos` VALUES (11, 'DiodoLet', 'Diodos o led focos color rojo', 320, 410, 2);
INSERT INTO `productos` VALUES (12, 'Interruptor', 'Automatico', 600, 600, 3);
INSERT INTO `productos` VALUES (13, 'Capacitor', 'fijos', 200, 336, 4);

-- ----------------------------
-- Table structure for proveedor
-- ----------------------------
DROP TABLE IF EXISTS `proveedor`;
CREATE TABLE `proveedor`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `CI` varchar(10) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `telefono` varchar(20) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of proveedor
-- ----------------------------
INSERT INTO `proveedor` VALUES (1, 'ivaan', '4582145', 'iva@gmail.com', '78985456');
INSERT INTO `proveedor` VALUES (2, 'iann', '10012451', 'ian@gmail.com', '60598475');
INSERT INTO `proveedor` VALUES (3, 'Rudi', '200154', 'rudi@gmail.com', '70159845');
INSERT INTO `proveedor` VALUES (5, 'Econ', '342342', 'econ@gmail.com', '69548154');

-- ----------------------------
-- Table structure for salida
-- ----------------------------
DROP TABLE IF EXISTS `salida`;
CREATE TABLE `salida`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cantidad` int(15) NOT NULL,
  `fecha` varchar(20) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `Fk_cliente`(`id_cliente`) USING BTREE,
  INDEX `fk_producto`(`id_producto`) USING BTREE,
  CONSTRAINT `Fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_producto` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of salida
-- ----------------------------
INSERT INTO `salida` VALUES (1, 5, '2021-12-02', 9, 2);
INSERT INTO `salida` VALUES (2, 5, '2021-12-02', 9, 227);
INSERT INTO `salida` VALUES (4, 10, '2021-12-02', 9, 3);
INSERT INTO `salida` VALUES (5, 30, '2021-12-02', 9, 1);
INSERT INTO `salida` VALUES (7, 10, '2021-12-02', 6, 4);

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `privilegio` varchar(200) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `contraseña` varchar(200) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  `correo` varchar(30) CHARACTER SET cp1250 COLLATE cp1250_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = cp1250 COLLATE = cp1250_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES (8, 'administrador', '123', 'admin@gmail.com');
INSERT INTO `usuarios` VALUES (9, 'usuario', '1234', 'usuario@gmail.com');
INSERT INTO `usuarios` VALUES (10, 'usuario', '12345', 'usuario1@gmail.com');
INSERT INTO `usuarios` VALUES (13, 'administrador', '12345', 'daniela@gmail.com');
INSERT INTO `usuarios` VALUES (14, 'administrador', '1234', 'juanito@GMAIL.COM');

SET FOREIGN_KEY_CHECKS = 1;
