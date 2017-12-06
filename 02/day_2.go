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
}

func partOneSolve(input [][]int) int {
	acc := 0

	for row := range input {
		max := input[row][0]
		min := input[row][0]

		for index := 0; index < len(input[row]); index++ {
			if input[row][index] > max {
				max = input[row][index]
			}

			if input[row][index] < min {
				min = input[row][index]
			}
		}

		acc += max - min
	}

	return acc
}

func partTwoSolve() {

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
