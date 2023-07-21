package main

import (
	"encoding/json"
	"fmt"

	"github.com/gofiber/fiber/v2"
	"github.com/twilio/twilio-go"
	twilioApi "github.com/twilio/twilio-go/rest/api/v2010"
)


type Profile interface {
    // Method signatures without implementation
	string userName;
	string phoneNumber;
	string name;
	uint age;
	string gender;
	string password;
	string lastName;
	string interests;
	string bio;
	string mail;
	string hotLocation;
	string last100Location;
	string deviceModel;
	string Votes;
	string politicalView;
	string Religion;
	string education;
}

