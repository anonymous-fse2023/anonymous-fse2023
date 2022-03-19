python=python3

clean: ; rm -rf *.log
clobber: clean;
	-$(MAKE) box-remove
	-rm -rf artifact artifact.tar.gz
	-rm -rf .db
results:; mkdir -p results

box-hash:
	md5sum decoder.box

box-add: #| decoder.box
	-vagrant destroy $$(vagrant global-status | grep decoder | sed -e 's# .*##g')
	rm -rf vtest && mkdir -p vtest && cp decoder.box vtest
	cd vtest && vagrant box add decoder ./decoder.box
	cd vtest && vagrant init decoder
	cd vtest && vagrant up

box-status:
	vagrant global-status | grep decoder
	vagrant box list | grep decoder

box-remove:
	-vagrant destroy $$(vagrant global-status | grep decoder | sed -e 's# .*##g')
	vagrant box remove decoder

show-ports:
	 sudo netstat -ln --program | grep 8888

box-connect2:
	cd vtest; vagrant ssh


vm-list:
	VBoxManage list vms

vm-remove:
	VBoxManage startvm $(VM)  --type emergencystop
	VBoxManage unregistervm $(VM) -delete
