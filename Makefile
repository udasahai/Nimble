make:	nimble.o
	g++ nimble.o -o nimble

nimble.o: nimble.cpp
	g++ -c nimble.cpp

check: make
	chmod +x test.sh 
	./test.sh

clean:
	rm -rf nimble nimble.o temp_test*
