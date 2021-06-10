

file = open("memfile.hex")
lines = file.readlines()
newLines = "WIDTH=32;\nDEPTH=256;\nADDRESS_RADIX=UNS;\nDATA_RADIX=HEX;\nCONTENT BEGIN\n"
for i in range(len(lines)):
    line = lines[i]
    newLine = str(i) +" : "+ line.strip("\n")+";\n"
    newLines += newLine
newLines+="["+str(i+1)+"..255]  :  0;"
newLines+="END;"
f = open("memfile.mif", "w")
f.write(newLines)
f.close()
