CC = clang
CFLAGS = -fPIC -Wall

H_FILES = src/grabdevice.h
C_FILES = src/grabdevice.c
O_FILE = src/grabdevice.o

LIB_MAJOR_VERSION = 1
LIB_FULL_VERSION = 1.0.4
LIB_NAME = libgrabdevice.so

LIB_SONAME = $(LIB_NAME).$(LIB_MAJOR_VERSION)
OUT_LIB = $(LIB_NAME).$(LIB_FULL_VERSION)
HEADER_PATH = /usr/local/include/
LIBS_PATH = /usr/local/lib/

build: $(C_FILES)
	$(COMPILE.c) $(C_FILES) -o $(O_FILE)

link: build
	$(CC) -shared -Wl,-soname,$(LIB_SONAME) -o $(OUT_LIB) $(O_FILE)

clean:
	rm -rf $(O_FILE) $(OUT_LIB)

install: build link
	mkdir -p $(HEADER_PATH)
	mkdir -p $(LIBS_PATH)
	cp $(H_FILES) $(HEADER_PATH)
	cp $(OUT_LIB) $(LIBS_PATH)
	ldconfig -n $(LIBS_PATH)
