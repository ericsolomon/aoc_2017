package main

import (
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

func main() {
	input := loadData()

	fmt.Printf("Part 1: %d\n", partOneSolve(input))
	fmt.Printf("Part 2: %d\n", partTwoSolve(input))
}

func partOneSolve(input [][]int) int {
	acc := 0

	for row := range input {
		max := input[row][0]
		min := input[row][0]

		for _, item := range input[row] {
			if item > max {
				max = item
			}

			if item < min {
				min = item
			}
		}

		acc += max - min
	}

	return acc
}

func partTwoSolve(input [][]int) int {
	acc := 0

	for row := range input {
		for x := 0; x < len(input[row]); x++ {
			for y := 0; y < len(input[row]); y++ {
				if input[row][x]%input[row][y] == 0 && input[row][x] != input[row][y] {
					acc += (input[row][x] / input[row][y])
				}
			}
		}
	}

	return acc
}

func loadData() [][]int {
	bytes, err := ioutil.ReadFile("input.txt")
	if err != nil {
		panic(err)
	}

	stringInput := strings.Split(strings.TrimSpace(string(bytes)), "\n")
	normInput := make([][]int, len(stringInput))

	for row := range stringInput {
		stringArr := strings.Split(stringInput[row], "\t")

		for i := range stringArr {
			val, err := strconv.Atoi(stringArr[i])
			if err != nil {
				panic(err)
			}

			normInput[row] = append(normInput[row], val)
		}
	}

	return normInput
}
