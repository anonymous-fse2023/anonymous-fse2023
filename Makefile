python=python3

clean: ; rm -rf *.log
clobber: clean;
	-$(MAKE) box-remove
	-rm -rf artifact artifact.tar.gz
	-rm -rf .db
results:; mkdir -p results

box-hash:
	md5sum bfuzzer.box

box-add: #| bfuzzer.box
	-vagrant destroy $$(vagrant global-status | grep bfuzzer | sed -e 's# .*##g')
	rm -rf vtest && mkdir -p vtest && cp bfuzzer.box vtest
	cd vtest && vagrant box add bfuzzer ./bfuzzer.box
	cd vtest && vagrant init bfuzzer
	cd vtest && vagrant up

box-status:
	vagrant global-status | grep bfuzzer
	vagrant box list | grep bfuzzer

box-remove:
	-vagrant destroy $$(vagrant global-status | grep bfuzzer | sed -e 's# .*##g')
	vagrant box remove bfuzzer

show-ports:
	 sudo netstat -ln --program | grep 8888

box-connect2:
	cd vtest; vagrant ssh


vm-list:
	VBoxManage list vms

vm-remove:
	VBoxManage startvm $(VM)  --type emergencystop
	VBoxManage unregistervm $(VM) -delete
