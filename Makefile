CC = clang
CFLAGS = -fPIC
H_FILES = libgrabdevice/libgrabdevice.h
C_FILES = libgrabdevice/libgrabdevice.c
O_FILES = libgrabdevice/libgrabdevice.o
OUT_LIB = libgrabdevice.so
HEADER_PATH = /usr/local/include/libgrabdevice/
LIB_PATH = /usr/local/lib/

build: $(FILES)
	$(COMPILE.c) $(C_FILES)

link:
	$(CC) -shared -o $(OUT_LIB) $(O_FILES)

clean:
	rm -rf libgrabdevice/*.o *.so

install:
	build
	link
	mkdir -p $(HEADER_PATH)
	mkdir -p $(LIB_PATH)
	cp $(H_FILES) $(HEADER_PATH)
	cp $(OUT_LIB) $(LIB_PATH)
	clean
