SRCS=$(wildcard *.c)
OBJS=$(SRCS:.c=.o)

CFLAGS+=-I$(mkMetisInc)
LDFLAGS+=-L$(mkMetisLib) -lmetis

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

mtest: $(OBJS)
	$(CC) $(LDFLAGS) $(OBJS) -o $@

clean:
	$(RM) $(OBJS) mtest

run: mtest
	./mtest 4elt.graph | diff mtest.out -
