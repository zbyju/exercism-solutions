// Package weather provides a function for forecasting.
package weather

// CurrentCondition describes the current conditions as string.
var CurrentCondition string

// CurrentLocation is a variables that holds the location.
var CurrentLocation string

// Forecast takes in city and condition as strings and formats them for pretty forecast.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
