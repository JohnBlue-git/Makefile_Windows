
#
# Auther: John Blue
#
# Time: 2022/12
#
# Platform: on Window cmd with MinGw compiler
#
# Objective: demonstration of Makefile
#
# How to use in Windows enviornment?
#       open cmd under the target directory -> type in mingw32-make "target:" in Makefile
# Description of "target:"
# clean_all: clean all the files or exe built
# step by step: make_assembly_file -> make_object_file -> make_exe
# all in one: make
#
#Note: please install MinGW tool set which provides mingw32-make build tool
#       , and make it in your PATH system variables
#

#
# define quick variable
#
# -ansi : 程式要求依據 ansi 標準，增加可移植性。
# -I : 追加 include 檔案的搜尋路徑
# -Wall : 編譯時顯示所有的警告訊息
# -g : 編入除錯資訊 (要使用 GDB 除錯一定要加)。
# -O ：表示最佳化的程度
#
INSTDIR = C:/Users/user/Downloads
INCLUDE = .
CFG = g -Wall -ansi

files = use_factorial.c factorial.c
assembles = use_factorial.s factorial.s
objects = use_factorial.o factorial.o
exe = Factorial


#
# clean all
#

clean_all:
	echo "cleaning all ..."
	del -f $(assembles) $(objects) $(exe).exe

#
# step by step
#

make_assembly_file:
	echo "making assembly file ..."
	gcc $(files) -I$(INCLUDE) -$(CFG) -S

make_object_file:
		echo "making object code ..."
		gcc $(assembles) -I$(INCLUDE) -$(CFG) -c

make_exe:
		echo "making exe ..."
		gcc $(objects) -I$(INCLUDE) -$(CFG) -o $(exe)
		# if you want to open Factorial.exe in cmd
		#./Factorial

#
# all in one
#

make: $(objects)
	echo "making exe ..."
	gcc $^ -I$(INCLUDE) -$(CFG) -o $(exe)
	# if you want to open Factorial.exe in cmd
	#./Factorial
$(objects): $(assembles)
	gcc $^ -I$(INCLUDE) -$(CFG) -c
$(assembles): $(files)
	gcc $^ -I$(INCLUDE) -$(CFG) -S
