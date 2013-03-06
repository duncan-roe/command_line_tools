.PHONY: clean
SRCS = $(wildcard *.c)
TARGET := $(shell basename $$(pwd))
CFLAGS = -g3 -ggdb -Wall -Wstrict-prototypes -Wmissing-prototypes
LIBS = -ldl

$(TARGET) : $(SRCS)
	$(CC) $^ -o $@ $(LIBS) $(CFLAGS)

clean :
	rm -f $(TARGET)
