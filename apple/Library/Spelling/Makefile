include ./arch.make

HU_VER=1.6.1
HU_URL=http://sourceforge.net/projects/magyarispell/files/Magyar%20Ispell/$(HU_VER)/hu_HU-$(HU_VER).tar.gz/download
HU_TGZ=hu.tgz

.PHONY: all hu

all: hu

hu:
	if ! test -f $(HU_TGZ);then \
	  $(DL) -O $(HU_TGZ) $(HU_URL); \
	  $(TAR) xvzf $(HU_TGZ); \
	  mv ./hu_HU-$(HU_VER)/* ./; \
	  rm -fR ./hu_HU-$(HU_VER); \
	  rm -f *.tgz *.tar.gz; \
	fi;
