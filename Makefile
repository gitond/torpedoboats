# configuration
CC = ghc		# the compiler
EX = torpedoboats	# main executable outputted by the compiler
# main program dependencies
MAINDEP = torpedoboats.hs Datatypes/Board.hs Functions/GameBoardPrinter.hs Functions/GameBoardMutator.hs

# main compilation process
all: $(MAINDEP)
	$(CC) -o $(EX) $(MAINDEP)

# cleanup
# keep executable
clean:
	$(RM) *.o
	$(RM) *.hi
	$(RM) Datatypes/*.o
	$(RM) Datatypes/*.hi
	$(RM) Functions/*.o
	$(RM) Functions/*.hi

# remove executable
cleanex:
	$(RM) $(EX)
	$(RM) *.o
	$(RM) *.hi
	$(RM) Datatypes/*.o
	$(RM) Datatypes/*.hi
	$(RM) Functions/*.o
	$(RM) Functions/*.hi
