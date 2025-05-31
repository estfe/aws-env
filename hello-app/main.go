package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Wello World, yay5")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))

}
