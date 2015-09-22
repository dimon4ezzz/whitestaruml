// START:header

grammar SqlDdlReader;

options {
    language=CSharp3;
}

// END:header


// START:rules

create_tables
	:	(create_table_stmt | alter_table_stmt)*
	;

create_table_stmt
	: 	CREATE TABLE name { CreateTable($name.value); } 
		'(' table_content? ')' ';'
	;

table_content
	: table_attribute ( ',' additional_table_element)*
	;

additional_table_element
	:	table_attribute
	| 	primary_key_def
	|	foreign_key_def
	;

table_attribute
	:	{ CreateAttribute(); } 
		name { CurrentAttribute().Name = $name.value; }	
		type { CurrentAttribute().Type = $type.value; } 
		null_clause? 
		identity_clause?
		primary_key_clause?
		foreign_key_clause?
	;

name returns [string value]	
	:	ID { $value = $ID.text; }
	;

type returns [string value]	
	:	ID { $value = $ID.text; }
	|	ID '(' INT ')'{ $value = $ID.text + '(' + $INT.text + ')'; }
	;

null_clause
	:	NOT NULL { CurrentAttribute().NotNull = true; }
	|	NULL
	;

identity_clause
	: 	IDENTITY '(' INT ',' INT ')' { CurrentAttribute().Identity = true; }
	;
	
primary_key_clause
	: 	PRIMARY KEY { CurrentAttribute().PrimaryKey = true; }
	;

foreign_key_clause
	:	FOREIGN KEY REFERENCES tableRef=name '(' keyRef=name ')'
		{ SetForeignKey(tableRef, keyRef); }
	;

primary_key_def
	:	PRIMARY KEY CLUSTERED? '(' n1=name { SetPrimaryKey($n1.value); } ( ',' n2=name { SetPrimaryKey($n2.value); }  )* ')'
	;
	
foreign_key_def
	:	FOREIGN KEY '(' attrName=name ')' REFERENCES tableRef=name '(' keyRef=name ')'
		{ SetForeignKey(attrName, tableRef, keyRef); }	
	;
	
alter_table_stmt
	:	foreign_key_stmt
	;	

foreign_key_stmt
	:	ALTER TABLE tableName=name ADD FOREIGN KEY '(' attrName=name ')' REFERENCES tableRef=name '(' keyRef=name ')' 
		{ SetForeignKey(tableName, attrName, tableRef, keyRef); }
	; 

// END:rules


// START:tokens

CREATE 	:	('c'|'C')('r'|'R')('e'|'E')('a'|'A')('t'|'T')('e'|'E') ;

TABLE 	:	('t'|'T')('a'|'A')('b'|'B')('l'|'L')('e'|'E') ;

NOT 	:	('n'|'N')('o'|'O')('t'|'T') ;

NULL 	:	('n'|'N')('u'|'U')('l'|'L')('l'|'L');

IDENTITY :	('i'|'I')('d'|'D')('e'|'E')('n'|'N')('t'|'T')('i'|'I')('t'|'T')('y'|'Y') ;

PRIMARY	:	('p'|'P')('r'|'R')('i'|'I')('m'|'M')('a'|'A')('r'|'R')('y'|'Y') ;

KEY	:	('k'|'K')('e'|'E')('y'|'Y') ;

ALTER 	:	('a'|'A')('l'|'L')('t'|'T')('e'|'E')('r'|'R') ;	

ADD 	:	('a'|'A')('d'|'D')('d'|'D') ; 		
	 
FOREIGN	:	('f'|'F')('o'|'O')('r'|'R')('e'|'E')('i'|'I')('g'|'G')('n'|'N') ;

REFERENCES :	('r'|'R')('e'|'E')('f'|'F')('e'|'E')('r'|'R')('e'|'E')('n'|'N')('c'|'C')('e'|'E')('s'|'S') ;

CLUSTERED :	('c'|'C')('l'|'L')('u'|'U')('s'|'S')('t'|'T')('e'|'E') ('r'|'R')('e'|'E')('d'|'D');

ID 	:		('a'..'z'|'A'..'Z'|'_') ('a'..'z'|'A'..'Z'|'0'..'9'|'_')* ;

INT 	:	'0'..'9'+ ;

COMMENT
    :   '--' ~('\n'|'\r')* '\r'? '\n' {$channel=Hidden;}
    |   '/*' ( options {greedy=false;} : . )* '*/' {$channel=Hidden;}
    ;

WS  :   ( ' '
        | '\t'
        | '\r'
        | '\n'
        ) {$channel=Hidden;}
    ;

// END:tokens