(define (problem aeropuerto)
    (:domain aeropuerto)
    (:objects
        p1 p2 p5 p6 p_ins p_ret p_fac - place
        s1 - suitcase
        m1 - machine
        w1 - wagon
    )

    (:init
        ( inspection p_ins )

        ( retrieve p_ret )
        ( retrieve p_fac )
        
        ( no_retrieve p1 )
        ( no_retrieve p2 )
        ( no_retrieve p5)
        ( no_retrieve p6 )
        ( no_retrieve p_ins )

        ( conection p1 p_ins) ( conection p_ins p1)
        ( conection p2 p_fac ) ( conection p_fac p2)
        ( conection p1 p2 ) ( conection p2 p1)
        ( conection p_fac p_ret ) ( conection p_ret p_fac )
        ( conection p_ret p6 ) ( conection p6 p_ret )
        ( conection p5 p_ins ) ( conection p_ins p5 )
        ( conection p5 p6 ) ( conection p6 p5 )
        ( conection p_ins p_fac ) ( conection p_fac p_ins )
        ( conection p_ins p_ret ) ( conection p_ret p_ins )

        ( at m1 p1)
        ( intrain_ m1)
        ( last_ m1)
        
        ( at w1 p1)
        ( empty w1)

        ( at s1 p2)
        ( no_suspicious s1)
        
    )
    (:goal 
        ( at s1 p_ret )        
    )

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)