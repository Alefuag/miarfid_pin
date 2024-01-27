(define (domain aeropuerto)

    (:requirements :typing :equality :negative-preconditions)

    (:types
        locatable place capacity - object
        suitcase machine wagon - locatable
    )

    (:predicates

        ( at ?l - locatable ?p - place)

        ( attached ?w - wagon ?m - wagon)

        ( head_attached ?w - wagon ?m - machine)

        ( in ?s - suitcase ?w - wagon)

        ( intrain ?w - wagon ?m - machine)

        ( intrain_ ?m - machine)

        ;( capacity_order ?l - capacity ?u - capacity)

        ( suspicious ?s - suitcase)

        ( no_suspicious ?s - suitcase)

        ( ocupation ?w - wagon ?c - capacity)

        ( conection ?p1 - place ?p2 - place)

        ( last ?w - wagon ?m - machine)

        ( last_ ?m - machine)

        ;( max-ocupation ?c - capacity )

        ;( min-ocupation ?c - capacity)

        ( inspection ?i - place)

        ( retrieve ?r - place)

        ( no_retrieve ?nr - place)

        ( empty ?w - wagon)

    )

    (:action move
        :parameters (?machine - machine ?place1 - place ?place2 - place)
        :precondition (and
            ( at ?machine ?place1)
            ( conection ?place1 ?place2)
        )
        :effect (and
            ( not ( at ?machine ?place1))
            ( at ?machine ?place2)
        )
    )

    (:action attach_to_wagon
        :parameters (
            ?wagon - wagon
            ?tail - wagon
            ?machine - machine
            ?place - place 
        )
        :precondition (and
            ( last ?tail ?machine)
            ( intrain ?tail ?machine)
            ( at ?wagon ?place)
            ( at ?machine ?place)
            ;( ocupation ?wagon  ?capacity )
            ;( min-ocupation ?min_capacity )
            ( empty ?wagon)
        )
        :effect (and
            ( not ( at ?wagon ?place))
            ( not ( last ?tail ?machine))
            ( last ?wagon ?machine)
            ( attached ?wagon ?tail)
            ( intrain ?wagon ?machine)
        )
    )

    (:action attach_to_machine
        :parameters ( ?wagon - wagon
            ?machine - machine 
            ?place - place 
            ;?capacity - capacity
            ;?min_capacity - capacity
        )
        :precondition (and
            ( last_ ?machine)
            ( intrain_ ?machine)
            ( at ?wagon ?place)
            ( at ?machine ?place)
            ( empty ?wagon)
            ;( ocupation ?wagon ?capacity)
            ;( min-ocupation ?min_capacity )

        )
        :effect (and
            ( not ( at ?wagon ?place))
            ( not ( last_ ?machine))
            ( last ?wagon ?machine)
            ( head_attached ?wagon ?machine)
            ( intrain ?wagon ?machine)
        )
    )

    (:action detach_from_wagon
        :parameters ( ?tail - wagon ?newtail - wagon ?machine - machine ?place - place
        )
        :precondition (and
            ( at ?machine ?place)
            ( intrain ?tail ?machine)
            ( last ?tail ?machine)
            ( attached ?tail ?newtail)
            ;( ocupation ?tail ?capacity )
            ;( min-ocupation ?min_capacity )
            ( empty ?tail)
        )
        :effect (and
            ( not ( intrain ?tail ?machine))
            ( not ( attached ?tail ?newtail))
            ( not ( last ?tail ?machine))
            ( last ?newtail ?machine)
            ( at ?tail ?place)
        )
    )

    (:action detach_from_machine
        :parameters ( ?tail - wagon  ?machine - machine ?place - place
            ;?capacity - capacity 
            ;?min_capacity - capacity
        )
        :precondition (and
            ( at ?machine ?place)
            ( intrain ?tail ?machine)
            ( last ?tail ?machine)
            ( head_attached ?tail ?machine)
            ;( ocupation ?tail ?capacity )
            ;( min-ocupation ?min_capacity )
            ( empty ?tail)
        )
        :effect (and
            ( not ( intrain ?tail ?machine))
            ( not ( head_attached ?tail ?machine))
            ( not ( last ?tail ?machine))
            ( at ?tail ?place)
            ( last_ ?machine)
        )
    )

    (:action inspect
        :parameters ( ?suitcase - suitcase ?place - place
        )
        :precondition (and
            ( at ?suitcase ?place)
            ( inspection ?place)
            ( suspicious ?suitcase)
        )
        :effect (and
            ( not ( suspicious ?suitcase))
            ( no_suspicious ?suitcase)
        )
    )

    (:action load
        :parameters ( ?wagon - wagon ?machine - machine ?suitcase - suitcase ?place - place
            ;?c_current - capacity
            ;?c_next - capacity
        )
        :precondition (and
            ( at ?machine ?place)
            ( intrain ?wagon ?machine)
            ( at ?suitcase ?place)
            ;( ocupation ?wagon  ?c_current )
            ;( capacity_order ?c_current ?c_next )
            ( empty ?wagon)
        )
        :effect (and
            ( not ( at ?suitcase ?place))
            ( in ?suitcase ?wagon)
            ( not ( empty ?wagon))
            ;(not (ocupation ?wagon  ?c_current))
            ;( ocupation ?wagon  ?c_next )
        )
    )

    (:action unload
        :parameters ( ?wagon - wagon ?machine - machine ?suitcase - suitcase ?place - place 
            ;?c_current - capacity
            ;?c_prev - capacity
        )
        :precondition (and
            ( no_retrieve ?place)

            ( at ?machine ?place)
            ( intrain ?wagon ?machine)
            ( in ?suitcase ?wagon)

            ;( ocupation ?wagon ?c_current)
            ;( capacity_order ?c_prev ?c_current)
            ( not ( empty ?wagon))
        )
        :effect (and
            ( not ( in ?suitcase ?wagon))
            ( at ?suitcase ?place)
            ;(not (ocupation ?wagon ?c_current))
            ;( ocupation ?wagon ?c_prev)
            (empty ?wagon)
        )
    )

    (:action deliver
        :parameters ( ?wagon - wagon ?machine - machine ?suitcase - suitcase ?place - place
            ;?c_current - capacity
            ;?c_prev - capacity
        )
        :precondition (and
            ( retrieve ?place)

            ( at ?machine ?place)
            ( intrain ?wagon ?machine)
            ( in ?suitcase ?wagon)
            ( no_suspicious ?suitcase)
            ( not ( empty ?wagon))
        )
        :effect (and
            ( not ( in ?suitcase ?wagon))
            ( at ?suitcase ?place)
            ;(not (ocupation ?wagon  ?c_current))
            ;( ocupation ?wagon ?c_prev ))
            ( empty ?wagon)
        )

    )
)   