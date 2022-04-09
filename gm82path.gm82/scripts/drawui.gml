tooltiptext=""
tty=0

with (Button) button_draw()
with (Button) if (focus && alt!="") drawtooltip(alt)

if (tooltiptext!="") drawtooltip(tooltiptext)
