CREATE DATABASE evidencedb;

USE evidencedb;

-- Evidences and users

CREATE TABLE evidence (
	id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(100) NOT NULL,
	description VARCHAR(200) NOT NULL,
	dir VARCHAR(200) NOT NULL,
	tipe VARCHAR(30) NOT NULL,
	lat INT NOT NULL,
	lon INT NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id)
);

CREATE TABLE user (
	id INT NOT NULL AUTO_INCREMENT,
	user VARCHAR(30) NOT NULL,
	password VARCHAR(30) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE role (
	id INT NOT NULL AUTO_INCREMENT,
	role ENUM('checker', 'validator', 'administrator') NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE evidenceStateChanges (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	user_id INT NOT NULL,
	description VARCHAR(200) NOT NULL,
	state ENUM('unverified', 'verified', 'validated') NOT NULL,
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (user_id) REFERENCES user(id)
);

CREATE TABLE userRole (
	id INT NOT NULL AUTO_INCREMENT,
	user_id INT NOT NULL,
	role_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (user_id) REFERENCES user(id),
	FOREIGN KEY (role_id) REFERENCES role(id)
);

CREATE TABLE author (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	PRIMARY KEY (id)
);

CREATE TABLE evidenceAuthor (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	author_id INT NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (author_id) REFERENCES author(id)
);

-- Condiciones

CREATE TABLE tblcapitulo (
  id varchar(10) NOT NULL,
  condicion varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblparagrafo (
  id varchar(10) NOT NULL,
  descripcion varchar(4000) NOT NULL,
  fkidarticulo varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblseccion (
  id varchar(10) NOT NULL,
  titulo varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblarticulo (
  id varchar(10) NOT NULL,
  nombre varchar(1000) NOT NULL,
  descripcion varchar(4000) NOT NULL,
  fkidtitulo varchar(10) NOT NULL,
  fkidcapitulo varchar(10) NOT NULL,
  fkidseccion varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblliteral (
  id varchar(10) NOT NULL,
  descripcion varchar(1000) NOT NULL,
  fkidarticulo varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblnumeral (
  id varchar(10) NOT NULL,
  descripcion varchar(1000) NOT NULL,
  fkidliteral varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblsubnumeral (
  id varchar(10) NOT NULL,
  descripcion varchar(1000) NOT NULL,
  fkidnumeral varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblsub_subnumeral (
  id varchar(10) NOT NULL,
  descripcion varchar(1000) NOT NULL,
  fkidsubnumeral varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tbltipoevidencia (
  id int(11) NOT NULL,
  nombre varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tbltitulo (
  id varchar(10) NOT NULL,
  nombre varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE tblestado (
  id varchar(1) NOT NULL,
  nombre varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcado de datos para las tablas

INSERT INTO `tblcapitulo` (`id`, `condicion`) VALUES
('0', 'NA'),
('1', 'MECANISMOS DE SELECCI??N Y EVALUACI??N DE ESTUDIANTES Y PROFESORES'),
('2', 'ESTRUCTURA ADMINISTRATIVA Y ACAD??MICA'),
('3', 'CULTURA DE LA AUTOEVALUACI??N'),
('4', 'PROGRAMA DE EGRESADOS'),
('5', 'MODELO DE BIENESTAR'),
('6', 'RECURSOS SUFICIENTES PARA GARANTIZAR EL CUMPLIMIENTO DE LAS METAS');

INSERT INTO `tblparagrafo` (`id`, `descripcion`, `fkidarticulo`) VALUES
('110', 'La instituci??n deber?? establecer procesos y medios orientados a la mejora del desempe??o acad??mico y la formaci??n integral del estudiante, que le permita el tr??nsito de la educaci??n secundaria o media a la educaci??n superior, tomando como insumo la informaci??n cualitativa y cuantitativa de los estudiantes.', '10'),
('111', 'La instituci??n deber?? contar con mecanismos que permitan verificar y asegurar que la identidad de quien cursa el programa corresponda a la del estudiante matriculado.', '11'),
('113', 'Las evidencias indicadas en los literales c), e), f), 9), h), y j) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un programa al momento de comenzar la etapa de Pre radicaci??n de solicitud de registro calificado.', '13'),
('117', 'Cuando la modalidad del programa implique el desarrollo de actividades acad??micas, formativas y docentes a cargo de empresas, entidades, organizaciones u otros entes que se vinculan al proceso formativo, la instituci??n eber?? especificar la forma de seguimiento y evaluaci??n de sus actividades.', '17'),
('118', 'Las evidencias indicadas en los literales d), g), i), m) y o) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un un programa acad??mico al momento de iniciar la etapa de Pre radicaci??n de solicitud de registro calificado.', '18'),
('12', 'Para todos los efectos de la presente resoluci??n, se entiende por ???instituci??n??? o ???instituciones???, las instituciones de educaci??n superior y aquellas habilitadas por la ley para la oferta y desarrollo de programas acad??micos de educaci??n superior. ', '2'),
('124', 'Para la definici??n de la relaci??n entre las horas de interacci??n con el profesor y las horas de trabajo independiente, la instituci??n deber?? considerar los niveles de formaci??n, las modalidades de ofrecimiento y las semanas con las que cuentan los periodos acad??micos con el fin de establecer la equivalencia y cumplir las 48 horas establecidas en el art??culo 2.5.3.2.4.1 del Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019.', '24'),
('127', 'La instituci??n deber?? contar con las medidas de seguridad electr??nica para la protecci??n de datos y todo lo que se necesite para evitar su adulteraci??n, p??rdida, consulta, uso o acceso no autorizado o fraudulento. ', '27'),
('128', 'Cuando la instituci??n cuente con m??s de un lugar de desarrollo, modalidad y/o niveles de formaci??n, los procesos, la estructura organizacional y los cargos deber??n ser coherentes con ello.', '28'),
('129', 'Las evidencias indicadas de los numerales 2 al 4 del literal b) y el numeral 4 del literal c) del presente art??culo, solo deber??n ser presentadas por las  instituciones que est??n ofreciendo al menos un programa acad??mico al momento de iniciar la etapa de Pre radicaci??n de solicitud de registro calificado. ', '29'),
('132', 'Las evidencias indicadas en el numeral 2 del literal a) y en los numerales 6, 7 y 9 al 12 dol literal b) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un programa acad??mico al momento de iniciar la etapa de Pre radicaci??n de solicitud de registro calificado.', '32'),
('136', 'Las evidencias indicadas en los literales b) y e) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un programa al momento de comenzar la etapa de Pre radicaci??n de solicitud de registro calificado.', '36'),
('137', 'En el caso de que la instituci??n ofrezca programas en modalidades a  distancia, virtual y las posibles combinaciones de estas, deber?? contar con apoyos tecnol??gicos y acompa??amientos disponibles de manera ininterrumpida, para abordar las preguntas y los problemas de car??cter t??cnico de los estudiantes.', '37'),
('139', 'Las evidencias indicadas en los numerales 3, 5 y 7 del literal a) y los numerales 1 al 3 del literal b) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un programa acad??mico al momento de iniciar la etapa de Pre radicaci??n de solicitud de registro calificado.', '39'),
('147', 'Las evidencias indicadas en el numeral 4 del literal b), numerales 4 y 7 del literal c) y  numerales 3, 5 y 7 del literal d) del presente art??culo solo deber??n ser presentadas por las instituciones que est??n ofreciendo al menos un programa acad??mico al momento de iniciar la etapa de Pre radicaci??n de solicitud de registro calificado.', '47'),
('149', 'Respecto al reglamento estudiantil o su equivalente y las pol??ticas para mejorar el bienestar, la permanencia y graduaci??n de los estudiantes, la instituci??n solo deber?? presentar los respectivos documentos en caso de que hayan sido modificados durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que estos documentos no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '49'),
('150', 'Respecto al reglamento profesoral o su equivalente y los dem??s documentos debidamente aprobados por las autoridades o instancias competentes, la instituci??n solo deber?? presentarlos en caso de que hayan sido modificados durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que los documentos no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '50'),
('151', 'Respecto al proyecto educativo institucional, o el que haga sus veces, y el modelo de gobierno institucional, la instituci??n solo deber?? presentados en caso de que hayan sido modificados durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que los documentos no hayan tenido modificaciones la instituci??n deber?? argumentar las razones de ello.', '51'),
('152', 'Respecto a las pol??ticas que promuevan procesos de autoevaluaci??n, autorregulaci??n y mejoramiento, la instituci??n solo deber?? presentarlas en caso de que hayan sido modificadas durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que las pol??ticas no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello. ', '52'),
('153', 'Respecto a las pol??ticas que promuevan el seguimiento a la actividad profesional de los egresados, la instituci??n solo deber?? presentarlas en caso de que hayan sido modificadas durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que las politicas no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '53'),
('154', 'Respecto a la pol??tica de bienestar para la comunidad institucional, solo deber?? ser presentada en caso de que haya sido modificada durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que la pol??tica no haya tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '54'),
('155', 'Respecto a la misi??n, los prop??sitos y objetivos institucionales solo deber??n ser presentados en caso de que hayan sido modificados durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que estos no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '55'),
('156', 'Respecto a las pol??ticas de gesti??n y evaluaci??n del talento humano, la instituci??n solo deber?? presentarlas en caso de que hayan sido modificadas durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que las pol??ticas no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '56'),
('157', 'Respecto a las pol??ticas de mantenimiento, renovaci??n y actualizaci??n de la infraestructura, la instituci??n solo deber?? presentarlas en caso de que hayan sido modificadas durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que las pol??ticas no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '57'),
('158', 'Respecto a las pol??ticas para la obtenci??n, planificaci??n, gesti??n y control de los recursos financieros, y las pol??ticas para la formulaci??n, ejecuci??n, seguimiento y control de presupuestos anuales, la instituci??n solo deber?? presentarlas en caso de que hayan sido modificadas durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que las pol??ticas no hayan tenido modificaciones, la Instituci??n deber?? argumentar las razones de ello.', '58'),
('18', 'Cuando la instituci??n desarrolle actividades con entidades, empresas, organizaciones u otros entes que participen en el plan de estudios o faciliten espacios de pr??ctica requeridos en el mismo, el reglamento deber?? definir las pol??ticas y criterios de admisi??n, permanencia y evaluaci??n, teniendo en consideraci??n dicho asocio y de acuerdo con los resultados de aprendizaje esperados.', '8'),
('237', 'En el caso en que se desarrolle oferta acad??mica en la modalidad dual o que los programas contengan actividades como pr??cticas acad??micas o pasant??as en lugares diferentes a la instituci??n, se deber??n contemplar estrategias para que los estudiantes tengan acceso a los servicios de bienestar en la instituci??n y en las empresas, organizaciones u otros entes que hagan parte del proceso formativo.', '37'),
('251', 'Respecto a los documentos que den cuenta acerca de las pol??ticas acad??micas asociadas a curr??culo; los resultados de aprendizaje; los cr??ditos y actividades  acad??micas; las pol??ticas de gesti??n institucional y bienestar, y las pol??ticas de investigaci??n, innovaci??n, creaci??n art??stica y cultural, la instituci??n solo deber?? presentarlos en caso de que hayan sido modificados durante la vigencia de las condiciones institucionales adjuntando la debida justificaci??n. En caso de que los documentos no hayan tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '51'),
('252', 'Respecto a la descripci??n general del sistema interno de aseguramiento de la calidad, la instituci??n solo deber?? presentarla en caso de que haya sido modificada durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que la descripci??n no haya tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '52'),
('351', 'Respecto del marco normativo institucional para la gesti??n de la informaci??n y  las comunicaciones internas, la instituci??n solo deber?? presentarlo en caso de que haya sido modificado durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que el marco normativo no haya tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '51'),
('451', 'Respecto a la estructura organizacional aprobada, la instituci??n solo deber?? presentarla en caso de que haya sido modificada durante la vigencia de las condiciones institucionales, adjuntando la debida justificaci??n. En caso de que la estructura no haya tenido modificaciones, la instituci??n deber?? argumentar las razones de ello.', '51');

INSERT INTO `tblseccion` (`id`, `titulo`) VALUES
('0', 'NA'),
('1', 'MECANISMOS DE SELECCI??N Y EVALUACI??N DE ESTUDIANTES'),
('2', 'MECANISMOS DE SELECCI??N Y EVALUACI??N DE PROFESORES');

INSERT INTO `tblarticulo` (`id`, `nombre`, `descripcion`, `fkidtitulo`, `fkidcapitulo`, `fkidseccion`) VALUES
('1', 'Objeto', 'La presente resoluci??n tiene como objeto establecer los par??metros de autoevaluaci??n, verificaci??n y evaluaci??n de cada Una de las condiciones institucionales definidas en el Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019, las cuales deben ser demostradas integralmente en el marco de los procesos de solicitud y renovaci??n del registro calificado de programas \r\nacad??micos de educaci??n superior.', '1', '0', '0'),
('10', 'Informaci??n cualitativa y cuantitativa para mejorar el bienestar, la permanencia y graduaci??n de los estudiantes.', 'La instituci??n deber?? conocer de los estudiantes que son admitidos el rendimiento acad??mico, el desempe??o en el Examen de Estado de la Educaci??n Media, ICFES - SABER 11???, aspectos socioecon??micos y dem??s aspectos culturales que puedan incidir en el mejoramiento del bienestar, en el acompa??amiento del proceso formativo, en la permanencia y en la graduaci??n oportuna.', '2', '1', '1'),
('11', 'Evaluaci??n, seguimiento y retroalimentaci??n de los estudiantes', 'La instituci??n deber?? contar con pol??ticas para la evaluaci??n, el seguimiento y la retroalimentaci??n a los estudiantes, en coherencia con el proceso formativo, los niveles y las modalidades en los que se ofrecen los programas acad??micos. Esto implica que las unidades acad??micas, o lo que haga sus veces, al igual que las empresas, entidades, organizaciones y dem??s entes que est??n involucrados en las actividades acad??micas y en el proceso formativo, adopten dichas pol??ticas y sean responsables de la evaluaci??n, seguimiento y retroalimentaci??n de los estudiantes.', '2', '1', '1'),
('12', 'Comunicaci??n con estudiantes.', 'La instituci??n deber?? demostrar la existencia de medios de comunicaci??n de f??cil acceso a los estudiantes, en los cuales est?? disponible la informaci??n necesaria para desarrollar las actividades acad??micas del proceso formativo. Adem??s, deber?? garantizar que la informaci??n que se le brinde a quien aspira a ser admitido en la instituci??n sea clara y contenga, por lo menos: ', '2', '1', '1'),
('13', 'Evidencias e indicadores de los mecanismos que soportan la selecci??n y evaluaci??n de estudiantes.', 'Teniendo en cuenta los art??culos precedentes de esta secci??n, la instituci??n deber?? presentar para el proceso formativo, por lo menos: ', '2', '1', '1'),
('14', 'Mecanismos que soportan la selecci??n y evaluaci??n de profesores.', 'La instituci??n deber?? proporcionar los criterios y argumentos que indiquen la forma en que los mecanismos de selecci??n y evaluaci??n de profesores son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional. Dichos mecanismos deber??n estar incorporados en la normativa institucional  vigente en el momento en que la instituci??n inicie la etapa de Pre radicaci??n de solicitud de registro calificado y deber??n estar aprobados por las instancias del  gobiemo institucional correspondientes. ', '2', '1', '2'),
('15', 'Caracter??sticas del grupo institucional de profesores.', 'La instituci??n \r\ndeber?? describir el grupo de profesores con el que cuenta, grupo que, por su dedicaci??n, vinculaci??n y disponibilidad, deber?? cubrir, de manera consistente y arm??nica con su naturaleza jur??dica, tipolog??a, identidad y misi??n institucional, todas las labores acad??micas, formativas, docentes, cientificas, culturales y de extensi??n que desarrolle la instituci??n,definidas en su proyecto educativo institucional, O lo que haga sus veces. Dicha descripci??n deber?? incluir, por lo menos: ', '2', '1', '2'),
('16', 'Reglamento profesoral o su equivalente.', 'El reglamento profesoral o su equivalente y los dem??s documentos debidamente aprobados por las autoridades o instancias competentes de la instituci??n deber??n considerar los niveles de formaci??n, las modalidades y los lugares diferentes a la instituci??n donde se realicen las actividades propias del desarrollo como profesor. En coherencia y consistencia con la naturaleza jur??dica, tipolog??a, identidad y misi??n, el reglamento deber?? ser claro y expreso, y contemplar por lo menos:', '2', '1', '2'),
('17', 'Mecanismos para la implementaci??n de los planes institucionales \r\ny el desarrollo de actividades acad??micas.', 'La instituci??n deber?? contar, por lo menos, con los siguientes mecanismos que faciliten la implementaci??n de los planes institucionales y el desarrollo de las actividades acad??micas: ', '2', '1', '2'),
('18', 'Evidencias e indicadores de los mecanismos que soportan la selecci??n y evaluaci??n de profesores.', 'Teniendo en cuenta los art??culos precedentes de esta secci??n, la instituci??n deber?? presentar, por lo menos: ', '2', '1', '2'),
('19', 'Gobierno institucional y rendici??n de cuentas.', 'La instituci??n deber?? proporcionar los criterios y argumentos que indican la forma en que el gobierno institucional y la rendici??n de cuentas son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional. Dichos mecanismos deber??n estar incorporados en la normativa institucional vigente al momento en que la instituci??n inicie la etapa de Pre radicaci??n y deber??n estar aprobados por las instancias de gobiemo correspondientes.', '2', '2', '0'),
('2', '??mbito de aplicaci??n', 'La presente resoluci??n aplica al Ministerio de Educaci??n Nacional, a la Comisi??n Nacional Intersectorial de Aseguramiento de la Calidad de la Educaci??n Superior - Conaces, a los pares acad??micos que participan en los procesos de registro calificado, a las instituciones de educaci??n superior y aquellas habilitadas por la ley para ofrecer y desarrollar programas acad??micos de educaci??n superior.', '1', '0', '0'),
('20', 'Gobierno institucional.', 'La instituci??n deber?? establecer y demostrar la existencia de un gobierno institucional atendiendo su naturaleza jur??dica, identidad, tipolog??a y misi??n. Para ello, la instituci??n deber??, por lo menos: ', '2', '2', '0'),
('21', 'Rendici??n de cuentas institucional.', 'La instituci??n deber?? establecer sus mecanismos de rendici??n de cuentas atendiendo su naturaleza jur??dica, identidad, tipolog??a y misi??n. Para ello, deber?? indicar, a qui??nes rendir?? cuentas sobre el desempe??o institucional, la periodicidad y los medios de difusi??n a utilizar, entre otros aspectos, teniendo en cuenta lo previsto en el Acuerdo 02 de 2017 del Consejo Nacional de Educaci??n Superior - CESU.', '2', '2', '0'),
('22', 'Participaci??n de la comunidad acad??mica en procesos de toma de decisiones. ', 'Desde su autonom??a y modelo de gobierno, y en coherencia con la naturaleza jur??dica, tipolog??a, identidad, misi??n, estatutos y dem??s reglamentos, la instituci??n deber?? demostrar los espacios de participaci??n de la comunidad acad??mica en los procesos de toma de decisiones. ', '2', '2', '0'),
('23', 'Pol??ticas institucionales.', 'Hace referencia al marco normativo complementario a los estatutos. La instituci??n deber?? exponer las instancias competentes y los procedimientos institucionales que se deben adelantar para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos intemos, as?? como el seguimiento a su cumplimiento y los medios dispuestos para que la comunidad acad??mica tenga claridad de dichas instancias y procedimientos.', '2', '2', '0'),
('24', 'Pol??ticas acad??micas asociadas a curr??culo, resultados de aprendizaje, cr??ditos y actividades.', 'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la instituci??n, y en coherencia con su naturaleza jur??dica, identidad, tipolog??a y misi??n, las pol??ticas acad??micas deber??n, por lo menos: ', '2', '2', '0'),
('25', 'Pol??ticas de gesti??n institucional y bienestar.', 'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la instituci??n, en coherencia con su naturaleza jur??dica, identidad, tipolog??a y misi??n, las pol??ticas de gesti??n institucional y bienestar deber??n, orientar como m??nimo los siguientes aspectos: ', '2', '2', '0'),
('26', 'Pol??ticas de investigaci??n, innovaci??n, creaci??n art??stica y cultural.', 'Teniendo en cuenta los distintos niveles formativos y modalidades ofrecidas por la instituci??n, en coherencia con su naturaleza jur??dica, identidad, tipolog??a y misi??n, las pol??ticas de investigaci??n, innovaci??n, creaci??n art??stica y cultural estar??n encaminadas a fomentar, fortalecer y desarrollar la ciencia, tecnolog??a e innovaci??n, contribuyendo as?? a la transformaci??n social del pa??s. En consecuencia, la instituci??n deber??, por lo menos, indicar:', '2', '2', '0'),
('27', 'Gesti??n de la informaci??n.', 'La instituci??n deber?? contar con informaci??n que le permita a la comunidad institucional conocer, apropiar, proceder y tomar decisiones, basada en datos y an??lisis de los mismos, de tal forma que se sustenten en las pol??ticas, normas, procesos de planeaci??n y resultados de gesti??n, para lo cual deber?? presentar, por lo menos: ', '2', '2', '0'),
('28', 'Arquitectura institucional.', 'La instituci??n deber?? articular sus procesos con la organizaci??n y las funciones de los cargos para garantizar el cumplimiento de las labores formativas, acad??micas, docentes, cient??ficas, Culturales y de extensi??n, que sean coherentes con su naturaleza jur??dica, tipolog??a, identidad y misi??n. Para ello, la instituci??n deber?? presentar, por lo menos: ', '2', '2', '0'),
('29', ' Evidencias e indicadores de la estructura administrativa y acad??mica.', 'Teniendo en cuenta los art??culos precedentes de este cap??tulo, la instituci??n deber?? presentar, por lo menos: ', '2', '2', '0'),
('3', 'Condiciones institucionales de calidad.', 'De conformidad con las disposiciones de la Ley 1188 de 2008 y del Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019, las condiciones de calidad institucionales establecidas para la obtenci??n y renovaci??n del registro calificado son:', '1', '0', '0'),
('30', 'Cultura de la autoevaluaci??n.', 'De acuerdo con su naturaleza jur??dica, tipolog??a, identidad y misi??n, la instituci??n deber?? establecer y promover su compromiso con la calidad mediante la adopci??n de, por lo menos: ', '2', '3', '0'),
('31', 'Sistema interno de aseguramiento de la calidad.', 'La instituci??n deber?? contar con un sistema intemo de aseguramiento de la calidad que prevea los momentos de planeaci??n, implementaci??n, seguimiento, evaluaci??n y mejoramiento de las labores acad??micas, formativas, docentes, culturales, cient??ficas y de extensi??n, y el desempe??o de los estudiantes, egresados, profesores y dem??s integrantes de la comunidad institucional, de tal forma que, al menos, d?? cuenta de lo que se??ala el art??culo 2.5.3.2.3.1.4 del Decreto 1075 de 2015, modificado por el Decreto 1330 de 2019.', '2', '3', '0'),
('32', 'Evidencias e indicadores de la cultura de la autoevaluaci??n.', 'Teniendo en cuenta los art??culos precedentes de este cap??tulo, la instituci??n deber?? presentar, por lo menos: ', '2', '3', '0'),
('33', 'Seguimiento a la actividad profesional de los egresados.', 'La instituci??n deber?? promover la interacci??n mutua entre los egresados y la instituci??n. Para ello, deber?? contar por lo menos, con:', '2', '4', '0'),
('34', 'Aprendizaje del egresado a lo largo de la vida.', 'La instituci??n deber?? establecer mecanismos que propendan por la oferta de programas de formaci??n en diferentes dimensiones del desarrollo personal y profesional para la actualizaci??n de sus egresados, de acuerdo con las necesidades del entorno.', '2', '4', '0'),
('35', 'Experiencia del egresado en la din??mica institucional.', 'La instituci??n deber?? contar con: ', '2', '4', '0'),
('36', 'Evidencias e indicadores de seguimiento al programa de egresados.', 'Teniendo en cuenta los art??culos precedentes de este cap??tulo, la instituci??n deber?? presentar, por lo menos:', '2', '4', '0'),
('37', 'Modelo de bienestar.', 'La instituci??n deber?? describir el modelo de bienestar, el cual deber?? incluir a todos los miembros que hacen parte de la comunidad institucional y reconocer la diversidad que se da en el contexto de las modalidades y los niveles de formaci??n ofrecidos, la naturaleza jur??dica, tipolog??a, identidad y misi??n. Dicho modelo deber?? contar, por lo menos con: ', '2', '5', '0'),
('38', 'Programas orientados a la prevenci??n de la deserci??n y a la promoci??n de la graduaci??n de los estudiantes.', 'En funci??n del desarrollo de los estudiantes y apoyados en la informaci??n cualitativa y cuantitativa para mejorar su permanencia y graduaci??n, la instituci??n deber?? contar con mecanismos de divulgaci??n e implementaci??n de programas orientados a la prevenci??n de la deserci??n y a la promoci??n de la graduaci??n de los estudiantes, que contemplen, por lo menos: ', '2', '5', '0'),
('39', 'Evidencias e indicadores del modelo de binestar.', 'Teniendo en cuenta los art??culos precedentes de este cap??tulo, la instituci??n deber?? presentar: ', '2', '5', '0'),
('4', 'Evidencias', 'Cada una de las condiciones institucionales que se \r\ndesarrolla en esta resoluci??n, comprende un conjunto de evidencias que son el respaldo para la verificaci??n y evaluaci??n de las instituciones en el proceso de obtenci??n y renovaci??n del registro calificado, sirviendo as?? para el cumplimiento de las funciones de los pares acad??micos y de la Comisi??n Nacional Intersectorial de Aseguramiento de la Calidad de la Educaci??n Superior - Conaces.', '1', '0', '0'),
('40', 'Definici??n de la misi??n, prop??sitos y objetivos institucionales.', 'La instituci??n, en coherencia con las modalidades, los niveles de formaci??n, su naturaleza jur??dica, identidad y tipolog??a, deber??: ', '2', '6', '0'),
('41', 'Gesti??n del talento humano.', 'Para la gesti??n del talento humano, la instituci??n deber?? establecer, por lo menos: ', '2', '6', '0'),
('42', 'Disponibilidad de recursos f??sicos y tecnol??gicos.', 'La instituci??n deber?? contar y tener disponible, en el lugar de desarrollo, una infraestructura f??sica y tecnol??gica para el cumplimiento de las labores formativas, acad??micas, docentes, cient??ficas, culturales, de extensi??n, de bienestar y de apoyo a la comunidad institucional, para lo cual, deber?? tener en cuenta, por lo menos: ', '2', '6', '0'),
('43', 'Descripci??n de la infraestructura f??sica y tecnol??gica.', '\r\nLa intituci??n deber?? incluir en la descripci??n de los espacios f??sicos y tecnol??gicos para el soporte del desarrollo de su misi??n y el cumplimiento de sus prop??sitos y objetivos institucionales, acorde con la cifra proyectada de estudiantes, profesores y el personal administrativo, la capacidad, disponibilidad, acceso y uso de estos. Para tales efectos, deber?? especificar: ', '2', '6', '0'),
('44', 'Pol??ticas de actualizaci??n y renovaci??n de la infraestructura f??sica y tecnol??gica.', 'La instituci??n deber?? contar con procesos para la actualizaci??n, renovaci??n y mantenimiento de la infraestructura f??sica y tecnol??gica, de tal forma que se prevea el desarrollo institucional y la obsolescencia de los recursos disponibles. Para tales efectos, deber?? demostrar, por lo menos: ', '2', '6', '0'),
('45', 'Apoyo tecnol??gico y sistemas de informaci??n.', 'Para el desarrollo de las labores formativas, acad??micas, docentes, cientificas, culturales, de extensi??n y administrativas, la instituci??n deber?? contar, por lo menos con: ', '2', '6', '0'),
('46', ' Recursos financieros.', 'La instituci??n, en coherencia con su naturaleza jur??dica, tipolog??a e identidad institucional, deber?? contar, por lo menos con: ', '2', '6', '0'),
('47', 'Evidencias de recursos suficientes para el cumplimiento de las metas.', 'Teniendo en cuenta los art??culos precedentes de este cap??tulo, la instituci??n deber?? presentar: ', '2', '6', '0'),
('48', 'Renovaci??n de las condiciones institucionales.', 'La instituci??n deber?? evidenciar ante el Ministerio de Educaci??n Nacional el mejoramiento de las condiciones institucionales evaluadas en el proceso anterior, en el que se haya emitido o renovado el concepto favorable de condiciones institucionales. \r\nPara ello, la instituci??n, en el marco de la implementaci??n de los procesos de su sistema interno de aseguramiento de la calidad, deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos', '3', '0', '0'),
('49', 'Evidencias e indicadores de los mecanismos que soportan la selecci??n y evaluaci??n de estudiantes en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 6 al 12 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos:', '3', '1', '1'),
('5', 'Autoevaluaci??n', 'En los tr??mites asociados con el registro calificado, las instituciones deber??n desarrollar, en el marco de su sistema interno de aseguramiento de la calidad, las estrategias que proporcionen los instrumentos, la informaci??n y los espacios de interacci??n con la comunidad acad??mica, necesarios para soportar el cumplimiento de las condiciones institucionales y de programa', '1', '0', '0'),
('50', 'Evidencias e indicadores de los mecanismos que soportan la selecci??n y evaluaci??n de profesores en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 6 y 14 al 17 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '1', '2'),
('51', 'Evidencias e indicadores de la estructura administrativa y acad??mica en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 19 al 28 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '2', '0'),
('52', 'Evidencias e indicadores de la cultura de la autoevaluaci??n en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 30 y 31 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '3', '0'),
('53', 'Evidencias e indicadores del seguimiento al programa de egresados en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 33 al 35 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '4', '0'),
('54', 'Evidencias e indicadores del modelo de bienestar en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 37 y 38 de la presente resoluci??n, la instituci??n deber?? presentar, acorde con su modelo de bienestar, en uno o varios informes de autoevaluaci??n: ', '3', '5', '0'),
('55', 'Evidencias e indicadores de los recursos suficientes para garantizar el cumplimiento de las metas en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta el art??culo 40 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '6', '0'),
('56', 'Evidencias e indicadores de la gesti??n del talento humano en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta el art??culo 41 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '6', '0'),
('57', 'Evidencias e indicadores de los recursos f??sicos y tocnol??gicos en la renovaci??n de condiciones institucionales.', 'Teniendo en cuenta los art??culos 42 al 45 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '6', '0'),
('58', 'EVIDENCIAS E INDICADORES DE LOS RECURSOS FINANCIEROS EN LA RENOVACI??N DE CONDICIONES INSTITUCIONALES.', 'Teniendo en cuenta el art??culo 46 de la presente resoluci??n, la instituci??n deber?? presentar, en uno o varios informes de autoevaluaci??n, por lo menos: ', '3', '6', '0'),
('59', 'VIGENCIA.', 'La presente resoluci??n rige a partir de la fecha de su publicaci??n.', '3', '6', '0'),
('6', 'Mecanismos de selecci??n y evaluaci??n de estudiantes y profesores', 'De acuerdo con su naturaleza jur??dica, tipolog??a, identidad y misi??n, la instituci??n deber?? contar con pol??ticas, normas, procesos, medios y dem??s componentes que considere necesarios para la selecci??n y evaluaci??n de estudiantes y profesores', '2', '1', '0'),
('7', 'Mecanismos de selecci??n y evaluaci??n de estudiantes', 'La instituci??n deber?? proporcionar los criterios y argumentos que indiquen la forma en que los mecanismos de selecci??n y evaluaci??n de estudiantes son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional. Dichos mecanismos deber??n estar incorporados en la normativa institucional vigente en el momento en que la instituci??n inicie la etapa de Pre radicaci??n de solicitud de registro calificado y deber??n estar aprobados por las instancias de gobierno correspondientes', '2', '1', '1'),
('8', 'Reglamento estudiantil o su equivalente', 'El reglamento estudiantil o su equivalente deber?? considerar los niveles de formaci??n y las modalidades en las que oferta sus programas. En coherencia y consistencia con la naturaleza jur??dica, misi??n, identidad y tipolog??a, el reglamento deber?? ser claro y expreso, y contemplar por lo menos: ', '2', '1', '1'),
('9', 'Pol??ticas para mejorar el bienestar, la permanencia y graduaci??n de los estudiantes.', 'La instituci??n deber?? definir las pol??ticas para mejorar el bienestar, la permanencia y graduaci??n de los estudiantes, demostrando que est??n articuladas a los medios, procesos y acciones requeridos para tal fin.', '2', '1', '1');

INSERT INTO `tblliteral` (`id`, `descripcion`, `fkidarticulo`) VALUES
('a12', 'Deberes y derechos de los estudiantes.', '12'),
('a13', 'Documento(s) con los criterios y argumentos que identifican la forma en que los mecanismos de selecci??n y evaluaci??n de estudiantes son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '13'),
('a15', ' Los procesos institucionales para definir, evaluar y actualizar los perfiles institucionales de los profesores, acorde con los programas acad??micos, niveles y modalidades ofrecidos, y todas las labores acad??micas, docentes, formativas, cient??ficas, culturales y de extensi??n.', '15'),
('a16', 'Derechos, deberes y obligaciones de los profesores.', '16'),
('a17', 'Estrategias para la comunicaci??n clara y oportuna sobre la forma de contrataci??n, las condiciones de la vinculaci??n(naturaleza y el plazo inicial) y la dedicaci??n de los profesores y, cuando corresponda, las consideraciones institucionales que podr??an impedir o limitar las vinculaciones futuras, acorde con lo establecido en la ley.', '17'),
('a18', 'Documento(s) con los criterios y argumentos que indican la forma en que los mecanismos de selecci??n y evaluaci??n de profesores son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '18'),
('a20', 'Definir el modelo de gobierno institucional, que incluya:', '20'),
('a24', 'En cuanto al curr??culo: establecer las directrices que respondan a la misi??n institucional en las que se??ale, al menos: los principios b??sicos de dise??o del contenido curricular y de las actividades acad??micas relacionadas con la formaci??n integral; la forma en c??mo, a partir del contenido curricular y de las actividades acad??micas, se procurar?? la interdisciplinariedad; y los componentes que la instituci??n considere necesarios para cumplir con los resultados de aprendizaje previstos.', '24'),
('a25', 'La gesti??n de la comunidad institucional.', '25'),
('a26', 'La declaraci??n institucional expresa de su ??nfasis de investigaci??n, iinovaci??n o creaci??n art??stica y cultural, y su relaci??n con sus labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n.', '26'),
('a27', 'Marco normativo institucional para cumplir con las regulaciones, est??ndares y pol??ticas aplicables con respecto al acceso, uso, divulgaci??n, retenci??n, actualizaci??n y/o eliminaci??n de informaci??n y comunicaciones intemas, conforme con la ley de protecci??n de datos.', '27'),
('a28', 'Los procesos necesarios que soporien el desarrollo de la instituci??n bajo crienos de efectividad, flexibilidad y transparencia.', '28'),
('a29', 'Respecto al gobierno institucional y rendici??n de cuentas: ', '29'),
('a3', 'Mecanismos de selecci??n y evaluaci??n de estudiantes y profesores', '3'),
('a30', 'Pol??ticas internas que promuevan los procesos de autoevaluaci??n, autorregulaci??n y mejoramiento.', '30'),
('a32', 'Respecto a la cultura de la autoevaluaci??n:', '32'),
('a33', 'Pol??ticas que promuevan el seguimiento a la actividad profesional de los egresados.', '33'),
('a35', 'Mecanismos para integrar los resultados de las percepciones y experiencias de la actividad profesional de sus egresados, a la reflexi??n sobre el mejoramiento de las labores formativas, acad??micas, docentes, cientificas, culturales y de extensi??n. ', '35'),
('a36', 'Pol??ticas que promuevan el seguimiento a la actividad profesional de los egresados.', '36'),
('a37', 'Pol??tica de bienestar para la comunidad institucional articulada con lo previsto en los Acuerdos 03 de 1995 y 03 de 2013 del Consejo Nacional de Educaci??n Superior ??? CESU.', '37'),
('a38', 'Alertas tempranas ante las posibilidades de deserci??n, de acuerdo con la informaci??n cualitativa y cuantitativa de los estudiantes para mejorar su ermanencia y graduaci??n.', '38'),
('a39', 'Descripci??n del modelo de bienestar que incluya, por lo menos: ', '39'),
('a40', 'Contar con misi??n, prop??sitos y objetivos institucionales, y establecer los mecanismos para su correspondiente actualizaci??n cuando ello sea requerido.', '40'),
('a41', 'Para la gesti??n del talento humano, la instituci??n deber?? establecer, por lo menos: ', '41'),
('a42', 'Proyecci??n de la poblaci??n que conforma la comunidad institucional.', '42'),
('a43', 'Espacios construidos, diferenciando ??reas cubiertas de ??reas descubiertas o dedicadas a circulaciones, ??reas verdes y espacios deportivos y culturales al aire libre, cuando la instituci??n ofrezca programas acad??micos que por su modalidad requieren presencialidad.', '43'),
('a44', 'Pol??ticas de mantenimiento, renovaci??n y actualizaci??n de la infraestructura.', '44'),
('a45', 'Mecanismos de asistencia t??cnica, orientaci??n y/o tutor??a, en el uso de todas \r\nlas tecnolog??as utilizadas en el proceso formativo a profesores y estudiantes.', '45'),
('a46', 'Pol??ticas y mecanismos para la obtenci??n, planificaci??n, gesti??n y control de recursos financieros que aseguren la sostenibilidad de la instituci??n y el desarrollo de las labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n.', '46'),
('a47', 'Respecto a la definici??n de la misi??n, prop??sitos y objetivos institucionales: ', '47'),
('a48', 'Todas aquellas decisiones relevantes tomadas y acciones realizadas durante la vigencia del concepto favorable de condiciones institucionales.', '48'),
('a49', 'Documento(s) con los criterios y argumentos que identifican la forma en que los mecanismos de selecci??n y evaluaci??n de estudiantes son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '49'),
('a50', 'Criterios y argumentos que indican la forma en que los mecanismos de selecci??n y evaluaci??n de profesores son coherentes con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '50'),
('a51', 'Respecto al gobierno institucional y rendici??n de cuentas: ', '51'),
('a52', 'Respecto a la cultura de la autoevaluaci??n: ', '52'),
('a53', 'Evidencia de la divulgaci??n y actualizaci??n de las pol??ticas que promuevan el seguimiento a la actividad profesional de los egresados.', '53'),
('a54', 'Resultados del modelo de bienestar que incluya, por lo menos: ', '54'),
('a55', 'Descripci??n de la ejecuci??n y resultados de los instrumentos de planeaci??n que han hecho posible la materializaci??n de la misi??n, los prop??sitos y los objetivos institucionales en los ??ltimos 7 a??os, comparada con los instrumentos que la  instituci??n ten??a proyectados para el mismo periodo, con la respectiva justificaci??n en las diferencias significativas.', '55'),
('a56', 'Resultados de los procesos institucionales para atraer, vincular, retener y desvincular el talento humano acorde con su misi??n.', '56'),
('a57', 'Descripci??n y valoraci??n cuantitativa y cualitativa de la infraestructura f??sica y tecnol??gica, actualizadas a las din??micas de la nueva vigencia de condiciones institucionales con la respectiva justificaci??n.', '57'),
('a58', 'Evidencia de la divulgaci??n de las pol??ticas financieras.', '58'),
('a8', 'Derechos y deberes de los estudiantes', '8'),
('b12', 'Costos asociados al proceso formativo que incluyan: el valor de la matr??cula y los dem??s derechos pecuniarios que por razones acad??micas puedan ser cobrados por la instituci??n.', '12'),
('b13', 'Reglamento estudiantil o su equivalente. ', '13'),
('b15', 'El plan vigente de vinculaci??n y dedicaci??n institucional de los profesores, soportado en los recursos financieros requeridos, de acuerdo con el desarrollo institucional previsto en t??rminos de la cifra proyectada de estudiantes y planes institucionales a realizar, que incluya perfiles, tipo de vinculaci??n, dedicaci??n y duraci??n de los contratos.', '15'),
('b16', 'Criterios, requisitos y procesos para la selecci??n, vinculaci??n, otorgamiento de distinciones y est??mulos, evaluaci??n de desempe??o y desvinculaci??n de los profesores, orientados bajo principios de transparencia, m??rito y objetividad.', '16'),
('b17', 'Procesos para la inducci??n de los profesores a las labores acad??micas, docentes, formativas, cient??ficas, culturales y de extensi??n, en coherencia con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '17'),
('b18', 'Descripci??n de los procesos institucionales para definir, evaluar y actualizar los perfiles profesorales.', '18'),
('b20', 'Formular el proyecto educativo institucional o el que haga sus veces.', '20'),
('b24', 'En cuanto a resultados de aprendizaje: establecer las definiciones conceptuales y los procesos de validaci??n y aprobaci??n de los mismos, en donde se indique por lo menos, la forma en que la instituci??n establecer??, desarrollar?? y evaluar?? los resultados de aprendizaje y que ser??n coherentes con el perfil del egresado definido por la instituci??n y el programa acad??mico. Dichos resultados de aprendizaje deber??n reflejar la s??ntesis del proceso formativo y, por lo tanto, corresponder??n a un conjunto limitado en n??mero y contenido, de tal forma que sea evaluable y verificable su logro.', '24'),
('b25', 'El alcance de los conceptos de equidad, diversidad e inclusi??n.', '25'),
('b26', 'Las directrices para la promoci??n de la ??tica de la investigaci??n, innovaci??n, o creaci??n art??stica y cultural y su pr??ctica responsable.', '26'),
('b27', 'Descripci??n de los mecanismos y sistemas para la gesti??n de la informaci??n que faciliten la planeaci??n, el monitoreo y la evaluaci??n de las actividades institucionales y la toma de decisiones relacionadas con las labores formativas, acad??micas, docentes, cientificas, culturales y de extensi??n, garantizando que la informaci??n sea veraz, oportuna, precisa, completa y confiable.', '27'),
('b28', 'La estructura organizacional que atienda los procesos y soporte las decisiones que se toman en las instancias de gobiemo; las labores acad??micas, docentes, formativas, Gent??ficas, culturales y de extensi??n; y la gesti??n de recursos humanos, f??sicos, tecnol??gicos y financieros, en coherencia con los niveles de formaci??n, las modalidades ofrecidas y la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '28'),
('b29', 'Respecto a las pol??ticas institucionales: ', '29'),
('b3', 'Estructura administrativa y acad??mica', '3'),
('b30', 'Mecanismos para la articulaci??n de los procesos de evaluaci??n institucional y de la comunidad acad??mica. ', '30'),
('b32', 'Respecto al sistema interno de aseguramiento de la calidad: ', '32'),
('b33', 'Mecanismos que faciliten ta formulaci??n, divulgaci??n y actualizaci??n de las pol??ticas indicadas en el literal ante??or.', '33'),
('b35', 'Mecanismos para promover la participaci??n de los egresados en los procesos de autoevaluaci??n y mejoramiento institucional.', '35'),
('b36', 'Evidencia de la divulgaci??n y actualizaci??n de las pol??ticas que promuevan el seguimiento a la actividad profesional de los egresados.', '36'),
('b37', 'Articulaci??n de procesos organizacionales y cargos para soportar el modelo de bienestar.', '37'),
('b38', 'Proyecci??n de actividades y recursos humanos, f??sicos y financieros requeridos para la prevenci??n de la deserci??n y la promoci??n de la graduaci??n de los estudiantes.', '38'),
('b39', 'Descripci??n de los programas orientados a la prevenci??n de la deserci??n y a la promoci??n de la graduaci??n de los estudiantes, y los avances relacionados, que incluya, por lo menos: ', '39'),
('b40', 'Proyectar los instrumentos de planeaci??n que hacen posible la materializaci??n de la misi??n, los prop??sitos y los objetivos institucionales. Dichos instrumentos deber??n presentar las actividades y los recursos previstos (financieros, f??sicos y humanos) para su desarrollo.', '40'),
('b41', 'Procesos para la inducci??n de su talento humano, en coherencia con su naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '41'),
('b42', 'Proyecci??n de los requerimientos de infraestructura f??sica y tecnol??gica para atender la din??mica cambiante de las labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n.', '42'),
('b43', 'Espacios o ambientes f??sicos o virtuales (aulas, interacci??n tecnol??gica, espacios para el aprendizaje los que hacen parte de las unidades acad??micas particulares o su equivalente (facultades, escuelas, centros, institutos, ente otros actividades de aprendizaje, investigaci??n, extensi de todas las facultades, entre otros).', '43'),
('b44', 'Estrategias, programas, planes y proyectos de gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica, acorde con la cifra proyectada de estudiantes, profesores y personal administrativo, y el cumplimiento de sus prop??sitos y objetivos institucionales. Dichos programas, planes y proyectos deben presentar las actividades y los recursos previstos (financieros, f??sicos y humanos) para su desarrollo.', '44'),
('b45', 'Mecanismos de acceso por parte de profesores y estudiantes a los materiales requeridos en el proceso formativo en formato impreso y/o digital, de acuerdo con el dise??o curricular.', '45'),
('b46', 'Pol??ticas y mecanismos para la formulaci??n, ejecuci??n, seguimiento y control de presupuestos anuales, construidos a partir de la informaci??n suministrada por las diferentes unidades que aseguran el desarrollo de las labores formativas, acad??micas, docentes, cient??ficas, culturales, de extensi??n y administrativas.', '46'),
('b47', 'Respecto a la gesti??n del talento humano:', '47'),
('b48', 'Los ajustes o modificaciones realizados a la informaci??n que fue presentada el tr??mite anterior de Pre radicaci??n de solicitud de registro calificado.', '48'),
('b49', 'Evidencia del cumplimiento del reglamento estudiantil o su equivalente, respecto a: ', '49'),
('b50', 'Perfiles institucionales de los profesores actualizados a las din??micas de la nueva vigencia de condiciones institucionales y justificaci??n correspondiente. ', '50'),
('b51', 'Respecto a las pol??ticas institucionales:', '51'),
('b52', 'Respecto al sistema interno de aseguramiento de la calidad: ', '52'),
('b53', 'Evoluci??n del modelo de gesti??n de la informaci??n de los egresados que refleje la actualizaci??n de la misma.', '53'),
('b54', 'Resultados de los programas orientados a la prevenci??n de la deserci??n y a la promoci??n de la graduaci??n de los estudiantes que incluya por lo menos: ', '54'),
('b55', ' Proyecci??n para los pr??ximos 7 a??os de los instrumentos de planeaci??n que hacen posible la materializaci??n de la misi??n, los prop??sitos y los objetivos institucionales. Dichos instrumentos deber??n presentar las actividades y los recursos previstos (financieros, f??sicos y humanos) para su desarrollo.', '55'),
('b56', 'Evidencia de los procesos para la inducci??n del talento humano.', '56'),
('b57', 'Descripci??n cuantitativa del uso, apropiaci??n, desarrollo, gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica en los ??ltimos 7 a??os, de acuerdo con el crecimiento o decrecimiento de la poblaci??n, comparada con la planeaci??n que se ten??a proyectada para el mismo periodo, con la respectiva justificaci??n en las diferencias significativas.', '57'),
('b58', 'Resultados de las pol??ticas y mecanismos de obtenci??n, gesti??n y control de recursos financieros.', '58'),
('b8', 'Condiciones para obtener distinciones e incentivos', '8'),
('c12', 'Las pol??ticas sobre reingresos, retiros, cambios de programas u otros que impliquen alguna decisi??n institucional al respecto.', '12'),
('c13', 'Evidencia del cumplimiento del reglamento estudiantil o su equivalente, respecto a: ', '13'),
('c16', 'Criterios para establecer la dedicaci??n, disponibilidad y permanencia de los profesores que desarrollen las labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n, y para aquellos que desarrollen actividades relacionadas con procesos administrativos.', '16'),
('c17', 'Procesos de seguimiento al an??lisis y valoraci??n peri??dica de la asignaci??n de las actividades de los profesores a nivel institucional, con la posibilidad de poder ajustarlas a medida que cambien las condiciones institucionales.', '17'),
('c18', 'Perfiles institucionales de los profesores.', '18'),
('c20', 'Contar con procesos para la aprobaci??n de cambios que tengan implicaciones en la identidad, tipolog??a y misi??n institucional.', '20'),
('c24', 'En cuanto a cr??ditos y actividades acad??micas: establecer las directrices a nivel institucional para la definici??n de la relaci??n entre las horas de interacci??n con el profesor y las horas de trabajo independiente; la definici??n de actividades acad??micas, incluyendo el desarrollo de las que se materializan en actividades de laboratorio, pasant??as, pr??cticas y otras que se requieran para el desarrollo de los programas acad??micos y el logro de los resultados de aprendizaje.', '24'),
('c25', 'La gesti??n y asignaci??n de los recursos institucionales para el desarrollo de pol??ticas de bienestar.', '25'),
('c26', 'Las directrices para la promoci??n de un ambiente para el desarrollo de la ciencia, la tecnolog??a, la innovaci??n o la creaci??n art??stica y cultural', '26'),
('c27', 'Procedimientos para el registro de informaci??n actualizada, en los sistemas de informaci??n que administren el Ministerio de Educaci??n Nacional y el Ministerio de Ciencia y Tecnolog??a e Innovaci??n, de acuerdo con los requerimientos de los mismos en cuanto a periodicidad y tiempos de suministro.', '27'),
('c28', 'La definici??n de cargos en n??mero y funciones en coherencia con los procesos y la estructura organizacional definida, de tal forma que permita la evaluaci??n del logro de los objetivos para los cuales fueron creados.', '28'),
('c29', 'Respecto a la gesti??n de informaci??n: ', '29'),
('c3', 'Cultura de la autoevaluaci??n', '3'),
('c33', 'Modelo de gesti??n que incluya un sistema de informaci??n para administrar los datos que permiten soportar la interacci??n con los egresados y hacer seguimiento a su actividad profesional, desempe??o laboral y/o emprendimientos, y todo aquello que d?? cuenta d isi?? identi vd q e la misi??n e identidad institucional.', '33'),
('c36', 'Descripci??n del modelo de gesti??n de la informaci??n de los egresados incluyendo los mecanismos de actualizaci??n de la informaci??n.', '36'),
('c37', 'El conjunto de servicios de bienestar en procura del desarrollo integral y la convivencia de la comunidad institucional.', '37'),
('c38', 'Apoyo financiero a estudiantes cuando as?? se requiera y cuando la instituci??n disponga de los recursos para dar alcance a los programas propuestos.', '38'),
('c40', 'Acoger en su misi??n institucional las necesidades de la sociedad e identificar a los estudiantes, profesores y la comunidad a la que espera servir. Lo anterior, en coherencia con su proyecto educativo institucional, o lo que haga sus veces.', '40'),
('c41', 'Procesos para la inducci??n de su talento humano, en coherencia con su naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '41'),
('c42', 'Proyecciones de los requerimientos para atender el desarrollo de las actividades de bienestar, de acuerdo con la naturaleza jur??dica, identidad, tipolog??a y misi??n institucional, que prevea la proyecci??n de la poblaci??n.', '42'),
('c43', 'Espacios f??sicos o virtuales de apoyo a las labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n (centros de recursos de aprendizaje, bibliotecas, espacios de c??mputo, oficinas para la docencia (profesores, monitores, investigadores) entre otros.', '43'),
('c44', 'Estrategias y mecanismos para avanzar gradualmente en las condiciones de accesibilidad de la comunidad educativa, de acuerdo con la normatividad vigente en Colombia.', '44'),
('c45', 'Los recursos necesarios en los ambientes de aprendizaje para facilitar las actividades de formaci??n deseadas.', '45'),
('c46', 'Criterios para la asignaci??n y ejecuci??n de recursos financieros a las diferentes unidades, los cuales deber??n promover las condiciones de calidad institucional y de programa.', '46'),
('c47', 'Respecto a los recursos f??sicos y tecnol??gicos:', '47'),
('c48', 'La actualizaci??n de planes, proyectos y programas para los siguientes 7 a??os incluyendo recursos humanos, f??sicos y financieros que se estiman utilizar', '48'),
('c49', 'Evidencia de los requisitos y criterios para los procesos de inscripci??n, admisi??n, ingreso, matr??cula, evaluaci??n y graduaci??n de estudiantes.', '49'),
('c50', 'Descripci??n del grupo profesoral vigente que incluya informaci??n de su composici??n respecto a dedicaci??n, vinculaci??n y disponibilidad.', '50'),
('c51', 'Respecto a la gesti??n de la informaci??n:', '51'),
('c53', 'Descripci??n cuantitativa de la ejecuci??n y resultados de los planes o programas para el seguimiento a la actividad profesional de los egresados en los ??ltimos 7 a??os, comparada con los planes o programas que se ten??an proyectados para el mismo periodo, con la respectiva justificaci??n en las diferencias significativas.', '53'),
('c56', 'Resultados de los procesos para la evaluaci??n peri??dica de las contrataciones, los nombramientos, el desempe??o y la retenci??n del talento humano.', '56'),
('c57', 'Evaluaci??n y ajuste de la planeaci??n de los ??ltimos 7 a??os y proyecci??n para los pr??ximos 7 a??os, del uso, apropiaci??n, desarrollo, gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica para atender las labores formalivas, acad??micas, docentes, cient??ficas, culturales y de extensi??n, as?? como para atender las actividades de bienestar desarrolladas por la poblaci??n que hace parte de la comunidad institucional, y que prevea los recursos (financieros, f??sicos y humanos) para su desarrollo.', '57'),
('c58', 'Evaluaci??n y ajustes a los procesos de la planeaci??n financiera de corto, mediano y largo plazo.', '58'),
('c8', 'Pol??ticas, criterios, requisitos y procesos de inscripci??n, admisi??n, ingreso, reingreso, transferencias, matr??cula y evaluaci??n', '8'),
('d12', 'Trabajo acad??mico aut??nomo del estudiante y de interacci??n con el profesor, representado en cr??ditos acad??micos.', '12'),
('d13', 'Pol??ticas para mejorar el bienestar, la permanencia y graduaci??n de los estudiantes', '13'),
('d16', 'Condiciones para apropiar y desplegar la cultura de la autoevaluaci??n.', '16'),
('d17', 'Programas de desarrollo de competencias pedag??gicas, tecnol??gicas y de investigaci??n, innovaci??n y/o creaci??n art??stica y cultural, de acuerdo con los niveles de formaci??n y las modalidades ofertadas, en coherencia con la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '17'),
('d18', 'Descripci??n del grupo profesoral vigente que incluya informaci??n de su composici??n respecto a dedicaci??n, vinculaci??n y disponibilidad.', '18'),
('d20', 'Contar con procesos para soportar el sistema interno de aseguramiento de la calidad y planeaci??n institucional.', '20'),
('d25', 'El desarrollo de actividades culturales, deportivas, de salud mental y f??sica, y dem??s dirigidas a toda la comunidad acad??mica e institucional.', '25'),
('d26', 'Las directrices para la disposici??n de recursos humanos, tecnol??gicos y financieros en el dosarrollo de la investigaci??n, innovaci??n o la creaci??n art??stica y cultural, en coherencia con los programas y las modalidades que ofrece.', '26'),
('d28', 'Los mecanismos para la evaluaci??n y actualizaci??n de procesos, estructura organizacional y cargos.', '28'),
('d29', 'Respecto a la arquitectura institucional: ', '29'),
('d3', 'Programa de egresados', '3'),
('d33', 'Mecanismos para la actualizaci??n de la informaci??n de los egresados.', '33'),
('d36', 'Descripci??n de los planes y programas para el seguimiento a la actividad profesional de los egresados.', '36'),
('d37', 'Mecanismos de comunicaci??n y de difusi??n de los servicios disponibles a la comunidad institucional.', '37'),
('d38', 'Acompa??amiento de manera efectiva que atienda las necesidades de cada de los estudiantes.', '38'),
('d40', 'Considerar en sus objetivos, cuando ofrezca programas acad??micos en m??s de una modalidad y en m??s de un lugar de desarrollo, las particularidades que esto genera a la din??mica institucional.', '40'),
('d42', 'Permisos de autorizaci??n expresa de la autoridad competente para el uso del suelo y de la infraestructura que dispondr?? la instituci??n para el desarrollo de sus actividades administrativas y acad??micas.', '42'),
('d43', 'Espacios para los servicios institucionales (cafeter??as, espacios comerciales, entre otros).', '43'),
('d46', 'Mecanismos de divulgaci??n de las pol??ticas relacionadas en los anteriores literales del presente art??culo.', '46'),
('d47', 'Respecto a los recursos financieros: ', '47'),
('d48', 'Las evidencias e indicadores que se se??alan en el presente t??tulo.', '48'),
('d49', 'Resultados de la implementaci??n de los procesos de acompa??amiento de estudiantes, en donde se vea el impacto en su permanencia y graduaci??n, y se entienda la composici??n de la poblaci??n estudiantil en t??rminos de las variables establecidas por la instituci??n, seg??n la informaci??n cualitativa y cuantitativa  recogida en los procesos de admisi??n.', '49'),
('d50', 'Descripci??n cuantitativa de la ejecuci??n anual del plan de vinculaci??n y dedicaci??n institucional de los profesores en los ??ltimos 7 a??os, comparada con el plan que se ten??a proyectado para el mismo periodo con la respectiva justificaci??n en las diferencias significativas.', '50'),
('d51', 'Respecto a la arquitectura institucional:', '51'),
('d53', 'Proyecciones para los pr??ximos 7 a??os de los planes o programas para el seguimiento a la actividad profesional de los egresados.', '53'),
('d57', 'Permisos de autorizaci??n expresa de la autoridad competente para el uso del suelo y de la infraestructura con la que disponga la instituci??n para el desarrollo de sus actividades administrativas y acad??micas.', '57'),
('d58', 'Ejecuci??n de la planeaci??n financiera en los ??ltimos siete a??os comparada con la planeaci??n financiera que se ten??a proyectada para el mismo per??odo con la respectiva justificaci??n en las diferencias significativas.', '58'),
('d8', 'R??gimen disciplinario', '8'),
('e12', 'Pol??ticas o lo que haga sus veces, sobre evaluaci??n y permanencia.', '12'),
('e13', 'Evidencia de los requisitos y criterios para los procesos de inscripci??n, admisi??n, \r\ningreso, matr??cula, evaluaci??n y graduaci??n de estudiantes.', '13'),
('e16', 'Trayectoria profesoral, o lo que haga sus veces, indicando los criterios para la vinculaci??n, promoci??n, definici??n de categor??as, retiro y dem??s situaciones administrativas.', '16'),
('e17', 'Sistema de seguimiento, evaluaci??n y retroalimentaci??n a los profesores, en coherencia con las labores formativas, docentes, acad??micas, cient??ficas, culturales y de extensi??n, y con el nivel y las modalidades en las que se ofrezcan los programas acad??micos.', '17'),
('e18', 'Proyecciones, para los pr??ximos 7 a??os, del plan de vinculaci??n y dedicaci??n institucional de los profesores.', '18'),
('e25', 'El desarrollo de actividades de gesti??n necesarias para cumplir los prop??sitos institucionales. ', '25'),
('e26', 'La realamentaci??n de propiedad intelectual.', '26'),
('e3', 'Modelo de bienestar', '3'),
('e33', 'F lanes 2 programas para el seguimiento a la actividad profesional de los egresados que especifiquen las actividades y recursos (financieros, humanos y fisicos) previstos para el desarrollo de estos.', '33'),
('e36', 'Resultados de los planes o programas para el seguimiento a la actividad profesional de los egresados, en caso que la instituci??n cuente con egresados.', '36'),
('e37', 'Mecanismos para evaluar los servicios de bienestar por parte de la comunidad \r\ninstitucional.', '37'),
('e38', 'Interacci??n sistem??tica entre estudiantes y entre profesores y estudiantes.', '38'),
('e43', 'Espacios de bienestar para la comunidad institucional, sean cubiertos (??reas deportivas, culturales, entre otros) o descubiertos (canchas, zonas verdes, entre otros).', '43'),
('e46', 'Mecanismos para la obtenci??n de recursos financieros.', '46'),
('e49', 'Retroalimentaci??n a los estudiantes e implementaci??n de acciones basadas en \r\nlas evaluaciones establecidas.', '49'),
('e50', 'Proyecciones para los pr??ximos 7 a??os del plan de vinculaci??n y dedicaci??n de profesores para el periodo objeto de la renovaci??n.', '50'),
('e53', 'Resultados de la oferta de programas de formaci??n en diferentes dimensiones del desarrollo personal y profesional de los egresados.', '53'),
('e57', 'Evidencias que demuestren que la instituci??n cumple con la normatividad vigente relacionada con regulaciones ambientales, de seguridad de sismorresistencia y de accesibilidad, y con condiciones f??sicas como ventilaci??n, iluminaci??n y mobiliario, de acuerdo con el tama??o y caracter??sticas de la poblaci??n que est?? vinculada a la instituci??n.', '57'),
('e58', 'Proyecci??n para el a??o en curso y los pr??ximos 7 a??os de la planeaci??n financiera de acuerdo con la naturaleza jur??dica de la instituci??n.', '58'),
('e8', 'Homologaci??n y reconocimiento de aprendizajes entre programas de la misma instituci??n o de otras instituciones (nacionales y/o extranjeras)', '8'),
('f12', 'Requisitos de grado.', '12'),
('f13', 'Informaci??n cualitativa y cuantitativa para mejorar el bienestar, la permanencia \r\ny la graduaci??n de los estudiantes en la instituci??n.', '13'),
('f16', 'Impedimentos, inhabilidades, incompatibilidades, conflicto de intereses y \r\nr??gimen disciplinario.', '16'),
('f18', 'Reglamento profesoral o su equivalente.', '18'),
('f26', 'La roquiaci??n de convenios y asociaciones relacionadas con el desarrollo de la investigaci??n, innovaci??n o creaci??n art??stica y cultural.', '26'),
('f3', 'Recursos suficientes para garantizar el cumplimiento de las metas', '3'),
('f33', 'Planes o programas para fomentar la red colaborativa de egresados y de estos con la sociedad.', '33'),
('f36', 'Descripci??n de la oferta de programas de formaci??n en diferentes dimensiones del desarrollo personal y profesional de sus egresados.', '36'),
('f37', 'Mecanismos de gesti??n de peticiones, quejas y reclamos de la comunidad institucional.', '37'),
('f43', 'Otros espacios o ambientes, f??sicos o virtuales, que atiendan las particularidades de la instituci??n y que no hayan sido descritos anteriormente.', '43'),
('f49', 'Resultados de las acciones frente a la deserci??n por cohorte y por periodo.', '49'),
('f50', 'Evidencia del cumplimiento de las directrices del reglamento profesoral o su equivalente, respecto a: ', '50'),
('f53', 'Evidencia del uso de medios de comunicaci??n de la oferta formativa en cuanto a cursos de educaci??n continua o programas de educaci??n superior que sean pertinentes para los egresados de la instituci??n.', '53'),
('f57', 'Descripci??n cualitativa y cuantitativa de la ejecuci??n de las estrategias, programas, planes y proyectos de gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica en los ??ltimos 7 a??os, comparada con las estrategias, programas, planes y proyectos que ten??a proyectados la instituci??n para el mismo periodo, con la respectiva justificaci??n en las diferencias significativas', '57'),
('f58', 'Resultados comparativos de la formulaci??n y la ejecuci??n del presupuesto tanto de funcionamiento como inversi??n discriminados por rubro y por funci??n misional de al menos los ??ltimos 7 a??os.', '58'),
('f8', 'Requisitos de grado', '8'),
('g12', 'Estrategias de acompa??amiento en su proceso formativo que involucre temas acad??micos u otros que la instituci??n provea para el desarrollo de los estudiantes.', '12'),
('g13', 'Retroalimentaci??n a los estudiantes e implementaci??n de acciones basadas en \r\nlas evaluaciones establecidas.', '13'),
('g16', 'Todo aquello que, desde la naturaleza jur??dica, tipolog??a, identidad y misi??n \r\ninstitucional, tenga implicaciones en el desarrollo profesoral.', '16'),
('g18', 'Descripci??n de los procesos de selecci??n, vinculaci??n, desarrollo y desvinculaci??n de los profesores.', '18'),
('g26', 'Las directrices generales para el registro de publicaciones y resultados de investigaci??n, innovaci??n o creaci??n artistica y cultural, en los sistemas de informaci??n institucional, nacional e internacional.', '26'),
('g36', 'Descripci??n de los medios de comunicaci??n de la oferta formativa en cuanto a cursos de educaci??n continua o programas acad??micos de educaci??n superior que sean pertinentes para los egresados de la instituci??n.', '36'),
('g49', 'Evidencia de la implementaci??n de los procesos para garantizar que la informaci??n entregada y publicada, es veraz, confiable, accesible y oportuna.', '49'),
('g50', 'Evidencia de uso de medios de comunicaci??n con los profesores que les permita conocer todos sus deberes y derechos.', '50'),
('g53', 'Resultados de la integraci??n de las percepciones y experiencias de la actividad profesional de sus egresados a la reflexi??n acerca del desarrollo institucional.', '53'),
('g57', ' Indicadores relacionados con el cumplimiento de las estrategias, programas, planes y proyectos de gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica.', '57'),
('g58', 'Presupuesto institucional del a??o en curso y proyectado para los siguientes 7 a??os con sus respectivos mecanismos de control tanto en funcionamiento como inversi??n discriminados por rubro y por funci??n misional de acuerdo con la naturaleza jur??dica de la instituci??n.', '58'),
('h12', 'Servicios de apoyo al estudiante, en coherencia con los niveles y las modalidades ofrecidas, y otros que promuevan su permanencia y graduaci??n.', '12'),
('h13', 'Estudios que permitan implementar acciones frente a la deserci??n por cohorte \r\ny por periodo.', '13'),
('h18', 'Evidencia del cumplimiento de las directrices del reglamento profesoral o su equivalente y los dem??s documentos debidamente aprobados por las autoridades o instancias competentes de la instituci??n, respecto a: ', '18'),
('h36', 'Descripci??n de mecanismos para integrar los resultados de las percepciones y experiencias de la actividad profesional de sus egresados a la reflexi??n acerca del desarrollo institucional.', '36'),
('h49', 'Seguimiento a los resultados de los procesos de inscripci??n, admisi??n, ingreso, matr??cula, evaluaci??n y graduaci??n de estudiantes y an??lisis de los mismos a la luz de la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '49'),
('h50', 'Seguimiento a indicadores anuales para los ??ltimos 7 a??os asociados a la selecci??n, vinculaci??n, desarrollo y desvinculaci??n de los profesores.', '50'),
('h53', 'Resultados de la participaci??n de los egresados en los procesos de autoevaluaci??n y mejoramiento.', '53'),
('h57', 'Proyecci??n para los pr??ximos 7 a??os de estrategias, programas, planes y proyectos de gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica, que incluyan actividades y recursos previstos para su desarrollo.', '57'),
('h58', 'Evidencia de que la instituci??n reporta la informaci??n financiera que reposa en sus documentos oficiales a los sistemas nacionales de informaci??n.', '58'),
('i13', 'Descripci??n de los procesos para garantizar que la informaci??n entregada y \r\npublicada sea veraz, confiable, accesible y oportuna.', '13'),
('i18', 'Evidencia del uso de medios de comunicaci??n con los profesores que les permita conocer sus deberes y derechos.', '18'),
('i36', 'Descripci??n de mecanismos para promover la participaci??n de los egresados en los procesos de autoevaluaci??n y mejoramiento.', '36'),
('i49', 'Evidencia de la implementaci??n de los mecanismos que permitan verificar y asegurar que la identidad de quien cursa el programa corresponde a la del estudiante matriculado.', '49'),
('i50', 'Evidencias de la implementaci??n de los procesos de inducci??n profesoral.', '50'),
('i53', 'Descripci??n cuantitativa de la ejecuci??n y resultados de los planes o programas para fomentar la red colaborativa de egresados y de estos con la sociedad en los ??ltimos 7 a??os, comparada con los planes o programas que se ten??an proyectados para el mismo periodo.', '53'),
('i57', 'Evidencias e indicadores relacionados con el cumplimiento de estrategias y mecanismos para avanzar gradualmente en las condiciones de accesibilidad de la comunidad educativa, de acuerdo con la normatividad vigente. ', '57'),
('i58', 'Evidencia del cumplimiento de los criterios para la asignaci??n y ejecuci??n de recursos financieros a las diferentes unidades. ', '58'),
('j13', 'Seguimiento a los resultados de los procesos de inscripci??n, admisi??n, ingreso, matr??cula, evaluaci??n y graduaci??n de estudiantes, y an??lisis de los mismos a la luz de la naturaleza jur??dica, tipolog??a, identidad y misi??n institucional.', '13'),
('j18', 'Descripci??n de los procesos de inducci??n profesoral.', '18'),
('j36', 'Descripci??n de los planes o programas para fomentar la red colaborativa de egresados y de estos con la sociedad.', '36'),
('j50', 'Resultados de la implementaci??n de los procesos de seguimiento al an??lisis y valoraci??n peri??dica de la asignaci??n de actividades a los profesores.', '50'),
('j57', 'Evidencias e indicadores relacionados con el cumplimiento de los procesos de asignaci??n de la infraestructura f??sica y tecnol??gica a la comunidad para su uso, de manera que se garantice su disponibilidad.', '57'),
('k13', 'Descripci??n de los mecanismos que permitan verificar y asegurar que la identidad de quien cursa el programa corresponda a la del estudiante matriculado.', '13'),
('k18', 'Descripci??n de los procesos de seguimiento al an??lisis y valoraci??n peri??dica de la asignaci??n a las actividades de los profesores.', '18'),
('k50', 'Resultados de la implementaci??n de los programas de desarrollo profesoral.', '50'),
('k57', 'Evidencias e indicadores acerca del uso de la infraestructura f??sica y tecnol??gica.', '57'),
('l18', 'Descripci??n de los programas de desarrollo de competencias pedag??gicas, tecnol??gicas y de investigaci??n, innovaci??n y/o creaci??n art??stica y cultural.', '18'),
('l50', 'Resultados de la implementaci??n del sistema de seguimiento, evaluaci??n y retroalimentaci??n a los profesores.', '50'),
('l57', 'Evidencias que demuestren que la instituci??n cuenta con las licencias para uso de los recursos, conforme a la normatividad vigente sobre propiedad intelectual.', '57'),
('m18', 'Resultados de la implementaci??n de los programas de desarrollo profesoral.', '18'),
('m57', 'Cuando aplique, evidencia del cumplimiento de los acuerdos de voluntades, convenios o contratos presentados para demostrar la disponibilidad de la infraestructura f??sica y tecnol??gica en la ??ltima solicitud o renovaci??n de condiciones institucionales.', '57'),
('n18', 'Descripci??n del sistema de seguimiento, evaluaci??n y retroalimentaci??n a los profesores', '18'),
('n57', 'Cuando aplique, los acuerdos de voluntades, convenios o contratos utilizados para demostrar la disponibilidad de la infraestructura f??sica y tecnol??gica deber??n incluir en sus cl??usulas los alcances de la disponibilidad de esta infraestructura en t??rminos de horarios y capacidad, por lo menos, durante la vigencia del concepto favorable de las condiciones institucionales.', '57'),
('o18', 'Resultado de la ??ltima evaluaci??n y retroalimentaci??n realizada a los profesores.', '18'),
('o57', 'Resultados de la implementaci??n de los mecanismos de acceso por parte de profesores y estudiantes a los materiales requeridos en el proceso formativo.', '57'),
('p57', 'Indicadores relacionados con la utilizaci??n de recursos necesarios en los ambientes de aprendizaje para facilitar las actividades de formaci??n deseadas.', '57'),
('q57', 'Proyecci??n para los pr??ximos 7 a??os de los recursos necesarios en los ambientes de aprendizaje, para facilitar las actividades de formaci??n deseadas.', '57');

INSERT INTO `tblnumeral` (`id`, `descripcion`, `fkidliteral`) VALUES
('10a39', 'Descripci??n de las estrategias de acceso de estudiantes a los servicios de bienestar en la instituci??n y en las empresas, organizaciones u otros entes que hagan parte del proceso formativo, cuando se trate de modalidad dual O cuando los programas contengan actividades como pr??cticas acad??micas o pasant??as en lugares diferentes a la instituci??n.', 'a39'),
('10b32', 'Plan de mejoramiento institucional actualizado o instrumento equivalente.', 'b32'),
('10c47', 'Descripci??n de los mecanismos de acceso por parte de profesores y estudiantes a los materiales requeridos en el proceso formativo.', 'c47'),
('11a39', ' Descripci??n de la articulaci??n de los procesos organizacionales y cargos para soportar el modelo de bienestar.', 'a39'),
('11b32', ' Resultados de la articulaci??n de los planes de mejoramiento con los procesos de planeaci??n de largo, mediano y corto plazo, y el presupuesto general de la instituci??n.', 'b32'),
('11c47', 'Descripci??n de los recursos necesarios en los ambientes de aprendizaje para facilitar las actividades de formaci??n e interacci??n.', 'c47'),
('12c47', 'Proyecci??n, para los pr??ximos 7 a??os, de los recursos necesarios en los ambientes de aprendizaje para facilitar las actividades de formaci??n e interacci??n.', 'c47'),
('1a20', 'Definici??n de los ??rganos de gobierno y sus respectivas funciones.', 'a20'),
('1a29', 'Definici??n del modelo de gobierno institucional.', 'a29'),
('1a32', 'Pol??ticas que promuevan los procesos de autoevaluaci??n, autorregulaci??n y mejoramiento.', 'a32'),
('1a39', 'Pol??tica de bienestar para la comunidad institucional.', 'a39'),
('1a47', 'Misi??n, prop??sitos y objetivos institucionales, y mecanismos para su correspondiente actualizaci??n.', 'a47'),
('1a51', 'Evidencias del cumplimiento de las directrices del modelo de gobierno institucional respecto a: ', 'a51'),
('1a52', 'Resultados de la implementaci??n de las pol??ticas y estrategias que promuevan los procesos de autoevaluaci??n, autorregulaci??n y mejoramiento.', 'a52'),
('1a54', 'Descripci??n de los servicios de bienestar que ofrece a la comunidad institucional, actualizada a las din??micas de la nueva vigencia de condiciones institucionales.', 'a54'),
('1b29', 'Descripci??n y resultados de los procedimientos institucionales para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos internos.', 'b29'),
('1b32', 'Descripci??n general del sistema interno de aseguramiento de la calidad.', 'b32'),
('1b39', 'Evoluci??n y an??lisis de tendencias de la deserci??n institucional, teniendo en cuenta las definiciones de deserci??n en los sistemas de informaci??n de la educaci??n superior.', 'b39'),
('1b47', 'Pol??ticas y descripci??n de los procesos para atraer, vincular, desarrollar, \r\nevaluar, retener y desvincular el talento humano.', 'b47'),
('1b49', 'Derechos y deberes de los estudiantes.', 'b49'),
('1b51', 'Resultados de los procedimientos institucionales para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos internos.', 'b51'),
('1b52', 'Resultados de la implementaci??n del sistema interno de aseguramiento de la calidad, en t??rminos de: ', 'b52'),
('1b54', 'Evoluci??n y an??lisis de las tendencias de deserci??n institucional de al menos los ??ltimos 7 a??os, teniendo como referente los sistemas nacionales de informaci??n y las definiciones establecidas por el Ministerio de Educaci??n Nacional.', 'b54'),
('1c13', 'Derechos y deberes de los estudiantes.', 'c13'),
('1c29', 'Marco normativo institucional comunicaciones internas.', 'c29'),
('1c47', 'Descripci??n y valoraci??n cuantitativa y cualitativa de la infraestructura \r\nf??sica y tecnol??gica.', 'c47'),
('1c51', 'Evidencias del cumplimiento del marco normativo institucional para la gesti??n de informaci??n y las comunicaciones internas. ', 'c51'),
('1d29', 'Descripci??n general de los procesos que soportan el desarrollo de la instituci??n.', 'd29'),
('1d47', 'Pol??ticas, y mecanismos para la obtenci??n, planificaci??n, gesti??n y control de recursos financieros.', 'd47'),
('1d51', 'Descripci??n general de los procesos que soportan el desarrollo de la instituci??n, actualizados a las din??micas de la nueva vigencia de condiciones institucionales.', 'd51'),
('1f50', 'Deberes, derechos y obligaciones.', 'f50'),
('1h18', 'Deberes, derechos y obligaciones.', 'h18'),
('2a20', 'Definici??n de los dem??s ??rganos colegiados y sus atribuciones.', 'a20'),
('2a29', 'Proyecto educativo institucional o el que haga sus veces.', 'a29'),
('2a32', 'Resultados de la implementaci??n de las pol??ticas y estrategias que promuevan los procesos de autoevaluaci??n, autorregulaci??n y mejoramiento.', 'a32'),
('2a39', 'Descripci??n de los servicios de bienestar que ofrece a la comunidad institucional.', 'a39'),
('2a47', 'Proyecci??n anual de los instrumentos de planeaci??n que hacen posible la materializaci??n de la misi??n, los prop??sitos y los objetivos institucionales, en el proceso de planeaci??n previsto.', 'a47'),
('2a51', 'Resultados de la implementaci??n de procesos de aprobaci??n de cambios \r\nque tengan implicaciones en la identidad, tipolog??a y misi??n institucional.', 'a51'),
('2a52', 'Resultados de la implementaci??n de los mecanismos para la articulaci??n de los procesos de evaluaci??n institucional y los de cada uno de los integrantes que hacen parte de la comunidad institucional.', 'a52'),
('2a54', 'Indicadores del uso de los servicios de bienestar ofrecidos a la comunidad institucional.', 'a54'),
('2b29', 'Resultados del seguimiento al cumplimiento de los procedimientos institucionales para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos internos a trav??s de las instancias competentes.', 'b29'),
('2b32', 'Descripci??n de la sistematizaci??n, gesti??n y uso de la informaci??n para desarrollar medidas de mejoramiento, que incorpore  la informaci??n registrada en los sistemas de informaci??n de las diferentes entidades estatales.', 'b32'),
('2b39', 'An??lisis de las causas de la deserci??n institucional, teniendo como referente los sistemas nacionales de informaci??n y las definiciones \r\nestablecidas por el Ministerio de Educaci??n Nacional.', 'b39'),
('2b47', 'Descripci??n de los procesos para la inducci??n del talento humano.', 'b47'),
('2b49', 'Condiciones para obtener distinciones e incentivos.', 'b49'),
('2b51', 'Resultados del seguimiento al cumplimiento de los procedimientos internos para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos intemos a trav??s de las instancias competentes.', 'b51'),
('2b52', 'Resultados de la articulaci??n de los planes de mejoramiento con los procesos de planeaci??n de largo, mediano y corto plazo, y con el presupuesto general de la instituci??n.', 'b52'),
('2b54', 'An??lisis de las causas de deserci??n institucional con ??nfasis en los ??ltimos 7 a??os.', 'b54'),
('2c13', 'Condiciones para obtener distinciones e incentivos.', 'c13'),
('2c29', 'Descripci??n de los mecanismos y sistemas para la gesti??n de la informaci??n.', 'c29'),
('2c47', 'Planeaci??n, para los pr??ximos 7 a??os, del uso, apropiaci??n, desarrollo, gesti??n, operaci??n, mantenimiento, renovaci??n y actualizaci??n de la infraestructura f??sica y tecnol??gica, para atender las labores formativas, acad??micas, docentes, cient??ficas, culturales y de extensi??n, as?? como para atender las actividades de bienestar desarrolladas por la poblaci??n que hace parte de la comunidad institucional, que prevea los recursos (financieros, f??sicos y humanos) para su desarrollo.', 'c47'),
('2c51', 'Evidencias de la implementaci??n de mecanismos y sistemas para la gesti??n de la informaci??n.', 'c51'),
('2d29', 'Descripci??n de la estructura organizacional aprobada.', 'd29'),
('2d47', 'Descripci??n de los mecanismos de divulgaci??n de las pol??ticas financieras.', 'd47'),
('2d51', 'Resultados de la evaluaci??n de procesos, cargos y funciones.', 'd51'),
('2f50', 'Criterios, requisitos y procesos para la selecci??n, vinculaci??n, otorgamiento de distinciones y est??mulos, evaluaci??n de desempe??o y desvinculaci??n.', 'f50'),
('2h18', 'Criterios, requisitos y procesos para la selecci??n, vinculaci??n, otorgamiento de distinciones y est??mulos, evaluaci??n de desempe??o y desvinculaci??n.', 'h18'),
('3a20', 'Definici??n del quorum en los ??rganos decisorios.', 'a20'),
('3a29', 'Descripci??n de los procesos para la aprobaci??n de cambios que tengan implicaciones en la identidad, tipolog??a y misi??n institucional.', 'a29'),
('3a32', 'Descripci??n de mecanismos para la articulaci??n de los procesos de evaluaci??n institucional y de la comunidad acad??mica.', 'a32'),
('3a39', 'Indicadores del uso de los servicios de bienestar ofrecidos a la comunidad Institucional.', 'a39'),
('3a51', 'Evidencia de la implementaci??n de los procesos que soportan el sistema \r\nde aseguramiento interno de la calidad y la planeaci??n institucional.', 'a51'),
('3a54', 'Evidencia de la implementaci??n de los mecanismos de comunicaci??n y de difusi??n de los servicios disponibles para la comunidad institucional.', 'a54'),
('3b29', 'Evidencias de la utilizaci??n de los medios dispuestos para que la comunidad acad??mica tenga claridad de las instancias competentes y los procedimientos para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos internos.', 'b29'),
('3b32', 'Definici??n de los criterios de calidad frente a los cuales se puede determinar el logro de los prop??sitos establecidos.', 'b32'),
('3b39', 'Descripci??n de las estrategias que fueron consideradas para reducir la deserci??n.', 'b39'),
('3b47', 'Descripci??n de los procesos para la evaluaci??n regular de las contrataciones, los nombramientos, el desempe??o y la retenci??n del talento humano.', 'b47'),
('3b49', 'Pol??ticas, criterios, requisitos y procesos de inscripci??n, admisi??n, ingreso, reingreso, transferencias, matr??cula y evaluaci??n.', 'b49'),
('3b51', 'Evidencias de la utilizaci??n de los medios dispuestos para que la comunidad acad??mica tenga claridad de las instancias competentes y los procedimientos para la formulaci??n, aprobaci??n, comunicaci??n y actualizaci??n de los reglamentos internos.', 'b51'),
('3b54', 'Descripci??n cualitativa y cuantitativa de la ejecuci??n y resultados de las actividades y recursos para la prevenci??n de la deserci??n y la promoci??n de la graduaci??n de los estudiantes en los ??ltimos 7 a??os, comparada con las actividades y recursos que se ten??an proyectadas para el mismo periodo, con la respectiva justificaci??n de las diferencias significativas.', 'b54'),
('3c13', 'Pol??ticas, criterios, requisitos y procesos de inscripci??n, admisi??n, ingreso, reingreso, transferencias, matr??cula y evaluaci??n.', 'c13'),
('3c29', 'Procedimientos para el suministro peri??dico y actualizado de la informaci??n a los sistemas nacionales de informaci??n.', 'c29'),
('3c47', 'Permisos y autorizaciones expresas de la autoridad competente para el uso de la infraestructura y del suelo, que deber?? disponer la instituci??n para el desarrollo de sus actividades administrativas y acad??micas (ocupaci??n y altura).', 'c47'),
('3c51', 'Indicadores que demuestren que la informaci??n que facilite la planeaci??n, monitoreo y evaluaci??n de las actividades institucionales y la toma decisiones, es veraz, oportuna, precisa, completa y confiable.', 'c51'),
('3d29', 'Definici??n de cargos en n??mero y funciones.', 'd29'),
('3d47', 'Indicadores relacionados con la ejecuci??n de la planeaci??n financiera, gesti??n y control de recursos.', 'd47'),
('3f50', 'Criterios de dedicaci??n, disponibilidad y permanencia.', 'f50'),
('3h18', 'Criterios de dedicaci??n, disponibilidad y permanencia.', 'h18'),
('4a20', 'Definici??n de las funciones, periodo y forma de elecci??n del rector o rectores y vicerrectores, o los cargos equivalentes. ', 'a20'),
('4a29', 'Descripci??n de los procesos para soportar el sistema interno de aseguramiento de la calidad y la planeaci??n institucional. ', 'a29'),
('4a39', 'Descripci??n de los mecanismos de comunicaci??n y de difusi??n de los servicios disponibles para la comunidad institucional.', 'a39'),
('4a51', 'Evidencia de la presentaci??n de informes de rendici??n de cuentas.', 'a51'),
('4a54', 'Evoluci??n de los resultados de los procesos de evaluaci??n de los servicios de bienestar por parte de la comunidad institucional, que brinden informaci??n de la manera en que se realiz?? la evaluaci??n.', 'a54'),
('4b29', 'Pol??ticas acad??micas asociadas a curr??culo, resultados de aprendizaje, cr??ditos y actividades.', 'b29'),
('4b32', 'Doscripci??n de los mecanismos para evidenciar la evoluci??n del cumplimiento de las condiciones de calidad de los resultados acad??micos.', 'b32'),
('4b39', 'Proyecci??n semestral o anual, para los pr??ximos 7 a??os, de actividades y recursos requeridos para la prevenci??n de la deserci??n y la promoci??n de la graduaci??n de los estudiantes.', 'b39'),
('4b47', 'Resultado de la ??ltima evaluaci??n y retroalimentaci??n realizada al desempe??o del talento humano.', 'b47'),
('4b49', 'R??gimen disciplinario. ', 'b49'),
('4b51', 'Evidencia de la implementaci??n de las pol??ticas acad??micas asociadas a curr??culo, resultados de aprendizaje, cr??ditos y actividades, que incluya: ', 'b51'),
('4b54', 'Proyecciones para los pr??ximos 7 a??os de actividades y recursos para la prevenci??n de la deserci??n y la promoci??n de la graduaci??n de los estudiantes.', 'b54'),
('4c13', 'R??gimen disciplinario.', 'c13'),
('4c29', 'Evidencia de informaci??n actualizada en los sistemas nacionales de informaci??n y Suministrada en los tiempos requeridos por los entes respectivos.', 'c29'),
('4c47', 'Evidencias que demuestren que la instituci??n cumple con la normatividad vigente relacionada con regulaciones ambientales, de seguridad, de sismo resistencia y de accesibilidad, y con condiciones f??sicas como ventilaci??n, iluminaci??n y mobiliario, de acuerdo con el tama??o y caracter??sticas de la poblaci??n que est?? vinculada a la instituci??n.', 'c47'),
('4c51', 'Evidencia de informaci??n actualizada en los sistemas nacionales de informaci??n y suministrada en los tiempos requeridos por los entes respectivos.', 'c51'),
('4d29', 'Descripci??n de los mecanismos para la evaluaci??n y actualizaci??n de procesos, organizaci??n y cargos.', 'd29'),
('4d47', 'Proyecci??n, para los pr??ximos 7 a??os, de la planeaci??n financiera, de acuerdo con la naturaleza jur??dica de la instituci??n.', 'd47'),
('4f50', 'Participaci??n en procesos de autoevaluaci??n.', 'f50'),
('4h18', 'Participaci??n en procesos de autoevaluaci??n.', 'h18'),
('5a20', 'Delegaciones de funciones directivas, cuando aplique.', 'a20'),
('5a29', 'Descripci??n de los mecanismos de rendici??n de cuentas.', 'a29'),
('5a39', 'Evidencia de la implementaci??n de los mecanismos de comunicaci??n y de difusi??n de los servicios disponibles para la comunidad institucional.', 'a39'),
('5a51', 'Resultados de la implementaci??n de los mecanismos de rendici??n de \r\ncuentas.', 'a51'),
('5a54', 'Resultados de los procesos de gesti??n de peticiones, quejas y reclamos de la comunidad institucional.', 'a54'),
('5b29', 'Pol??ticas de gesti??n institucional y bienestar.', 'b29'),
('5b32', 'Desenpci??n de los mecanismos que recojan la apreciaci??n de la comunidad acad??mica y de los diferentes grupos de inter??s y forma de sistematizaci??n de sus apreciaciones.', 'b32'),
('5b39', ' Descripci??n de los procesos asociados a la identificaci??n de alertas tempranas ante las posibilidades de deserci??n, de acuerdo con la informaci??n cualitativa y cuantitativa de los estudiantes para mejorar su permanencia y graduaci??n.', 'b39'),
('5b49', 'Homologaci??n y reconocimiento de aprendizajes entre programas de la misma instituci??n o de otras instituciones (nacionales y/o extranjeras).', 'b49'),
('5b51', 'Evidencia de la implementaci??n de las pol??ticas de gesti??n institucional y bienestar, que incluya: ', 'b51'),
('5b54', 'Resultados de los procesos asociados a la identificaci??n de alertas tempranas ante las posibilidades de deserci??n de acuerdo con la informaci??n cualitativa y cuantitativa para mejorar el bienestar, la permanencia y la graduaci??n de los estudiantes en la instituci??n.', 'b54'),
('5c13', 'Homologaci??n y reconocimiento de aprendizajes entre programas de misma instituci??n o de otras instituciones (nacionales y/o extranjeras).', 'c13'),
('5c29', 'Descripci??n de las medidas de seguridad electr??nica para la protecci??n de datos para evitar su adulteraci??n, p??rdida, consulta, uso o acceso no autorizado o fraudulento.', 'c29'),
('5c47', 'Descripci??n de estrategias y mecanismos para avanzar gradualmente en las condiciones de accesibilidad de la comunidad institucional, de acuerdo con la normatividad vigente.', 'c47'),
('5c51', 'Evidencia del cumplimiento de las medidas de seguridad electr??nica para la protecci??n de datos y para evitar su adulteraci??n, p??rdida, consulta, uso o acceso no autorizado o fraudulento.', 'c51'),
('5d47', 'Resultados comparativos de la formulaci??n y ejecuci??n del presupuesto tanto de funcionamiento como de inversi??n discriminados por rubro or funci??n misional, de al menos los ??ltimos 2 a??os.', 'd47'),
('5f50', 'Trayectoria profesoral, o lo que haga sus veces.', 'f50'),
('5h18', 'Trayectoria profesoral, o lo que haga sus veces.', 'h18'),
('6a29', 'Descripci??n de los espacios de participaci??n de la comunidad acad??mica.', 'a29'),
('6a39', 'Descripci??n de los procesos de evaluaci??n de los servicios de bienestar por parte de la comunidad institucional.', 'a39'),
('6a51', 'Evidencias de participaci??n de la comunidad institucional en los diferentes espacios, al menos en el ??ltimo a??o.', 'a51'),
('6a54', 'Evidencia de la implementaci??n de apoyos tecnol??gicos y acompa??amientos disponibles de manera ininterrumpida, para abordar las preguntas y los problemas de car??cter t??cnico de los estudiantes, cuando aplique.', 'a54'),
('6b29', 'Pol??ticas de investigaci??n, innovaci??n y/o creaci??n art??stica y cultural, seg??n corresponda.', 'b29'),
('6b32', '??ltimos resultados de apreciaci??n institucional de la comunidad acad??mica y de los diferentes grupos de inter??s, y evoluci??n de los mismos, en caso de contar con la informaci??n para m??s de un periodo.', 'b32'),
('6b39', 'Descripci??n de los mecanismos de apoyo financiero a los estudiantes cuando as?? se requiera y cuando la instituci??n disponga de los recursos.', 'b39'),
('6b49', 'Requisitos de grado.', 'b49'),
('6b51', 'Evidencia de la implementaci??n de las pol??ticas de investigaci??n, innovaci??n, creaci??n art??stica y cultural, que incluya, por lo menos: ', 'b51'),
('6b54', 'Resultados de la ejecuci??n de mecanismos de apoyo financiero a estudiantes, cuando as?? se requiera.', 'b54'),
('6c13', 'Requisitos de grado.', 'c13'),
('6c47', 'Descripci??n de los procesos de asignaci??n de la infraestructura f??sica y tecnol??gica a la comunidad, para su uso, de manera que se garantice su disponibilidad.', 'c47'),
('6d47', 'Presupuesto institucional del a??o en curso y proyectado, con sus respectivos mecanismos de control para los siguientes 7 a??os, tanto de funcionamiento como de inversi??n, discriminados por rubro y por funci??n misional, de acuerdo con la naturaleza jur??dica de la instituci??n.', 'd47'),
('6f50', 'impedimentos, inhabilidades, incompatibilidades y conflicto de intereses.', 'f50'),
('6h18', 'impedimentos, inhabilidades, incompatibilidades y conflicto de intereses.', 'h18'),
('7a39', 'Resultados de los procesos de evaluaci??n de los servicios de bienestar por parte de la comunidad institucional.', 'a39'),
('7a54', 'Evidencia del acceso de estudiantes a los servicios de bienestar en los escenarios pr??ctica o espacios formativos asociados a la modalidad dual, cuando aplique.', 'a54'),
('7b32', 'Descripci??n del ??ltimo proceso de autoevaluaci??n y autorregulaci??n institucional.', 'b32'),
('7b39', 'Descripci??n de los mecanismos de acompa??amiento que atienden las necesidades de cada uno de los estudiantes de manera efectiva.', 'b39'),
('7b54', 'Evidencia de la implementaci??n de mecanismos de interacci??n sistem??tica entre estudiantes y entre profesores y estudiantes.', 'b54'),
('7c47', 'Evidencias e indicadores acerca del uso de la infraestructura f??sica y tecnol??gica.', 'c47'),
('7d47', 'Evidencia de que la instituci??n reporta la informaci??n financiera que reposa en sus documentos oficiales, a los sistemas nacionales de informaci??n.', 'd47'),
('7f50', 'R??gimen disciplinario.', 'f50'),
('7h18', 'R??gimen disciplinario.', 'h18'),
('8a39', 'Descripci??n de los procesos de gesti??n de peticiones, quejas y reclamos de la comunidad institucional.', 'a39'),
('8b32', 'Descripci??n de los mecanismos que permiten procesos continuos de autoevaluaci??n y autorregulaci??n.', 'b32'),
('8b39', 'Descripci??n de los mecanismos de interacci??n sistem??tica entre estudiantes y entre profesores y estudiantes.', 'b39'),
('8c47', 'Evidencias que demuestren que la instituci??n cuenta con las licencias para uso de los recursos, conforme a la normatividad vigente sobre propiedad intelectual.', 'c47'),
('9a39', 'Descripci??n de los apoyos tecnol??gicos y acompa??amientos, disponibles de manera ininterrumpida para abordar las preguntas y los problemas de car??cter t??cnico de los estudiantes, cuando aplique.', 'a39'),
('9b32', 'Ultimo informe de autoevaluaci??n, autorregulaci??n institucional o lo que haga sus veces, de acuerdo con su sistema intemo de aseguramiento de la calidad.', 'b32'),
('9c47', 'Cuando aplique, los acuerdos de voluntades, convenios o contratos, utilizados para demostrar la disponibilidad de la infraestructura f??sica y tecnol??gica, deber??n incluir en sus cl??usulas, los alcances de la disponibilidad de esta infraestructura en t??rminos de horarios y capacidad, por lo menos, durante la vigencia del concepto favorable de las condiciones institucionales.', 'c47');

INSERT INTO `tblsubnumeral` (`id`, `descripcion`, `fkidnumeral`) VALUES
('11a51', 'Definici??n de los ??rganos de gobierno y sus respectivas funciones.', '1a51'),
('11b52', 'Implementaci??n y uso de la informaci??n para proponer y desarrollar medidas de mejoramiento.', '1b52'),
('12a51', 'Definici??n de los dem??s ??rganos colegiados y sus atribuciones.', '1a51'),
('12b52', 'Definici??n de los criterios de calidad frente a los cuales se puede determinar el logro de los prop??sitos establecidos.', '1b52'),
('13a51', 'Definici??n del quorum de los ??rganos decisorios.', '1a51'),
('13b52', 'Evoluci??n del cumplimiento de las condiciones de calidad de los resultados acad??micos.', '1b52'),
('14a51', 'Definici??n de las funciones, periodo y forma de elecci??n del rector o rectores y vicerrectores, o los cargos equivalentes.', '1a51'),
('14b52', 'Evoluci??n de los resultados de apreciaci??n institucional de la comunidad acad??mica y de los diferentes grupos de inter??s.', '1b52'),
('15a51', 'Delegaciones de funciones directivas, cuando aplique.', '1a51'),
('15b52', 'Descripci??n de los procesos de autoevaluaci??n y autorregulaci??n realizados durante la ??ltima vigencia de condiciones institucionales.', '1b52'),
('16b52', 'Informes de autoevaluaci??n y autorregulaci??n institucional realizados durante la ??ltima vigencia de condiciones institucionales.', '1b52'),
('17b52', 'Evoluci??n de autoevaluaci??n institucional.', '1b52'),
('18b52', 'Descripci??n cuantitativa de la ejecuci??n del plan de mejoramiento institucional en los ??ltimos 7 a??os, comparada con el plan de mejoramiento que se ten??a proyectado para el mismo periodo con la respectiva justificaci??n en las diferencias significativas.', '1b52'),
('19b52', 'Plan de mejoramiento institucional actualizado o el instrumento equivalente.', '1b52'),
('41b51', 'En cuanto al curr??culo: ', '4b51'),
('42b51', 'En cuanto a los resultados de aprendizaje: ', '4b51'),
('43b51', 'En cuanto a cr??ditos y actividades acad??micas: ', '4b51'),
('51b51', 'Evidencias de la implementaci??n de las directrices ??ticas que rigen a la comunidad institucional.', '5b51'),
('52b51', 'Resultados de la aplicaci??n de los conceptos de equidad, diversidad e inclusi??n, seg??n el alcance definido.', '5b51'),
('53b51', 'Evidencias e indicadores de asignaci??n, gesti??n y ejecuci??n de recursos institucionales para el desarrollo del bienestar institucional.', '5b51'),
('54b51', 'Evidencia de la implementaci??n de orientaciones a las actividades de gesti??n necesarias para cumplir los prop??sitos institucionales.', '5b51'),
('61b51', 'Evidencias del cumplimiento de la declaraci??n institucional expresa del ??nfasis de investigaci??n, innovaci??n, creaci??n art??stica y cultural garantizando que existe la investigaci??n necesaria que enriquece el proceso formativo y que fomenta, fortalece y desarrolla la ciencia, tecnolog??a y la innovaci??n.', '6b51'),
('62b51', 'Evidencias de la promoci??n de la ??tica de la investigaci??n, innovaci??n, creaci??n art??stica y cultural, su pr??ctica responsable y el cumplimiento de la reglamentaci??n de propiedad intelectual. ', '6b51'),
('63b51', 'Indicadores de la disposici??n de recursos humanos, tecnol??gicos y financieros en el desarrollo de la investigaci??n, innovaci??n, y/o creaci??n art??stica y cultural, en coherencia con los programas y las modalidades que ofrece.', '6b51');

INSERT INTO `tblsub_subnumeral` (`id`, `descripcion`, `fkidsubnumeral`) VALUES
('411b51', 'Evidencia de la implementaci??n de principios b??sicos de dise??o del contenido curricular y de las actividades acad??micas relacionadas con la formaci??n integral.', '41b51'),
('412b51', 'Evidencia de la implementaci??n de la forma en c??mo el curr??culo procura la interdisciplinariedad, a partir de su contenido y de las actividades acad??micas.', '41b51'),
('413b51', 'Evidencia de la implementaci??n de componentes que la instituci??n considere necesarios para cumplir con los resultados de aprendizaje previstos.', '41b51'),
('421b51', 'Resultado de la implementaci??n de los procesos de validaci??n y aprobaci??n de los resultados de aprendizaje, en coherencia con los lineamientos institucionales.', '42b51'),
('422b51', 'Resultado de la evaluaci??n de los resultados de aprendizaje previstos para el final del proceso formativo, en coherencia con el perfil del egresado y en consonancia con los lineamientos institucionales.', '42b51'),
('431b51', 'Evidencia de la implementaci??n de directrices institucionales para la definici??n de la relaci??n entre las horas de interacci??n con el profesor y las horas de trabajo independiente. ', '43b51'),
('432b51', 'Evidencia del desarrollo de las actividades acad??micas de acuerdo con la definici??n institucional de las mismas.', '43b51');

INSERT INTO `tbltitulo` (`id`, `nombre`) VALUES
('1', 'OBJETO, ??MBITO DE APLICACI??N Y GENERALIDADES'),
('2', 'DE LAS CONDICIONES INSTITUCIONALES'),
('3', 'DE LA RENOVACI??N DE CONDICIONES INSTITUCIONALES');

-- ??ndices para tablas volcadas

ALTER TABLE tblarticulo
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblarticulo_tbltiyulo1 (fkidtitulo),
  ADD KEY fk_tblarticulo_tblcapitulo1 (fkidcapitulo),
  ADD KEY fk_tblarticulo_tblseccion1 (fkidseccion);

ALTER TABLE tblcapitulo
  ADD PRIMARY KEY (id);

ALTER TABLE tblestado
  ADD PRIMARY KEY (id);

ALTER TABLE tblliteral
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblliteral_tblarticulo1 (fkidarticulo);

ALTER TABLE tblnumeral
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblnumeral_tblliteral1 (fkidliteral);

ALTER TABLE tblparagrafo
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblparagrafo_tblarticulo1 (fkidarticulo);

ALTER TABLE tblseccion
  ADD PRIMARY KEY (id);

ALTER TABLE `tblsubnumeral`
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblsubnumeral_tblnumeral1 (fkidnumeral);

ALTER TABLE tblsub_subnumeral
  ADD PRIMARY KEY (id),
  ADD KEY fk_tblsub_subnumeral_tblsubnumeral1 (fkidsubnumeral);

ALTER TABLE tbltipoevidencia
  ADD PRIMARY KEY (id);

ALTER TABLE tbltitulo
  ADD PRIMARY KEY (id);

-- Restricciones para tablas volcadas

ALTER TABLE tblarticulo
  ADD CONSTRAINT fk_tblarticulo_tblcapitulo1 FOREIGN KEY (fkidcapitulo) REFERENCES tblcapitulo (id),
  ADD CONSTRAINT fk_tblarticulo_tblseccion1 FOREIGN KEY (fkidseccion) REFERENCES tblseccion (id),
  ADD CONSTRAINT fk_tblarticulo_tbltiyulo1 FOREIGN KEY (fkidtitulo) REFERENCES tbltitulo (id);

ALTER TABLE tblliteral
  ADD CONSTRAINT fk_tblliteral_tblarticulo1 FOREIGN KEY (fkidarticulo) REFERENCES tblarticulo (id);

ALTER TABLE tblnumeral
  ADD CONSTRAINT fk_tblnumeral_tblliteral1 FOREIGN KEY (fkidliteral) REFERENCES tblliteral (id);

ALTER TABLE tblparagrafo
  ADD CONSTRAINT fk_tblparagrafo_tblarticulo1 FOREIGN KEY (fkidarticulo) REFERENCES tblarticulo (id);

ALTER TABLE tblsubnumeral
  ADD CONSTRAINT fk_tblsubnumeral_tblnumeral1 FOREIGN KEY (fkidnumeral) REFERENCES tblnumeral (id);

ALTER TABLE tblsub_subnumeral
  ADD CONSTRAINT fk_tblsub_subnumeral_tblsubnumeral1 FOREIGN KEY (fkidsubnumeral) REFERENCES tblsubnumeral (id);
COMMIT;

-- Relaciones evidencias a todo

CREATE TABLE EvidenceToArticulo (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	articulo_id varchar(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (articulo_id) REFERENCES tblarticulo(id)
);

CREATE TABLE EvidenceToLiteral (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	literal_id varchar(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (literal_id) REFERENCES tblliteral(id)
);

CREATE TABLE EvidenceToNumeral (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	numeral_id varchar(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (numeral_id) REFERENCES tblnumeral(id)
);

CREATE TABLE EvidenceToParagrafo (
	id INT NOT NULL AUTO_INCREMENT,
	evidence_id INT NOT NULL,
	paragrafo_id varchar(10) NOT NULL,
	PRIMARY KEY (id),
	FOREIGN KEY (evidence_id) REFERENCES evidence(id),
	FOREIGN KEY (paragrafo_id) REFERENCES tblparagrafo(id)
);

-- Procedures

DELIMITER //

-- User Procedures

CREATE PROCEDURE getUserList()
BEGIN
	SELECT * FROM user;
END //

CREATE PROCEDURE getUser(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM user WHERE id=idVal;
END //

CREATE PROCEDURE createUser(IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	INSERT INTO user VALUES (NULL, userVal, passwordVal);
END //

CREATE PROCEDURE updateUser(IN idVal INT, IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	UPDATE user SET user=userVal, password=passwordVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteUser(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM user WHERE id=idVal;
END //

CREATE PROCEDURE login(IN userVal VARCHAR(30), IN passwordVal VARCHAR(30))
BEGIN
	SELECT u.user as user, r.role as role FROM user u
	INNER JOIN userrole ur ON u.id = ur.user_id
	INNER JOIN role r ON ur.role_id = r.id
	WHERE u.user=userVal AND u.password=passwordVal;
END //

-- Roles Procedures

CREATE PROCEDURE getRoleList()
BEGIN
	SELECT * FROM role;
END //

CREATE PROCEDURE createUserRole(IN idVal INT, IN idRolVal INT)
BEGIN
	INSERT INTO userRole VALUES (NULL, idVal, idRolVal);
END //

-- Evidence procedures

CREATE PROCEDURE getEvidenceList()
BEGIN
	SELECT e.*, sc.state AS state
	FROM evidence e
	INNER JOIN (
		SELECT a.*
		FROM evidencestatechanges a
		LEFT JOIN evidencestatechanges b
		ON a.evidence_id = b.evidence_id AND a.created_at < b.created_at
		WHERE b.evidence_id is NULL) sc ON (sc.evidence_id = e.id)
	ORDER BY e.id;
END //

CREATE PROCEDURE getEvidence(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM evidence WHERE id=idVal;
END //

CREATE PROCEDURE createEvidence(IN titleVal VARCHAR(100), IN descriptionVal VARCHAR(200), IN dirVal VARCHAR(200), IN tipeVal VARCHAR(30), IN latVal INT, IN lonVal INT)
BEGIN
	INSERT INTO evidence VALUES (NULL, titleVal, descriptionVal, dirVal, tipeVal, latVal, lonVal, NULL);
END //

CREATE PROCEDURE createEvidenceStateChanges(IN evidence_idVal INT, IN user_idVal INT, IN descriptionVal VARCHAR(200), IN stateVal VARCHAR(200))
BEGIN
	INSERT INTO evidenceStateChanges VALUES (NULL, evidence_idVal, user_idVal, descriptionVal, stateVal, NULL);
END //

CREATE PROCEDURE updateEvidence(IN idVal INT, IN titleVal VARCHAR(100), IN descriptionVal VARCHAR(200), IN dirVal VARCHAR(200), IN tipeVal VARCHAR(30), IN latVal INT, IN lonVal INT)
BEGIN
	UPDATE evidence SET title = titleVal, description = descriptionVal, dir = dirVal, tipe = tipeVal, lat = latVal, lon = lonVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteEvidence(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM evidence WHERE id=idVal;
END //

-- Author procedures

CREATE PROCEDURE getAuthorsList()
BEGIN
	SELECT * FROM author;
END //

CREATE PROCEDURE getAuthor(IN idVal VARCHAR(30))
BEGIN
	SELECT * FROM author WHERE id=idVal;
END //

CREATE PROCEDURE createAuthor(IN nameVal VARCHAR(100))
BEGIN
	INSERT INTO author VALUES (NULL, nameVal);
END //

CREATE PROCEDURE updateAuthor(IN idVal INT, IN nameVal VARCHAR(100))
BEGIN
	UPDATE author SET name = nameVal WHERE id=idVal;
END //

CREATE PROCEDURE deleteAuthor(IN idVal VARCHAR(30))
BEGIN
	DELETE FROM author WHERE id=idVal;
END //

CREATE PROCEDURE createEvidenceAuthor(IN idVal INT, IN idAuthorVal INT)
BEGIN
	INSERT INTO evidenceAuthor VALUES (NULL, idVal, idAuthorVal);
END //

DELIMITER ;

-- Insert Data

INSERT INTO user VALUES (NULL, 'admin', 'admin');
INSERT INTO role VALUES (NULL, 'administrator');
INSERT INTO userRole VALUES (NULL, 1, 1);

INSERT INTO user VALUES (NULL, 'checker', 'checker');
INSERT INTO role VALUES (NULL, 'checker');
INSERT INTO userRole VALUES (NULL, 2, 2);

INSERT INTO user VALUES (NULL, 'validator', 'validator');
INSERT INTO role VALUES (NULL, 'validator');
INSERT INTO userRole VALUES (NULL, 3, 3);

INSERT INTO user VALUES (NULL, 'allroles', 'allroles');
INSERT INTO userRole VALUES (NULL, 4, 1);
INSERT INTO userRole VALUES (NULL, 4, 2);
INSERT INTO userRole VALUES (NULL, 4, 3);

INSERT INTO evidence VALUES (NULL, 'Resolucion', '123', 'abc', 'def', 1, 2, NULL);
INSERT INTO evidenceStateChanges VALUES (NULL, 1, 1, '', 'unverified', NULL);
INSERT INTO author VALUES (NULL, 'author');
