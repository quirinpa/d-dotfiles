.SUFFIXES: .c .o
.PHONY: clean all run

CFLAGS+=-g

EXE=test
OBJ=

all: ${EXE}

run: ${EXE}
	@./${EXE}

.c.o:
	@${CC} ${CFLAGS} -c $<

${EXE}: ${OBJ}
	@${CC} ${LDLIBS} -o $@ ${OBJ}

clean:
	rm *.o ${EXE}
