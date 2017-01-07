all: coinchange

coinchange: coinchange.cpp.o
	$(CXX) -o $@ $^

%.cpp.o: %.cpp
	$(CXX) -c -o $@ $<

.PHONY: clean

clean:
	rm -f *.o coinchange *~ *.bak *.tmp
