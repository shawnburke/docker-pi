package main

import (
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
)

func main() {

	c := make(chan os.Signal, 1)
	signal.Notify(c, os.Interrupt)
	go func() {
		<-c
		fmt.Println("Shutting down...")
		os.Exit(0)
	}()

	http.HandleFunc("/", serveHTTP)
	port := 8080
	log.Printf("Server listening on port %d", port)
	err := http.ListenAndServe(fmt.Sprintf(":%d", port), nil)
	if err != nil {
		log.Fatalf("Failed to start server, err=%v", err)
	}
}

func serveHTTP(w http.ResponseWriter, r *http.Request) {
	log.Printf("Request received: %s, Remote=%s", r.URL.Path, r.RemoteAddr)
	w.Header().Add("Content-Type", "application/json")
	w.Write([]byte(`{"status": "ok"}`))
}

