CC = clang
CFLAGS = -fPIC
H_FILES = libgrabdevice/libgrabdevice.h
C_FILES = libgrabdevice/libgrabdevice.c
O_FILE = libgrabdevice/libgrabdevice.o
OUT_LIB = libgrabdevice.so
HEADER_PATH = /usr/local/include/libgrabdevice/
LIB_PATH = /usr/local/lib/

build: $(FILES)
	$(COMPILE.c) $(C_FILES) -o $(O_FILE)

link:
	$(CC) -shared -o $(OUT_LIB) $(O_FILE)

clean:
	rm -rf $(O_FILE) $(OUT_LIB)

install:
	build
	link
	mkdir -p $(HEADER_PATH)
	mkdir -p $(LIB_PATH)
	cp $(H_FILES) $(HEADER_PATH)
	cp $(OUT_LIB) $(LIB_PATH)
	clean
