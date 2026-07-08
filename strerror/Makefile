.PHONY: clean
SRCS = $(wildcard *.c)
TARGET := $(shell basename $$(pwd))
CFLAGS = -g3 -gdwarf-4 -Og -Wall -Wstrict-prototypes -Wmissing-prototypes
LIBS = 

$(TARGET) : $(SRCS)
	$(CC) $^ -o $@ $(LIBS) $(CFLAGS)

clean :
	rm -f $(TARGET)
