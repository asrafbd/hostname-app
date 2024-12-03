package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
)

func main() {
	fmt.Println("Server is running at localhost:8080")
	http.HandleFunc("/", hello)
	http.ListenAndServe(":8080", nil)
}

func hello(w http.ResponseWriter, r *http.Request) {

	log.Printf("Serving request at: %s", r.URL.Path)

	host, _ := os.Hostname()

	fmt.Fprintf(w, "Helllo World\n")
	fmt.Fprintf(w, "Hostname: %s\n", host)
	fmt.Fprintf(w, "Version: v1.0")

}
