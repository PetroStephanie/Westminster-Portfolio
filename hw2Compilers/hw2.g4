    grammar hw2;

    token
        : (WORD | HYPHEN | SQUOTE | DQUOTE | SENTENCE_END| ORDINAL | CARDINAL | SPACE)
        ;

    WORD
        : [a-zA-Z']+
        ;

    HYPHEN
        : '-'
        ;

    SQUOTE
        : '\''
        ;

    DQUOTE
        : '"'
        ;

    SENTENCE_END
        : '.' | '?' | '!' | '‽'
        ;

    ORDINAL
        : [0-9]+('st' | 'nd' | 'rd' | 'th')
        ;

    CARDINAL
        : [0-9]+
        ;

    SPACE
        : [ \t\r\n]+ -> skip
        ;

