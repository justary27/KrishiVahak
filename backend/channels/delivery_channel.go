package channels

// import (
// 	model "backend/models"
// 	"fmt"

// 	"github.com/gofiber/fiber/v2"
// 	"github.com/gofiber/websocket/v2"
// )

// var (
// 	clients  = make(map[string]*model.Client) // connected clients
// 	upgrader = websocket.New(fiber.Config{})  // WebSocket upgrader
// )

// func handleWebSocket(c *fiber.Ctx) {
// 	conn, err := upgrader.Upgrade(c)
// 	if err != nil {
// 		fmt.Println("WebSocket upgrade error:", err)
// 		return
// 	}

// 	name := c.Params("username")
// 	client := &model.Client{Name: name, Conn: conn}

// 	// Register the client
// 	clients[name] = client

// 	defer func() {
// 		// Unregister the client on connection close
// 		delete(clients, name)
// 		_ = conn.Close()
// 	}()

// 	// Read and relay messages from the client
// 	for {
// 		var msg model.Message
// 		err := conn.ReadJSON(&msg)
// 		if err != nil {
// 			// If there's an error reading from the client, break out of the loop
// 			break
// 		}

// 		// Relay the message to the other participant
// 		otherParticipant := c.Params("otherUsername")
// 		otherClient, found := clients[otherParticipant]
// 		if found {
// 			err := otherClient.Conn.WriteJSON(msg)
// 			if err != nil {
// 				fmt.Println("Error relaying message:", err)
// 			}
// 		}
// 	}
// }
//
