#!/bin/bash                                                                                                                     

#
# Forward ports in the "default" virtual machine for Jupyter and Spark 
# 

VM_NAME="default"
VM_PORTS=(
	4040 7077 8080 8081 8881 # Spark
	8888 # Jupyter
)

for ((i=0; i < ${#VM_PORTS[@]}; i++)) do
  VBoxManage controlvm ${VM_NAME} natpf1 ",tcp,,${VM_PORTS[$i]},,${VM_PORTS[$i]}" || true 
done
