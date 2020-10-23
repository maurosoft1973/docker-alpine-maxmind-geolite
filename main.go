package main

import (
	"encoding/json"
	"log"
  	"net"
	"net/http"
	"github.com/gorilla/mux"
  	"github.com/oschwald/geoip2-golang"
)

func main() {
	// Init router
	r := mux.NewRouter()

	// Hardcoded data - @todo: add database
	r.HandleFunc("/{ip}", getIP)

	// Start server
	log.Fatal(http.ListenAndServe(":3001", r))
}

// Get single contact
func getIP(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Content-Type", "application/json")
	params := mux.Vars(r) // Gets params

    db, err := geoip2.Open("./db.mmdb")
	
  	if err != nil {
	   return
	}
	
  	defer db.Close()
	ip := net.ParseIP(params["ip"])
	record, err := db.City(ip)
	
  	if err != nil {
     	return
	}

	json.NewEncoder(w).Encode(record)
}