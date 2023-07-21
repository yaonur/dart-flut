package main

import (
	"encoding/json"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/twilio/twilio-go"
	twilioApi "github.com/twilio/twilio-go/rest/api/v2010"
)

func main() {
	accountSid := "AC7f7b15c47ab1f34ec85c6054ed614637"
	authToken := "eec9b4bba947b8d9f87f3c03eab7bae1"
	app := fiber.New()

	app.Get("/api/send-verification", func(c *fiber.Ctx) error {

		// Initialize the Twilio client
		client := twilio.NewRestClientWithParams(twilio.ClientParams{
			Username: accountSid,
			Password: authToken,
		})

		params := &twilioApi.CreateMessageParams{}
		params.SetTo("+905303218044")
		params.SetFrom("+12727882337")
		params.SetBody("Hello from Go!")

		resp, err := client.Api.CreateMessage(params)
		if err != nil {
			fmt.Println("Error sending SMS message: " + err.Error())
		} else {
			response, _ := json.Marshal(*resp)
			fmt.Println("Response: " + string(response))
		}

		return c.Status(fiber.StatusOK).JSON(fiber.Map{
			"message": "Verification code sent successfully",
		})
	})

	app.Get("/api/send-verification", func(c *fiber.Ctx) error {

		// Initialize the Twilio client
		client := twilio.NewRestClientWithParams(twilio.ClientParams{
			Username: accountSid,
			Password: authToken,
		})

		params := &twilioApi.CreateMessageParams{}
		params.SetTo("+905303218044")
		params.SetFrom("+12727882337")
		params.SetBody("Hello from Go!")

		resp, err := client.Api.CreateMessage(params)
		if err != nil {
			fmt.Println("Error sending SMS message: " + err.Error())
		} else {
			response, _ := json.Marshal(*resp)
			fmt.Println("Response: " + string(response))
		}

		return c.Status(fiber.StatusOK).JSON(fiber.Map{
			"message": "Verification code sent successfully",
		})
	})
	app.Post("/api/verify-code", func(c *fiber.Ctx) error {
		// Get the phone number from the request body (JSON payload)
		type PhoneRequest struct {
			PhoneNumber string `json:"phone_number"`
		}
		var phoneReq PhoneRequest
		if err := c.BodyParser(&phoneReq); err != nil {
			return c.Status(fiber.StatusBadRequest).JSON(fiber.Map{
				"error": "Invalid request",
			})
		}

		// Initialize the Twilio client
		client := twilio.NewRestClientWithParams(twilio.ClientParams{
			Username: accountSid,
			Password: authToken,
		})

		params := &twilioApi.CreateMessageParams{}
		params.SetTo(phoneReq.PhoneNumber)
		params.SetFrom("+12727882337")                      // Replace with your Twilio phone number
		params.SetBody("Your verification code is: 123456") // Replace with your generated verification code

		_, err := client.Api.CreateMessage(params)
		if err != nil {
			fmt.Println("Error sending SMS message: " + err.Error())
			return c.Status(fiber.StatusInternalServerError).JSON(fiber.Map{
				"error": "Failed to send verification code",
			})
		}

		return c.Status(fiber.StatusOK).JSON(fiber.Map{
			"message": "Verification code sent successfully",
		})
	})

	// Add more API endpoints here as per your requirements.

	// Start the server on port 8080.
	err := app.Listen(":8080")
	if err != nil {
		panic(err)
	}
}
