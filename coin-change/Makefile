FLAGS=-g -Wall -Wextra -pedantic

all: coinchange

coinchange: coinchange.cpp.o
	$(CXX) $(FLAGS) -o $@ $^

%.cpp.o: %.cpp
	$(CXX) -c $(FLAGS) -o $@ $<

.PHONY: clean

clean:
	rm -f *.o coinchange *~ *.bak *.tmp
