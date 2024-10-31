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

	// 入力
	input, _ := reader.ReadString('\n')
	numbers := strings.Fields(strings.TrimSpace(input))

	// 答えの計算
	answer := 0
	for _, numStr := range numbers {
		num, _ := strconv.Atoi(numStr)
		answer += num
	}

	// 出力
	fmt.Println(answer % 100)
}
