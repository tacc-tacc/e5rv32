lineas = \
"""03c00513
ff300593
00a00613
00100693
00200713
00800793
00b50033
40b50033
00e51033
00b52033
00a5a033
00b53033
00a5b033
00b54033
00e5d033
40e5d033
00b56033
00b57033
ffa5a013
ff35a013
ffa5b013
ff35b013
02a54013
0225e013
0225f013
00259013
0025d013
4025d013
00255013
40255013
02b50033
02b51033
02b52033
02b53033
02b54033
02054033
02b55033
02055033
02b56033
02056033
02b57033
02b57033
00000063"""

print("""WIDTH=32;
DEPTH=16384;
ADDRESS_RADIX=HEX;
DATA_RADIX=HEX;
CONTENT BEGIN""")
for i, linea in enumerate(lineas.splitlines()):
    print("\t"+"{:x}".format(i)+" : "+str(linea)+";")
print("CONTENT END")