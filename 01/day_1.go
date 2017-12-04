package main

import (
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

func main() {
	bytes, err := ioutil.ReadFile("input.txt")
	if err != nil {
		panic(err)
	}

	input := strings.Split(strings.TrimSpace(string(bytes)), "")

	fmt.Printf("Part 1: %d\n", partOneSolve(append(input, input[0]), 0))

	length := len(input)
	shift := append(input, input...)[length/2 : length/2+length]
	fmt.Printf("Part 2: %d\n", partTwoSolve(input, shift, 0))
}

func partOneSolve(input []string, acc int) int {
	if len(input) < 2 {
		return acc
	}

	if input[0] == input[1] {
		val, err := strconv.Atoi(input[0])
		if err != nil {
			panic(err)
		}

		acc += val
	}

	return partOneSolve(input[1:], acc)
}

func partTwoSolve(input []string, shift []string, acc int) int {
	if len(input) == 0 {
		return acc
	}

	if input[0] == shift[0] {
		val, err := strconv.Atoi(input[0])
		if err != nil {
			panic(err)
		}

		acc += val
	}

	return partTwoSolve(input[1:], shift[1:], acc)
}
