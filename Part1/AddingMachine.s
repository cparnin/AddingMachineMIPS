# Title: Adding Machine     Filename: AddingMachine.s
# Author: Chad Parnin       Date: 3/5/2015

# Description:  An adding machine program that repeatedly reads in integers
		# and adds them into a running sum.
		# The program stops when it gets an input that is 0,
		# printing out the sum at that point

# Input:	User Integers
# Output:	Sum of integers
######################  data segment  #######################

.data
message1:       .asciiz "\nEnter integers to sum (0 to end): " #strings to print
message2:       .asciiz "\nThe sum is: "

######################  code segment  #######################

.text
.globl main
main:	# main program entry
	li	$v0, 4	
	la	$a0, message1
	syscall			# print first message

	li	$v0, 5
	syscall			# read first integer

      	add     $t1, $0, $0     # sum = 0
Loop:	move 	$t0, $v0	# move integer to temp
	beq	$t0, $0, Sum	# branch if user input == 0
	add	$t1, $t1, $t0	# sum	
	li	$v0, 5		# read another integer
	syscall
	j Loop			# do it again
		     	     	
Sum:     
	li	$v0, 4		
	la	$a0, message2
	syscall			# print sum message
	
	move 	$a0, $t1
	li	$v0, 1
	syscall			# print sum