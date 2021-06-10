

file = open("fonts.txt")
lines = file.readlines()
newLines = "WIDTH=8;\nDEPTH=16384;\nCONTENT BEGIN\n"
for i in range(len(lines)):
    line = lines[i]
    newLine = str(i) +" : "+ line.strip("\n")+";\n"
    newLines += newLine
newLines+="["+str(i+1)+"..16383]  :  0;"
newLines+="END;"
f = open("fonts2.txt", "w")
f.write(newLines)
f.close()
