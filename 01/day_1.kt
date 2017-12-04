fun main(args: Array<String>) {
	println("Part 1: ${partOneSolve(input+input[0], 0)}")
    
    val shift = (input + input).slice(IntRange(input.length/2, input.length+input.length/2-1))
    println("Part 2: ${partTwoSolve(input, shift, 0)}")
}

fun partOneSolve(input: String, acc: Int): Int {
    if (input.length < 2) {
       return acc
    }
    
    if (input[0].compareTo(input[1]) == 0) {
    	return partOneSolve(input.drop(1), acc + (input[0].toInt() - 48))
    }
    
    return partOneSolve(input.drop(1), acc)
}

fun partTwoSolve(input: String, shift: String, acc: Int): Int {
    if (input.length == 0) {
        return acc
    }
    
    if (input[0].compareTo(shift[0]) == 0) {
        return partTwoSolve(input.drop(1), shift.drop(1), acc + (input[0].toInt() - 48))
    }
    
    return partTwoSolve(input.drop(1), shift.drop(1), acc)
}