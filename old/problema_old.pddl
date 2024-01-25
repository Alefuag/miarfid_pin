(define (problem airport_problem) (:domain airport)
(:objects 
    place1 place2 place3 place4 - place
    machine1 - machine
    suitcase1 suitcase2 suitcase3 - suitcase
    wagon1 wagon2 - wagon
    capacity0 capacity1 capacity2 - capacity
)

(:init
    ( inspection place2 )
    ( retrieve place3 )
    ( at machine1 place1 )
    ( at wagon1 place1 )
    ( at wagon2 place2 )

    ( at suitcase1 place3 ) (suspicious suitcase1)
    ( at suitcase2 place1 ) (no_suspicious suitcase2)
    ( at suitcase3 place2 ) (no_suspicious suitcase3)

    ( ocupation wagon1 capacity0 )
    ( ocupation wagon2 capacity0 )

    ( intrain machine1 machine1 )
    ( last machine1 machine1 )
  
    ( conection place1 place2 ) ( conection place2 place1 )
    ( conection place2 place3 ) ( conection place3 place2 )
    ( conection place2 place4 ) ( conection place4 place2 )

    ( capacity_order capacity0 capacity1 )
    ( capacity_order capacity1 capacity2 )

    ( min-ocupation capacity0 )
)

(:goal (and
    ;( at m1 p4 )
    ;( attached wagon1 machine1 )
    ;( attached wagon2 wagon1 )
    ;( in suitcase1 wagon1 )
    ;( in suitcase2 wagon1 )
    ( at suitcase1 place3 )
    ( no_suspicious suitcase1 )

))

)
