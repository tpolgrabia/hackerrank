FLAGS=-g -Wall -Wextra -pedantic
LDFLAGS=
CFLAGS=

COUNTING_SORT_PROGNAME=countingsort

all: $(COUNTING_SORT_PROGNAME)

countingsort: countingsort.cpp.o
	$(CXX) $(FLAGS) -o $@ $^ $(LDFLAGS)

%.cpp.o: %.cpp
	$(CXX) $(FLAGS) $(CLFLAGS) -c -o $@ $<

PHONY: clean

clean:
	rm -f $(COUNTING_SORT_PROGNAME) *.o *~ *.bak
