all: insertionsort1

insertionsort1: insertionsort1.cpp.o
	$(CXX) -o $@ $^

%.cpp.o: %.cpp
	$(CXX) -c -o $@ $<

.PHONY: clean

clean:
	rm -f *.o insertionsort1 *~ *.bak *.tmp
