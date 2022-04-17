package main

import (
    "encoding/json"
    "log"
    "net"
    "os"
    "strings"
    "net/http"
    "github.com/gorilla/mux"
    "github.com/oschwald/geoip2-golang"
)

func main() {
    // Init router
    r := mux.NewRouter()

    log.Println("Listen IP: ", os.Getenv("LISTEN_IP"))
    log.Println("Listen Port: ", os.Getenv("LISTEN_PORT"))
         
    // Register Handler
    r.HandleFunc("/{ip:[0-9]+.[0-9]+.[0-9]+.[0-9]+}", getIP)
    r.HandleFunc("/myip", getRemoteIP)

    // Start server
    log.Fatal(http.ListenAndServe(os.Getenv("LISTEN_IP") + ":" + os.Getenv("LISTEN_PORT"), r))
}

// Get Geo IP
func getIP(rw http.ResponseWriter, rq *http.Request) {
    rw.Header().Set("Content-Type", "application/json")
    params := mux.Vars(rq) // Gets params

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

    json.NewEncoder(rw).Encode(record)
}

// Get Remote IP Address
func getRemoteIP(rw http.ResponseWriter, rq *http.Request) {
    rw.Header().Set("Content-Type", "application/text")
    rw.WriteHeader(http.StatusOK)

    var userIP string

    if len(rq.Header.Get("CF-Connecting-IP")) > 1 {
        userIP = rq.Header.Get("CF-Connecting-IP")
    } else if len(rq.Header.Get("X-Forwarded-For")) > 1 {
        userIP = rq.Header.Get("X-Forwarded-For")
    } else if len(rq.Header.Get("X-Real-IP")) > 1 {
        userIP = rq.Header.Get("X-Real-IP")
    } else {
        userIP = rq.RemoteAddr
    }

    log.Println("Remote IP: " + userIP)

    if strings.Contains(userIP, ":") {
        rw.Write([]byte(strings.Split(userIP, ":")[0]))
    } else {
        rw.Write([]byte(userIP))
    }
}