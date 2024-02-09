class VMTranslator:
    counter = 0

    def countString():
        count = str(VMTranslator.counter)
        VMTranslator.counter += 1
        return count

    def translateSegment(segment, offset):
        translations = {
            "this": "THIS",
            "that": "THAT",
            "argument": "ARG",
            "local": "LCL",
            "static": str(16 + offset),
            "pointer": "R" + str(3 + offset),
            "temp": "R" + str(5 + offset),
            "constant": str(offset)
        }
        return translations.get(segment, segment)
    
    def vm_push(segment, offset):
        translated = VMTranslator.translateSegment(segment, offset)
        returnString = ""
        if segment in ("constant", "static", "pointer", "temp"):
            returnString += f"@{translated}\n"
            returnString += "D = A\n" if segment == "constant" else "D = M\n"
        else:
            returnString += f"@{translated}\nD = M\n"
            returnString += f"@{offset}\nA = D + A\nD = M\n"

        returnString += "@SP\nA = M\nM = D\n@SP\nM = M + 1\n"
        return returnString

    def vm_pop(segment, offset):
        translated = VMTranslator.translateSegment(segment, offset)
        returnString = f"@{translated}\n"
        if segment in ("static", "temp", "pointer"):
            returnString += "D = A\n"
        else:
            returnString += "D = M\n"
            returnString += f"@{offset}\nD = D + A\n"

        returnString += "@R13\nM = D\n@SP\nAM = M - 1\nD = M\n@R13\nA = M\nM = D\n"
        return returnString

    def vm_add():
        return "@SP\nAM=M-1\nD=M\nA=A-1\nM=D+M"

    def vm_sub():
        return "@SP\nAM=M-1\nD=M\nA=A-1\nM=M-D"

    def vm_neg():
        return "@SP\nA=M-1\nM=!M\nM=M+1"

    def vm_compare(jump_type):
        count = VMTranslator.countString()
        return f"@SP\nAM=M-1\nD=M\nA=A-1\nD=M-D\n@{jump_type}.true_{count}\nD;{jump_type}\n@SP\nA=M-1\nM=0\n@{jump_type}.skip_{count}\n0;JMP\n({jump_type}.true_{count})\n@SP\nA=M-1\nM=-1\n({jump_type}.skip_{count})"

    def vm_eq():
        return VMTranslator.vm_compare("JEQ")

    def vm_gt():
        return VMTranslator.vm_compare("JGT")

    def vm_lt():
        return VMTranslator.vm_compare("JLT")

    def vm_logical(binary_op):
        return f"@SP\nAM=M-1\nD=M\nA=A-1\nM=M{binary_op}D"

    def vm_and():
        return VMTranslator.vm_logical("&")

    def vm_or():
        return VMTranslator.vm_logical("|")

    def vm_not():
        return "@SP\nA=M-1\nM=!M"

    def vm_label(label):
        return f"({label})"

    def vm_goto(label):
        return f"@{label}\n0;JMP"

    def vm_if(label):
        return f"@SP\nAM=M-1\nD=M\n@{label}\nD;JNE"

    def vm_function(function_name, n_vars):
        returnString = f"({function_name})\n@0\nD=A\n@SP\nA=M\n"
        for _ in range(n_vars):
            returnString += "M=0\nA=A+1\n"
        returnString += "D=A\n@SP\nM=D"
        return returnString

    def vm_call(function_name, n_args):
        count = VMTranslator.countString()
        returnString = f"@SP\nD=M\n@R13\nM=D\n@RET.{count}\nD=A\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"
        for segment in ["LCL", "ARG", "THIS", "THAT"]:
            returnString += f"@{segment}\nD=M\n@SP\nA=M\nM=D\n@SP\nM=M+1\n"
        returnString += f"@R13\nD=M\n@{n_args}\nD=D-A\n@ARG\nM=D\n@SP\nD=M\n@LCL\nM=D\n@{function_name}\n0;JMP\n(RET.{count})"
        return returnString

    def vm_return():
        returnString = "@LCL\nD=M\n@5\nA=D-A\nD=M\n@R13\nM=D\n@SP\nA=M-1\nD=M\n@ARG\nA=M\nM=D\nD=A+1\n@SP\nM=D\n"
        for segment in ["THAT", "THIS", "ARG", "LCL"]:
            returnString += f"@LCL\nAM=M-1\nD=M\n@{segment}\nM=D\n"
        returnString += "@R13\nA=M\n0;JMP"
        return returnString

if __name__ == "__main__":
    import sys
    if(len(sys.argv) > 1):
        with open(sys.argv[1], "r") as a_file:
            for line in a_file:
                tokens = line.strip().lower().split()
                if(len(tokens)==1):
                    if(tokens[0]=='add'):
                        print(VMTranslator.vm_add())
                    elif(tokens[0]=='sub'):
                        print(VMTranslator.vm_sub())
                    elif(tokens[0]=='neg'):
                        print(VMTranslator.vm_neg())
                    elif(tokens[0]=='eq'):
                        print(VMTranslator.vm_eq())
                    elif(tokens[0]=='gt'):
                        print(VMTranslator.vm_gt())
                    elif(tokens[0]=='lt'):
                        print(VMTranslator.vm_lt())
                    elif(tokens[0]=='and'):
                        print(VMTranslator.vm_and())
                    elif(tokens[0]=='or'):
                        print(VMTranslator.vm_or())
                    elif(tokens[0]=='not'):
                        print(VMTranslator.vm_not())
                    elif(tokens[0]=='return'):
                        print(VMTranslator.vm_return())
                elif(len(tokens)==2):
                    if(tokens[0]=='label'):
                        print(VMTranslator.vm_label(tokens[1]))
                    elif(tokens[0]=='goto'):
                        print(VMTranslator.vm_goto(tokens[1]))
                    elif(tokens[0]=='if-goto'):
                        print(VMTranslator.vm_if(tokens[1]))
                elif(len(tokens)==3):
                    if(tokens[0]=='push'):
                        print(VMTranslator.vm_push(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='pop'):
                        print(VMTranslator.vm_pop(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='function'):
                        print(VMTranslator.vm_function(tokens[1],int(tokens[2])))
                    elif(tokens[0]=='call'):
                        print(VMTranslator.vm_call(tokens[1],int(tokens[2])))

        