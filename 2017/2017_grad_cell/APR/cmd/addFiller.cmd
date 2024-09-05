getFillerMode -quiet
addFiller -cell FILL4 FILL32 FILL16 FILL8 FILL4 FILL2 FILL1 -prefix FILLER

addMETALFill -layer { METAL1 METAL2 METAL3 METAL4 METAL5 METAL6 METAL6 METAL6} -timingAware sta -slackThreshold 0.2
