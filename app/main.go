package main

import (
	"github.com/maxence-charriere/go-app/v7/pkg/app"
	"net/http"
)

func main() {
	h := &app.Handler{
		Title:  "Hello Demo",
		Author: "leofigy",
	}

	if err := http.ListenAndServe(":7777", h); err != nil {
		panic(err)
	}

}
