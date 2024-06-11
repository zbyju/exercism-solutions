package booking

import (
	"fmt"
	"time"
)

// Schedule returns a time.Time from a string containing a date.
func Schedule(date string) time.Time {
	val, _ := time.Parse("1/2/2006 15:04:05", date)
	return val
}

func parse(date string) time.Time {
	d, _ := time.Parse("January 2, 2006 15:04:05", date)
	return d
}

// HasPassed returns whether a date has passed.
func HasPassed(date string) bool {
	now := time.Now()
	d := parse(date)
	return d.Compare(now) < 0
}

// IsAfternoonAppointment returns whether a time is in the afternoon.
func IsAfternoonAppointment(date string) bool {
	d, _ := time.Parse("Monday, January 2, 2006 15:04:05", date)
	noon := time.Date(d.Year(), d.Month(), d.Day(), 12, 0, 0, 0, d.Location())
	afternoon := time.Date(d.Year(), d.Month(), d.Day(), 18, 0, 0, 0, d.Location())
	fmt.Println(noon)
	fmt.Println(afternoon)
	return d.Compare(noon) >= 0 && d.Compare(afternoon) < 0
}

// Description returns a formatted string of the appointment time.
func Description(date string) string {
	d := Schedule(date)
	return fmt.Sprintf("You have an appointment on %s", d.Format("Monday, January 2, 2006, at 15:04."))
}

// AnniversaryDate returns a Time with this year's anniversary.
func AnniversaryDate() time.Time {
	return time.Date(time.Now().Year(), time.September, 15, 0, 0, 0, 0, time.UTC)
}
