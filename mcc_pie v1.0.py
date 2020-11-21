import subprocess as s
#this program is created by us
print("this is a buggy version of python macchanger")
s.call(["ifconfig"])
infc=input("enter ur network inter face \n")
mcad=input("eneter the mac adress u want\n")
s.call("ifconfig "+infc+" down",shell=True)
s.call("ifconfig "+infc+" hw ether "+mcad,shell=True)
s.call("ifconfig "+infc+" up",shell=True)
print("now ur mac add is ",mcad)
exit()
