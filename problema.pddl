(define (problem airport_problem) (:domain airport)
(:objects 
    place1 place2 place3 place4 - place
    machine1 - machine
    suitcase1 - suitcase
    wagon1 wagon2 - wagon
    capacity0 capacity1 capacity2 - capacity
)

(:init
    ( at machine1 place1 )
    ( at wagon1 place1 )
    ( at wagon2 place2 )

    ( ocupation wagon1 capacity0 )
    ( ocupation wagon2 capacity0 )

    ( intrain machine1 machine1 )
    ( last machine1 machine1)

    ( conection place1 place2 )
    ( conection place2 place3 )
    ( conection place2 place4 )


    ( capacity_order capacity0 capacity1 )
    ( capacity_order capacity1 capacity2 )
)

(:goal (and
    ;( at m1 p4 )
    ( attached wagon1 machine1 )
    ( attached wagon2 wagon1)

))

)
