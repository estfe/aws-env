package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Println("Hello world! YAY")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))

}
