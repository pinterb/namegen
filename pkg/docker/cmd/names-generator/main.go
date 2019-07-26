package main

import (
	"fmt"
	"math/rand"
	"time"

	"github.com/pinterb/namegen/pkg/docker"
)

func main() {
	rand.Seed(time.Now().UnixNano())
	fmt.Println(docker.GetRandomName(0))
}
