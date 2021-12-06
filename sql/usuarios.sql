SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

INSERT INTO `usuarios` VALUES ('1', 'Usuario Uno', 'usuario_uno', 'usuario_uno@hotmail.com');
INSERT INTO `usuarios` VALUES ('2', 'Usuario Dos', 'usuario_dos', 'usuario_dos@hotmail.com');
INSERT INTO `usuarios` VALUES ('3', 'Usuario Tres', 'usuario_tres', 'usuario_tres@hotmail.com');
INSERT INTO `usuarios` VALUES ('4', 'Usuario Cuatro', 'usuario_cuatro', 'usuario_cuatro@hotmail.com');
INSERT INTO `usuarios` VALUES ('5', 'Usuario Cinco', 'usuario_cinco', 'usuario_cinco@hotmail.com');
