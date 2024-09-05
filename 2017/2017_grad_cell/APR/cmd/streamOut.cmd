setAnalysisMode -analysisType bcwc

setStreamOutMode -specifyViaName default -SEvianames false -virtualConnection false -uniquifyCellNamesPrefix false -snapToMGrid false -textSize 1 -version 3
        
write_sdf   -max_view av_func_mode_max \
            -min_view av_func_mode_max \
            -edges noedge \
            -splitsetuphold \
            -remashold \
            -splitrecrem \
            -min_period_edges none \
            ./StreamOut/CHIP.sdf

saveNetlist ./StreamOut/CHIP.v
saveNetlist -includePowerGround ./StreamOut/CHIP_PG.v

saveDesign ./DBS/CHIP.inn
