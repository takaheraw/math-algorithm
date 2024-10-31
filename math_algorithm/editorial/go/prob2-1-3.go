package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)

	input, _ := reader.ReadString('\n')
	numbers := strings.Fields(input)

	a1, _ := strconv.Atoi(numbers[0])
	a2, _ := strconv.Atoi(numbers[1])
	a3, _ := strconv.Atoi(numbers[2])

	result := a1 * a2 * a3
	fmt.Println(result)
}
