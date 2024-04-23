import os
import sys
import struct

def output_bin(bin_file, fd_file):
    fd_bin=open(bin_file, 'rb')
    data=fd_bin.read(4)
    count=0
    while (len(data)==4):
        temp=struct.unpack("<L", data)
        if ((count%4)==0):
            fd_file.write("\t"),
        fd_file.write("0x%08X,"%(temp)),
        count=count+1
        if ((count%4)==0):
            fd_file.write("\n"),
        data=fd_bin.read(4)
    fd_bin.close()

def output_bin_u8(bin_file, fd_file):
    fd_bin=open(bin_file, 'rb')
    data=fd_bin.read(1)
    count=0
    while (len(data)==1):
        temp=struct.unpack("<B", data)
        if ((count%16)==0):
            fd_file.write("\t"),
        fd_file.write("0x%02X,"%(temp)),
        count=count+1
        if ((count%16)==0):
            fd_file.write("\n"),
        data=fd_bin.read(1)
    fd_bin.close()

def output_data_u16(fd_file):
    count = 0
    for i in range(0, 240*320,1):
        temp = i if (i <= 0xffff) else (i-0xffff)
        #temp=struct.unpack("<L", data)
        if ((count%8)==0):
            fd_file.write("\t"),
        fd_file.write("0x%04X,"%(temp)),
        count=count+1
        if ((count%8)==0):
            fd_file.write("\n"),

def gen_cpu_img(src, dest):
    fd_file=open(os.path.join(dest, 'screen.h'),"w+")
    fd_file.write("#include <stdint.h>\n"),
    fd_file.write("#include <string.h>\n"),
    fd_file.write("#include <stdio.h>\n"),
    fd_file.write("\n"),
    fd_file.write("const uint16_t screen[]= { ")
    output_data_u16(fd_file)
    fd_file.write("};")
    fd_file.write("\n"),
    fd_file.close()

#if __name__ == '__main__':
#        gen_cpu_img(sys.argv[1], sys.argv[2])

root_path = os.path.dirname(__file__)#os.getcwd()
src_path = os.path.join(root_path,'Dut\VenusFTO_Validation_FT\ValCase.bin')

print(src_path, root_path)
gen_cpu_img(src_path,root_path);
