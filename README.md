catalyst_phonebook
==================

Perl Catalyst example.  Phonebook, bootsrap, dataTables - CRUD.
===============================================================

DEMO http://lweb.pl.ua/catalyst

=================================================================
A. You have to modified file ./catalyst/lib/catalyst/Model/Root.pm.<br>
 
        1. Create table for mysql. 
         You can do.
         
         CREATE TABLE `Phonebook` (
			  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
			  `name` varchar(128) NOT NULL,
			  `phone` varchar(64) NOT NULL,
			  `birthday` date NOT NULL DEFAULT '0000-00-00',
			  `note` varchar(200) NOT NULL,
			  PRIMARY KEY (`id`)
			) ENGINE=InnoDB AUTO_INCREMENT=0 DEFAULT CHARSET=utf8;
			
		 OR use file ./mysql.sql	
				   
       2. Add data for connect mysql in file ./catalyst/lib/catalyst/Model/Root.pm
       
          Example:
             connect_info => {
				dsn => 'dbi:mysql:DATABASE',
				user => 'USER',
				password => 'PASSWORD',
				mysql_enable_utf8 => 1
        
			}
       
       DATABASE - name you database for mysql
       USER - mysql user for connect to database
       PASSWORD - user password for connect to database

    B. Run script/catalyst_server.pl -r -d
