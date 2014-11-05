CREATE TABLE `Phonebook_2` (
`id` int(11) unsigned NOT NULL AUTO_INCREMENT,
`name` varchar(128) NOT NULL,
`phone` varchar(64) NOT NULL,
`birthday` date NOT NULL DEFAULT '0000-00-00',
`note` varchar(200) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
