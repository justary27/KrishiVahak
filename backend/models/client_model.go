package model

import "github.com/gofiber/websocket/v2"

type Client struct {
	Name string
	Conn *websocket.Conn
}
