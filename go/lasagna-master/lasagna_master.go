package lasagna

// TODO: define the 'PreparationTime()' function
func PreparationTime(s []string, t int) int {
	if t == 0 {
		t = 2
	}
	return len(s) * t
}

func Quantities(l []string) (int, float64) {
	n := 0
	s := 0

	for _, x := range l {
		if x == "noodles" {
			n++
		} else if x == "sauce" {
			s++
		}
	}
	return n * 50, float64(s) / 5
}

func AddSecretIngredient(fl []string, l []string) {
	l[len(l)-1] = fl[len(fl)-1]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	x := float64(portions) / 2
	res := make([]float64, len(quantities))
	for i := range quantities {
		res[i] = quantities[i] * x
	}
	return res
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
