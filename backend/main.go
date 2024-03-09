package main

import (
	"backend/controllers"
	"backend/database"

	model "backend/models"

	"github.com/gofiber/fiber/v2"
)

func setupRoutes(app *fiber.App) {
	app.Get("/request", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})

	app.Post("/request", func(ctx *fiber.Ctx) error {
		request := &model.Request{
			// Set the necessary fields of the request.
		}
		return controllers.CreateRequest(request)
	})

    app.Get("/user", func(ctx *fiber.Ctx) error {
        return controllers.ListUsers(ctx)
    })

    app.Post("/user", func(ctx *fiber.Ctx) error {
    // Define a struct to hold the request body
        type CreateUserRequest struct {
            Name        string `json:"name"`
            PhoneNumber string `json:"phoneNumber"`
        }
        
        // Parse the request body into the struct
        req := new(CreateUserRequest)
        if err := ctx.BodyParser(req); err != nil {
            return err
        }

        // Create a new User instance with the parsed data
        user := &model.User{
            Name:        req.Name,
            PhoneNumber: req.PhoneNumber,
        }

        // Save the new user to the database
        if err := database.DB.Create(&user).Error; err != nil {
            return err
        }
        return ctx.JSON(user)
    })

	// app.Get("/fact", controllers.NewFactView)
	// app.Post("/request", controllers.CreateRequest)

	// app.Get("/fact/:id", controllers.ShowFact)

	// app.Get("/fact/:id/edit", controllers.EditFact)
	// app.Patch("/fact/:id", controllers.UpdateFact)

	// app.Delete("/fact/:id", controllers.DeleteFact)
}


func main() {
    // Start a new fiber app
    app := fiber.New()

    // Connect to the Database
    database.ConnectDB()
    setupRoutes(app)
    // Send a string back for GET calls to the endpoint "/"
    app.Get("/", func(c *fiber.Ctx) error {
        err := c.SendString("And the API is UP!")
        return err
    })

    // Listen on PORT 3000
    app.Listen(":3000")
}