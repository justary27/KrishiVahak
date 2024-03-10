package apis

import (
	"backend/controllers"

	"github.com/gofiber/fiber/v2"
)

func CreateVehicle(vehicleGroup fiber.Router) {
	vehicleGroup.Post("/", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func GetVehicles(vehicleGroup fiber.Router) {
	vehicleGroup.Get("/", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func GetVehicle(vehicleGroup fiber.Router) {
	vehicleGroup.Get("/:vehicleId", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func UpdateVehicle(vehicleGroup fiber.Router) {
	vehicleGroup.Put("/:vehicleId", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}

func DeleteVehicle(vehicleGroup fiber.Router) {
	vehicleGroup.Delete("/:vehicleId", func(ctx *fiber.Ctx) error {
		return controllers.ListRequests(ctx)
	})
}
