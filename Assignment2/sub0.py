#!/usr/bin/env python3
import re
import sys

#pre process the arguments
temp = sys.argv[1:]
f_opt = False # read commands from file 
n_opt = False #stops input lines being printed by default.
commands = []
cmd = []
cmd_raw = ""
commands_filename = ""
filenames = []
for i in range(len(temp)):
    if temp[i] == '-f':
        f_opt = True
        commands_filename = temp[i+1]
        i += 1
        continue
    elif temp[i] == '-n':
        n_opt = True
        continue
    else:
        if commands_filename != temp[i]:
            commands.append(temp[i])
if f_opt:
    print("fopt is on")
    with open(commands_filename, 'r') as f:
        for line in f:
            cmd.append(line)
    for ele in commands:
            filenames.append(ele)
else:
    cmd_raw = commands[0]
    cmd_raw = re.sub(r'\n', ';', cmd_raw)
    cmd = cmd_raw.split(';')
    commands.pop(0)
    if len(commands) > 0:
        for ele in commands:
            filenames.append(ele)



# if n_opt:
#     print("nopt is on")
# print(f'cmd is {cmd}')
# print(f'cmd_raw is {cmd_raw}')
# print(f'commands_filename is {commands_filename}')
# print(f'filenames is {filenames}')
# print(f'commands is {commands}')

# useful variables : 
# 1.cmd : a list of multiple commands 
# 2. filenames: if len(f) > 0, read from spec files
# 3. -n option only print spec lines

quit_cmd = [] # highest priority
print_cmd = []
del_cmd = []
sub_cmd = []
for ele in cmd:
    if ele[-1] == 'q':
        quit_cmd.append(ele)
    elif ele[-1] == 'p':
        print_cmd.append(ele)
    elif ele[-1] == 'd':
        del_cmd.append(ele)
    else:
        sub_cmd.append(ele)

# print(quit_cmd)
# print(print_cmd)
# print(del_cmd)
# print(sub_cmd)

# bool type
def quit(comm, cur_cnt, text):
    for c in comm:
        if '/' in c:
            # regex
            pat = re.sub(r'q$','', c)
            pat = re.sub(r'\/', '', pat)
            if re.search(rf'{pat}', text):
                return True          
        else:
                # number
            num = int(c[:-1])
            if num == cur_cnt:
                return True
    return False
# read the files/stdin

def print_fun(comm, cur_cnt,text):
    if '/' in comm:
            # regex
        pat = re.sub(r'p$','', comm)
        pat = re.sub(r'\/', '', pat)
        if re.search(rf'{pat}', text):
            print(text)         
    else:
            # number
        if comm == 'p':
            print(text)
        else:
            num = int(comm[:-1])
            if num == cur_cnt:
                print(text)


count = 1
if len(filenames) > 0:  # read from spec files
    #print("pos1")
    for file in filenames:
        with open(file, 'r') as f:
            for line in f:
                
                # rm \n in the end
                content = line.strip()
                
                for ele in cmd:
                    if quit(quit_cmd, count, content):
                        break
                    if ele[-1] == 'q':
                        pass
                    elif ele[-1] == 'p':
                        print_fun(ele, count, content)
                    elif ele[-1] == 'd':
                        pass
                    else:
                        pass


                if not n_opt:
                    print(content)
                # if quit(quit_cmd, count, content):
                #     break
                count += 1
else:
    #print("pos2")
    # read from input()
    while 1:
        try:
            #cont = sys.stdin.readline()
            content = input()

            for ele in cmd:
                if ele[-1] == 'q':
                    if quit(ele, count, content):
                        break
                elif ele[-1] == 'p':
                    print_fun(ele, count, content)
                elif ele[-1] == 'd':
                    pass
                else:
                    pass
            if not n_opt:
                print(content)
            # if quit(quit_cmd, count, content):
            #     break
            count += 1
            
        except EOFError as e:
            break




















