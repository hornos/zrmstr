include ../arch.make

SMH_URL=http://simh.trailing-edge.com/sources/simhv38-1.zip
SMH_TGZ=simh.zip

.PHONY: all simh

all: simh

simh:
	if ! test -d ./src;then \
	  mkdir ./src; \
	  if ! test -f $(SMH_TGZ);then \
	    $(DL) -O $(SMH_TGZ) $(SMH_URL);fi; \
	  unzip -d ./src $(SMH_TGZ); \
	  cd ./src; mkdir ./BIN; export OSTYPE; make; \
	fi

clean:
	rm -fR ./src
	rm *.zip 
