package main

import (
	"fmt"
	"math/rand"
	"time"

	"github.com/pinterb/namegen/pkg/packers"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	fmt.Println(packers.GetRandomName(0))
}
