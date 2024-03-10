package base

import (
	"backend/apis"

	"github.com/gofiber/fiber/v2"
	"github.com/gofiber/fiber/v2/middleware/cors"
)

type FiberApp struct {
	App *fiber.App
}

func NewFiberApp() *FiberApp {
	app := &FiberApp{
		App: fiber.New(),
	}

	app.App.Use(
		cors.New(
			cors.Config{
				AllowHeaders: "Origin,Content-Type,Accept,Content-Length,Accept-Language,Accept-Encoding,Connection,Access-Control-Allow-Origin",
			},
		))

	app.registerUserApis()
	app.registerRequestApis()

	return app
}

func (fiberApp *FiberApp) registerUserApis() {
	userRouter := fiberApp.App.Group("/user")

	apis.CreateUser(userRouter)
	apis.GetUsers(userRouter)
	apis.GetUser(userRouter)
	apis.UpdateUser(userRouter)
	apis.DeleteUser(userRouter)
}

func (fiberApp *FiberApp) registerRequestApis() {
	requestRouter := fiberApp.App.Group("/requests")

	apis.CreateRequest(requestRouter)
}
