

- use build manager to automate processes
- describe the dependencies (and updates) in a 'build file'
- in Linux: GNU Make



##example makefile: single.mk (executing on default action)
	
	# test.mk		(# for comments)
	
	# target : prerequisite	(runs if prerequisite is newer than target)
		# command/action	(intended by 1-tab!)
	
	my_fig.pdf	 : my_fig.ps		
		ps2pdf my_fig.ps > my_fig.pdf
	
	
####running the makefile
`$bash> gmake -f single.mk`

	

##example makefile: multi1.mk (executing all actions at once)	

	#phony_target : dependencies

	all: fig1.ps fig2.ps
	
	# target : prerequisite	(runs if prerequisite is newer than target)
		# command/action	(intended by 1-tab!)
	
	fig1.pdf : fig1.ps		
		ps2pdf fig1.ps > fig1.pdf
		
	fig2.pdf : fig2.ps		
		ps2pdf fig2.ps > fig2.pdf
	

####running the makefile
`$bash> gmake -f multi1.mk`


##example makefile: multi2.mk (executing all actions at once)		

	
	# target : prerequisite	(runs if prerequisite is newer than target)
		# command/action	(intended by 1-tab!)
	
	result1.txt : input1-1.txt input1-2.txt input1-3.txt		
		calc.py $@ $^	# $@ means the one prerequisite above the input.txt files
					# $^ means all prerequisites
					# $< means the first pre-requisite
					# $? means all pre-requisites that are out of date
	
	result.txt : calc.py	# adds result.txt to the prerequisites w/o including it in $^ above
	
	# result1.txt : input1-1.txt input1-2.txt input1-3.txt	
	# can be replaced by
	# result.txt : input1-*.txt
		
	
	
####running the makefile
`$bash> gmake -f multi2.mk`


##example makefile: multi3.mk (executing all actions at once)		

	SCRIPT_DIR=~/scripts		# define a macro
	include more_macros.mk		# imports more macros if needed

	
	# target : prerequisite	(runs if prerequisite is newer than target)
		# command/action	(intended by 1-tab!)
	
	result%.txt : input%-*.txt 	# % wildcard will be expanded similarly on both sides	
		${SCRIPT_DIR}/calc.py $@ $^	# use a macro to set the path to the script
	
	result.txt : calc.py	
	
		
	

####running the makefile
`$bash> gmake -f multi3.mk`


ref:  
[http://software-carpentry.org/v4/make/] (http://software-carpentry.org/v4/make/)
