package main

import (
	"log"
	"net/http"
	_ "net/http/pprof"

	isuports "github.com/isucon/isucon12-qualify/webapp/go"
)

func main() {
	go func() {
		log.Print(http.ListenAndServe("localhost:6060", nil))
	}()

	isuports.Run()
}
