(define (problem real_problem) (:domain airport)
(:objects 
    p1 p2 p3 p4 p5 p6 p7 p8 p_ins p_ret p_fac - place
    s1 s2 s3 s4 s5 s6 s7 s8 s9 - suitcase
    m1 m2 m3 - machine
    w1 w2 w3 w4 w5 - wagon
    capacity0 capacity1 capacity2 capacity3 - capacity
)

(:init
    ( inspection p_ins )
    ( retrieve p_ret )
    ( retrieve p_fac )

    ( no_retrieve p1 )
    ( no_retrieve p2 )
    ( no_retrieve p3 )
    ( no_retrieve p4 )
    ( no_retrieve p5 )
    ( no_retrieve p6 )
    ( no_retrieve p7 )
    ( no_retrieve p8 )
    ( no_retrieve p_ins )

    ( conection p1 p3 ) ( conection p3 p1 )
    ( conection p1 p_ins ) ( conection p_ins p1 )
    ( conection p3 p4 ) ( conection p4 p3 )
    ( conection p4 p2 ) ( conection p2 p4 )
    ( conection p6 p8 ) ( conection p8 p6 )
    ( conection p8 p7 ) ( conection p7 p8 )
    ( conection p7 p5 ) ( conection p5 p7 )
    ( conection p2 p_fac ) ( conection p_fac p2) 
    ( conection p_fac p_ret ) ( conection p_ret p_fac )
    ( conection p_ret p6 ) ( conection p6 p_ret )
    ( conection p5 p_ins ) ( conection p_ins p5 )
    ( conection p_ins p_fac ) ( conection p_fac p_ins )
    ( conection p_ins p_ret ) ( conection p_ret p_ins )
    
    ( at m1 p_ret ) ( intrain m1 m1 ) ( last m1 m1 )
    ( at m2 p_ret ) ( intrain m2 m2 ) ( last m2 m2 )

    ( at w1 p1 ) ( ocupation w1 capacity0 )
    ( at w2 p1 ) ( ocupation w2 capacity0 )
    ( at w3 p1 ) ( ocupation w3 capacity0 )
    ( at w4 p5 ) ( ocupation w4 capacity0 )
    ( at w5 p5 ) ( ocupation w5 capacity0 )

    ( at s1 p_fac ) ( no_suspicious s1 )
    ( at s2 p_fac ) ( no_suspicious s2 )
    ( at s3 p6 ) ( suspicious s3 )
    ( at s4 p6 ) ( no_suspicious s4 )
    ( at s5 p2 ) ( no_suspicious s5 )
    ( at s6 p2 ) ( suspicious s6 )
    ( at s7 p3 ) ( no_suspicious s7 )
    ( at s8 p1 ) ( suspicious s8)
    ( at s9 p1 ) ( no_suspicious s9 )

    ( capacity_order capacity0 capacity1 )
    ( capacity_order capacity1 capacity2 )
    ( capacity_order capacity2 capacity3 )
    ( min-ocupation capacity0 )
)

(:goal (and
    ( at s1 p4 )
    ( at s2 p8 )
    ( at s3 p_ret )
    ( at s4 p_ret )
    ( at s5 p_ret )
    ( at s6 p_ret )
    ( at s7 p_ret )
    ( at s8 p2 )
    ( at s9 p8 )
))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)