package main

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprintln(w, "Wello World, yay4")
	})

	log.Fatal(http.ListenAndServe(":8080", nil))

}
