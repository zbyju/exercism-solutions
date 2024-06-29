package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string][]bool

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) int {
	f := cb[file]

	cnt := 0
	for _, c := range f {
		if c {
			cnt += 1
		}
	}
	return cnt
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) int {
	cnt := 0
	for _, r := range cb {
		if rank-1 >= 0 && rank-1 < len(r) && r[rank-1] {
			cnt += 1
		}
	}
	return cnt
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) int {
	cnt := 0
	for _, f := range cb {
		for range f {
			cnt += 1
		}
	}
	return cnt
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) int {
	cnt := 0
	for _, f := range cb {
		for _, c := range f {
			if c {
				cnt += 1
			}
		}
	}
	return cnt
}
