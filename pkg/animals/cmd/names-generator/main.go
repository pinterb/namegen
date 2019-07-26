package main

import (
	"fmt"
	"math/rand"
	"time"

	"github.com/pinterb/namegen/pkg/animals"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	fmt.Println(animals.GetRandomName(0))
}
