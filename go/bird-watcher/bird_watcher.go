package birdwatcher

// TotalBirdCount return the total bird count by summing
// the individual day's counts.
func TotalBirdCount(birdsPerDay []int) (sum int) {
	for _, v := range birdsPerDay {
		sum += v
	}
	return sum
}

// BirdsInWeek returns the total bird count by summing
// only the items belonging to the given week.
func BirdsInWeek(birdsPerDay []int, week int) int {
	i := (week - 1) * 7
	j := i + 7
	if j > len(birdsPerDay) || i >= len(birdsPerDay) || i < 0 || j < 0 {
		return 0
	}
	data := birdsPerDay[i:j]
	return TotalBirdCount(data)
}

// FixBirdCountLog returns the bird counts after correcting
// the bird counts for alternate days.
func FixBirdCountLog(birdsPerDay []int) []int {
	for i := range birdsPerDay {
		if i%2 == 0 {
			birdsPerDay[i]++
		}
	}
	return birdsPerDay
}
