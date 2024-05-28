package blackjack

// ParseCard returns the integer value of a card following blackjack ruleset.
func ParseCard(card string) (val int) {
	switch card {
	case "ace":
		val = 11
	case "two":
		val = 2
	case "three":
		val = 3
	case "four":
		val = 4
	case "five":
		val = 5
	case "six":
		val = 6
	case "seven":
		val = 7
	case "eight":
		val = 8
	case "nine":
		val = 9
	case "ten":
		val = 10
	case "jack":
		val = 10
	case "queen":
		val = 10
	case "king":
		val = 10
	}
	return val
}

// FirstTurn returns the decision for the first turn, given two cards of the
// player and one card of the dealer.
func FirstTurn(card1, card2, dealerCard string) (decision string) {
	v1 := ParseCard(card1)
	v2 := ParseCard(card2)
	sum := v1 + v2
	d := ParseCard(dealerCard)
	switch {
	case card1 == "ace" && card2 == "ace":
		decision = "P"
	case sum == 21:
		if d >= 10 {
			decision = "S"
		} else {
			decision = "W"
		}
	case sum >= 17 && sum <= 20:
		decision = "S"
	case sum >= 12 && sum <= 16:
		if d >= 7 {
			decision = "H"
		} else {
			decision = "S"
		}
	default:
		decision = "H"
	}

	return decision
}
