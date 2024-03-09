package main

import (
	"backend/base"
	"backend/database"

	model "backend/models"
)

func main() {
	// Start a new fiber app
	app := base.NewFiberApp()

	// Connect to the Database
	database.ConnectDB()
	// Send a string back for GET calls to the endpoint "/"

	err := database.DB.AutoMigrate(&model.User{}, &model.Request{}, &model.ActiveRequest{})
	if err != nil {
		panic("Error during migration: " + err.Error())
	}

	// Listen on PORT 3000
	app.App.Listen(":3000")
}
