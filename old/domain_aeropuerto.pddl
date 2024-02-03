(define (domain airport)

(:requirements :typing :equality :negative-preconditions)


(:types
    locatable place capacity - object 
    suitcase machine wagon - locatable
)


(:predicates

    ( at ?l - locatable ?p - place )

    ( attached ?w - wagon ?m  - (either wagon machine) )
    
    ( in ?s - suitcase ?w - wagon )

    ( intrain ?w - ( either wagon machine ) ?m - machine )

    ( capacity_order ?l - capacity ?u - capacity )

    ( suspicious ?s - suitcase )

    ( no_suspicious ?s - suitcase )

    ( ocupation ?w - wagon  ?c  - capacity )
    
    ( conection ?p1 - place ?p2 - place )

    ( last ?w - (either wagon machine) ?m - machine )

    ;( max-ocupation ?c - capacity )

    ( min-ocupation ?c - capacity )

    ( inspection ?i - place )

    ( retrieve ?r - place )

    ( no_retrieve ?nr - place )

)


(:action move
    :parameters (?machine - machine ?place1 ?place2 - place)
    :precondition (and
        ( at ?machine ?place1)
        ( conection ?place1 ?place2)
    )
    :effect (and 
        ( not (at ?machine ?place1) )
        ( at ?machine ?place2 )
    )
)

(:action attach
    :parameters (
        ?wagon - wagon
        ?tail - ( either wagon machine)
        ?machine - machine
        ?place - place
        ?capacity ?min_capacity - capacity
        ;?maxc - capacity
    )
    :precondition (and 
        ( last ?tail ?machine )
        ( intrain ?tail ?machine )

        ( at ?wagon ?place )
        ( at ?machine ?place )
        ( ocupation ?wagon  ?capacity )
        ( min-ocupation ?min_capacity )
        ;( = ?c c0)
        
    )
    :effect (and 
        ( not ( at ?wagon ?place ) )
        ( not ( last ?tail ?machine ))
        ( last ?wagon ?machine )
        ( attached ?wagon ?tail )
        ( intrain ?wagon ?machine )
    )
)

(:action detach
    :parameters (
        ?tail - wagon
        ?newtail - (either wagon machine)
        ?machine - machine
        ?place - place
        ?capacity ?min_capacity - capacity
    )
    :precondition ( and
        ( at ?machine ?place)
        ( intrain ?tail ?machine )
        ( last ?tail ?machine )
        ( attached ?tail ?newtail )
        ( ocupation ?tail ?capacity )
        ( min-ocupation ?min_capacity )
    )
    :effect ( and
        ( not ( intrain ?tail ?machine ) )
        ( not ( attached ?tail ?newtail ) )
        ( not ( last ?tail ?machine ) )
        ( last ?newtail ?machine )
        ( at ?tail ?place )
    )
)

(:action inspect
    :parameters (
        ?suitcase - suitcase
        ?place - place
    )
    :precondition (and 
        ( at ?suitcase ?place )
        ( inspection ?place )
        ( suspicious ?suitcase )
    )
    :effect (and
        ( not ( suspicious ?suitcase ) ) 
        ( no_suspicious ?suitcase )
    )
)


(:action load
    :parameters (
        ?wagon - wagon
        ?machine - machine
        ?suitcase - suitcase
        ?place - place
        ?c_current ?c_next - capacity
    )
    :precondition ( and 
        ( at ?machine ?place )
        ( intrain ?wagon ?machine )
        ( at ?suitcase ?place )

        ( ocupation ?wagon  ?c_current )
        ( capacity_order ?c_current ?c_next )
    )
    :effect (and 
        ; update suitcase location
        ( not ( at ?suitcase ?place ) )
        ( in ?suitcase ?wagon )

        ; update ocupation
        ( not (ocupation ?wagon  ?c_current) )
        ( ocupation ?wagon  ?c_next )

    )
)

(:action unload
    :parameters (
        ?wagon - wagon
        ?machine - machine
        ?suitcase - suitcase
        ?place - place
        ?c_current ?c_prev - capacity
    )
    :precondition (and
        ( no_retrieve ?place )
        ; ( not ( retrieve ?place ) )
        ( at ?machine ?place )
        ( intrain ?wagon ?machine )
        ( in ?suitcase ?wagon )
        
        ( ocupation ?wagon  ?c_current )
        ( capacity_order ?c_prev ?c_current )
    )
    :effect (and 
        ; update suitcase location
        ( not ( in ?suitcase ?wagon ) )
        ( at ?suitcase ?place )

        ; update ocupation
        ( not (ocupation ?wagon  ?c_current) )
        ( ocupation ?wagon ?c_prev )
    )
)


(:action deliver
    :parameters (
        ?wagon - wagon
        ?machine - machine
        ?suitcase - suitcase
        ?place - place
        ?c_current ?c_prev - capacity
        )
    :precondition (and 
        ( retrieve ?place )

        ( at ?machine ?place )
        ( intrain ?wagon ?machine )
        ( in ?suitcase ?wagon )
        ( no_suspicious ?suitcase)

        ( ocupation ?wagon  ?c_current )
        ( capacity_order ?c_prev ?c_current )
        
    )
    :effect (and 
        ; update suitcase location
        ( not ( in ?suitcase ?wagon ) )
        ( at ?suitcase ?place )

        ; update ocupation
        ( not (ocupation ?wagon  ?c_current) )
        ( ocupation ?wagon ?c_prev )
    )
)

)
