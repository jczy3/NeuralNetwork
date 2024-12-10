C_SOURCES = $(wildcard Matrix/*.c Network/*.c IMG/*.c *.c)
HEADERS = $(wildcard Matrix/*.h Network/*.h IMG/*.h *.h)
OBJ = ${C_SOURCES:.c=.o}
CFLAGS = -fopenmp

MAIN = main
CC = /usr/bin/gcc
LINKER = /usr/bin/ld

run: ${MAIN}
	./${MAIN}

main: ${OBJ}
	${CC} ${CFLAGS} $^ -o $@ -lm

# Generic rules
%.o: %.c ${HEADERS}
	${CC} ${CFLAGS} -c $< -o $@ -lm

clean:
	rm Matrix/*.o *.o Network/*.o IMG/*.o ${MAIN}