package base

import (
	"backend/apis"

	"github.com/gofiber/fiber/v2"
)

type FiberApp struct {
	App *fiber.App
}

func NewFiberApp() *FiberApp {
	app := &FiberApp{
		App: fiber.New(),
	}

	app.registerUserApis()
	app.registerRequestApis()

	return app
}

func (fiberApp *FiberApp) registerUserApis() {
	userRouter := fiberApp.App.Group("/user")

	apis.GetUsers(userRouter)
	apis.CreateUser(userRouter)
	apis.UpdateUser(userRouter)
	apis.DeleteUser(userRouter)
}

func (fiberApp *FiberApp) registerRequestApis() {
	requestRouter := fiberApp.App.Group("/requests")

	apis.CreateRequest(requestRouter)
}
