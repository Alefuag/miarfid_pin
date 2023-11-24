(define (domain aiport)

(:types
    locatable place capacity – object 
    suitcase machine wagon  - locatable
)

(:predicates

    ( at ?x - locatable ?y -place )

    ( attached ?x - wagon ?y  - (either wagon machine) )
    
    ( in ?s - suitcase ?w - wagon )

    (intrain ?w - wagon ?m - machine )

    ( capacity_order ?l - capacity ?u - capacity )

    ( suspicious ?s - suitcase )

    ( ocupation ?w - wagon  ?c  - capacity )
    
    ( conection ?x - place ?y - place )

    ( last ?m - machine ?w - wagon )
)

)