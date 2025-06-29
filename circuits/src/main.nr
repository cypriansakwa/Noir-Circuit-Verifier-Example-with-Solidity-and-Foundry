fn main(votes: [bool; 5], threshold: pub Field) -> pub bool {
    let mut yes_count = 0;
    for vote in votes {
        if vote {
            yes_count += 1;
        }
    }

    // Explicit cast from Field to u32
    yes_count >= threshold as u32
}
#[test]
fn test_votes_pass_threshold() {
    let votes = [true, false, true, true, false];
    let threshold = 3;
    let result = main(votes, threshold);
    assert(result == true);
}

#[test]
fn test_votes_fail_threshold() {
    let votes = [true, false, false, true, false];
    let threshold = 3;
    let result = main(votes, threshold);
    assert(result == false);
}

#[test]
fn test_all_true_votes_pass() {
    let votes = [true, true, true, true, true];
    let threshold = 5;
    let result = main(votes, threshold);
    assert(result == true);
}

#[test]
fn test_all_false_votes_fail() {
    let votes = [false, false, false, false, false];
    let threshold = 1;
    let result = main(votes, threshold);
    assert(result == false);
}