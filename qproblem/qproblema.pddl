(define (problem aeropuerto_reducido)
    (:domain aeropuerto)
    (:objects
        p1 p2 p3 p_ret - place
        ;p1 p2 p5 p6 p_ins p_ret p_fac - place
        s1 s2 - suitcase
        m1 m2 - machine
        w1 w2 w3 w4 w5 - wagon

    )

    (:init
        ( inspection p1)
        ( retrieve p_ret)
        ; ( retrieve p_fac)

        ( no_retrieve p1)
        ( no_retrieve p2)
        ( no_retrieve p3 )
        ; ( no_retrieve p4 )
        ; ( no_retrieve p5)
        ; ( no_retrieve p6)
        ; ( no_retrieve p7 )
        ; ( no_retrieve p8 )
        ; ( no_retrieve p_ins)

        ( conection p1 p3 ) ( conection p3 p1 )
        ; ( conection p1 p_ins) ( conection p_ins p1)
        ; ( conection p3 p4 ) ( conection p4 p3 )
        ; ( conection p4 p2 ) ( conection p2 p4 )
        ; ( conection p6 p8 ) ( conection p8 p6 )
        ; ( conection p8 p7 ) ( conection p7 p8 )
        ; ( conection p7 p5 ) ( conection p5 p7 )
        ; ( conection p2 p_fac)
        ; ( conection p_fac p2)
        ( conection p1 p2) ( conection p2 p1)
        ( conection p1 p_ret ) ( conection p_ret p1)
        ; ( conection p_fac p_ret)
        ; ( conection p_ret p_fac)
        ; ( conection p_ret p6)
        ; ( conection p6 p_ret)
        ; ( conection p5 p_ins)
        ; ( conection p_ins p5)
        ; ( conection p5 p6)
        ; ( conection p6 p5)
        ; ( conection p_ins p_fac)
        ; ( conection p_fac p_ins)
        ; ( conection p_ins p_ret)
        ; ( conection p_ret pins)

        ( at m1 p1)
        ( intrain_ m1)
        ( last_ m1)
        ; ( at m2 pret)
        ; ( intrain m2)
        ; ( last_ m2)

        ( at w1 p1)
        ( empty w1)
 
        ( at s1 p2)
        ( suspicious s1)
        ; ( at s2 p1)
        ; ( suspicious s2)

    )

    (:goal; (and( at w1 p2 )
            ( at s1 p_ret );)
            ;(intrain w1 m1)
            ; ( last w1 m1)


    )

    ;un-comment the following line if metric is needed
    ;(:metric minimize (???))
)