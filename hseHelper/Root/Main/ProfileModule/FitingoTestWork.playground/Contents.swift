

protocol StringBracketsValidating {
    /// Validates use of provided brackets within specified `String`
    ///
    /// Brackets are considered to be used correctly if:
    /// - For every opening bracket there is a closing bracket
    /// - Every closing bracket is a closing counterpart to the last opened but unclosed bracket
    ///
    /// - parameter brackets: Dictionary of expected brackets, where `Key` is an opening bracket
    ///                       and `Value` is its closing counterpart.
    /// - parameter string: String to validate.
    /// - returns: Whether brackets in specified `String` are used correctly.
    func validateBracketsUsedCorrectly(brackets: [Character: Character], in string: String) -> Bool
}


final class SolutionFalseWithAnotherCharacters: StringBracketsValidating {
    /// ([]{})[] -> True
    /// ()[{]} -> False
    /// (aaas)[]{s} -> False
    func validateBracketsUsedCorrectly(brackets: [Character: Character], in string: String) -> Bool {
        guard string.count > 0 else { return true }
        var stack = [Character]()
        
        for char in string {
            if brackets.keys.contains(char) {
                stack.append(char)
            } else {
                if stack.count > 0, char == brackets[stack[stack.count - 1]]! {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        
        return stack.count == 0
    }
}


final class SolutionTrueWithAnotherCharacters: StringBracketsValidating {
    /// ([]{})[] -> True
    /// ()[{]} -> False
    /// (aaas)[]{s} -> True
    func validateBracketsUsedCorrectly(brackets: [Character : Character], in string: String) -> Bool {
        guard string.count > 0 else { return true }
        var stack = [Character]()
        
        for char in string {
            if brackets.keys.contains(char) {
                stack.append(char)
            } else if brackets.values.contains(char) {
                if stack.count > 0, char == brackets[stack[stack.count - 1]]! {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        
        return stack.count == 0
    }
}

private let dict: [Character: Character] = ["(":")", "{":"}", "[":"]"]

let solution1 = SolutionFalseWithAnotherCharacters()
solution1.validateBracketsUsedCorrectly(brackets: dict, in: "([]{})[]{}")

let solution2 = SolutionTrueWithAnotherCharacters()
solution2.validateBracketsUsedCorrectly(brackets: dict, in: "s(a[qqqsc]{../}asd)[78]{}")
