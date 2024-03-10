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
	app.registerServiceApis()
	app.registerVehicleApis()

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
	apis.GetRequests(requestRouter)
	apis.GetRequest(requestRouter)
	apis.UpdateRequest(requestRouter)
	apis.DeleteRequest(requestRouter)
}

func (fiberApp *FiberApp) registerServiceApis() {
	servicesRouter := fiberApp.App.Group("/services")

	apis.CreateService(servicesRouter)
	apis.GetServices(servicesRouter)
	apis.GetService(servicesRouter)
	apis.UpdateService(servicesRouter)
	apis.DeleteService(servicesRouter)
}

func (fiberApp *FiberApp) registerVehicleApis() {
	vehicleRouter := fiberApp.App.Group("/vehicles")

	apis.CreateVehicle(vehicleRouter)
	apis.GetVehicles(vehicleRouter)
	apis.GetVehicle(vehicleRouter)
	apis.UpdateVehicle(vehicleRouter)
	apis.DeleteVehicle(vehicleRouter)
}
