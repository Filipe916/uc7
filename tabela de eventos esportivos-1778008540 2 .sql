CREATE TABLE IF NOT EXISTS `atletas` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`nome` varchar(255) NOT NULL,
	`sobrenome` varchar(255) NOT NULL,
	`telefone` varchar(255) NOT NULL,
	`cpf` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`nascimento` date NOT NULL,
	PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `kit` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_atleta` varchar(255) NOT NULL,
	`alimentacao` varchar(255) NOT NULL,
	`hidratacao` varchar(255) NOT NULL,
	`equipamento` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `eventos` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id.inscricoes` varchar(255) NOT NULL,
	`endereco` varchar(255) NOT NULL,
	`tipo` varchar(255) NOT NULL,
	`horario` timestamp NOT NULL,
	`data` date NOT NULL,
	PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `categoria` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`esporte` varchar(255) NOT NULL,
	`divisao` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);
CREATE TABLE IF NOT EXISTS `inscricoes` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id_atleta` int NOT NULL,
	`id_evento` varchar(255) NOT NULL,
	`id.categoria` varchar(255) NOT NULL,
	`id.patrocinador` varchar(255) NOT NULL,
	PRIMARY KEY (`id`),
	CONSTRAINT `uq_inscricoes_atleta_evento` UNIQUE (id.atletas, id.eventos)
);
CREATE TABLE IF NOT EXISTS `patrocinadores` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`id.patrocinador` varchar(255) NOT NULL,
	`nome` varchar(255) NOT NULL,
	`sobrenome` varchar(255) NOT NULL,
	`telefone` varchar(255) NOT NULL,
	`cpf` varchar(255) NOT NULL,
	`cnpj` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`valor` decimal(10,0) NOT NULL,
	PRIMARY KEY (`id`)
);
ALTER TABLE `kit` ADD CONSTRAINT `kit_fk1` FOREIGN KEY (`id_atleta`) REFERENCES `eventos`(`id`);
ALTER TABLE `inscricoes` ADD CONSTRAINT `inscricoes_fk1` FOREIGN KEY (`id_atleta`) REFERENCES `atletas`(`id`);
ALTER TABLE `inscricoes` ADD CONSTRAINT `inscricoes_fk2` FOREIGN KEY (`id_evento`) REFERENCES `eventos`(`id`);
ALTER TABLE `inscricoes` ADD CONSTRAINT `inscricoes_fk3` FOREIGN KEY (`id.categoria`) REFERENCES `categoria`(`id`);
ALTER TABLE `inscricoes` ADD CONSTRAINT `inscricoes_fk4` FOREIGN KEY (`id.patrocinador`) REFERENCES `patrocinadores`(`id`);
ALTER TABLE `patrocinadores` ADD CONSTRAINT `patrocinadores_fk1` FOREIGN KEY (`id.patrocinador`) REFERENCES `patrocinadores`(`id`);
ALTER TABLE `patrocinadores` ADD CONSTRAINT `patrocinadores_fk8` FOREIGN KEY (`valor`) REFERENCES `patrocinadores`(`id`);