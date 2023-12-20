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

    ( ocupation ?w - wagon  ?c  - capacity )
    
    ( conection ?p1 - place ?p2 - place )

    ( last ?w - (either wagon machine) ?m - machine )

    ;( max-ocupation ?c - capacity )

    ( min-ocupation ?c - capacity )

    ( inspection ?i - place )
    ( retrieve ?r - place )

    ; anyadir oficina de inspección, recogida de equipajes

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
        ( at ?tail ?place )
    )
)

(:action inspect
    :parameters (
        ?wagon - wagon
        ?place - place
    )
    :precondition (and 
        (at ?wagon ?place)
        ( inspection ?place )
    )
    :effect (and )
)

(:action load
    :parameters (
        ?wagon - wagon
        ?machine - machine
        ?ocupation - capacity
    )
    :precondition (and )
    :effect (and )
)

(:action unload
    :parameters ()
    :precondition (and )
    :effect (and )
)




)
