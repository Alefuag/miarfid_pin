(define (problem aeropuerto)
    (:domain aeropuerto)
    (:objects
        p1 p2 p5 p6 p_ins p_ret p_fac - place
        s1 s2 s3 s4 s5 s6 - suitcase
        m1 m2 m3 - machine
        w1 w2 w3 w4 - wagon
    )

    (:init
        ( inspection p_ins )

        ( retrieve p_ret )
        ( retrieve p_fac )
        ( retrieve p1 )
        ( retrieve p2 )
        ( retrieve p6 )
        
        ( no_retrieve p5)
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
        
        ( at m1 p5)
        ( intrain_ m2)
        ( last_ m2)

        ( at w1 p1)
        ( empty w1)

        ( at w2 p6)
        ( empty w2)

        ( at w2 p6)
        ( empty w2)

        ( at w3 p_fac)
        ( empty w2)

        ( at w4 p6)
        ( empty w4)

        ( at s1 p2)
        ( suspicious s1)

        ( at s2 p_ret)
        ( suspicious s2)

        ( at s3 p2)
        ( no_suspicious s3)

        ( at s4 p6)
        ( suspicious s4)

        ( at s5 p6)
        ( no_suspicious s5)

        ( at s6 p_fac)
        ( suspicious s6)


        
    )
    (:goal (and 
        ( at s1 p6 )
        ( at s2 p_fac )
        ( at s3 p_ret )
        ( at s4 p2 )
        ( at s5 p_ret )
        ( at s6 p1 )
    ))

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)