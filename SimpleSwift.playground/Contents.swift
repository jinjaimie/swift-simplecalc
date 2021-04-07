print("Welcome to the UW Calculator Playground")

func calculate(_ args: [String]) -> Int {
    switch args.last {
        case "count":
            return args.count - 1
        case "avg":
            if (args.count > 1) {
                var total = 0
                for a in args {
                    if (Int(a) != nil) {
                        total += Int(a)!
                    }
                }
                return total / (args.count - 1)
            }
        case "fact":
            if (args.count > 1) {
                var total = 1
                if(Int(args[0])! > 0) {
                    for n in 1...Int(args[0])! {
                        total *= n
                    }
                }
                return total
            }
    default:
        switch args[1] {
        case "+":
            return Int(args[0])! + Int(args[2])!
        case "-":
            return Int(args[0])! - Int(args[2])!
        case "/":
            return Int(args[0])! / Int(args[2])!
        case "*":
            return Int(args[0])! * Int(args[2])!
        case "%":
            return Int(args[0])! % Int(args[2])!
        default:
            return 0
        }
    }
    return 0
}

func calculate(_ arg: String) -> Int {
    let args = (arg.split(separator: " ")).map({ (substring) in
        return String(substring)
    })
    return calculate(args)
}

// -------------------------------------------
// All of these expressions should return true
// if you have implemented calculate() correctly
//
calculate(["2", "+", "2"]) == 4
calculate(["4", "+", "4"]) == 8
calculate(["2", "-", "2"]) == 0
calculate(["2", "*", "2"]) == 4
calculate(["2", "/", "2"]) == 1
calculate(["2", "%", "2"]) == 0

calculate(["1", "2", "3", "count"]) == 3
calculate(["1", "2", "3", "4", "5", "count"]) == 5
calculate(["count"]) == 0

calculate(["1", "2", "3", "4", "5", "avg"]) == 3
    // 15 / 5 = 3
calculate(["2", "2", "4", "4", "avg"]) == 3
    // 12 / 4 = 3
calculate(["2", "avg"]) == 2
    // 2 / 1 = 2
calculate(["avg"]) == 0
    // 0 / 0 = 0 (not really, but it's an edge case

calculate(["0", "fact"]) == 1
calculate(["1", "fact"]) == 1
calculate(["2", "fact"]) == 2 // 2*1
calculate(["5", "fact"]) == 120 // 5*4*3*2*1
calculate(["fact"]) == 0

calculate("2 + 2") == 4
calculate("2 * 2") == 4
calculate("2 - 2") == 0
calculate("2 / 2") == 1

calculate("1 2 3 4 5 count") == 5
calculate("1 2 3 4 5 avg") == 3
calculate("5 fact") == 120

// -------------------------------------------
// These are extra credit tests; commented out
// uncomment them to turn them on for evaluation

// Implement calculate([String]) and calculate(String)
// to handle negative numbers

calculate(["2", "+", "-2"]) == 0
calculate(["2", "-", "-2"]) == 4
calculate(["2", "*", "-2"]) == -4
calculate(["2", "/", "-2"]) == -1
calculate(["-5", "%", "2"]) == -1

calculate(["1", "-2", "3", "-2", "5", "avg"]) == 1

calculate("2 + -2") == 0
calculate("2 * -2") == -4
calculate("2 - -2") == 4
calculate("-2 / 2") == -1

calculate("1 -2 3 -4 5 count") == 5

 
// Implement calculate([String]) and calculate(String)
// to use floating-point values
/*
func calculate(_ args: [String]) -> Double {
    let operations = ["+", "-", "/", "*", "%", "count", "avg", "fact"]
    var numbers: [Double] = []
    var selectedOp: String = ""
    for val in args {
        if(operations.contains(val)) {
            selectedOp = val
        } else {
            let num: Double = Double(val)!
            numbers.append(num)
        }
    }
    var total: Double = 0;
    switch selectedOp {
    case "+":
        for n in numbers {
            total += n
        }
    case "-":
        total = numbers[0] - numbers[1]
    case "/":
        total = numbers[0] / numbers[1]
    case "*":
        total = 1;
        for n in numbers {
            total *= n
        }
    case "%":
        total = numbers[0].truncatingRemainder(dividingBy: numbers[1])
    case "count":
        total = Double(numbers.count)
    case "avg":
        if (numbers.count != 0) {
            for n in numbers {
                total += n
            }
            total /= Double(numbers.count)
        }
    case "fact":
        if (numbers.count != 0) {
            total = 1
            if (numbers[0] != 0) {
                for n in 1...Int(numbers[0]) {
                    total *= Double(n)
                }
            }
        }
    default:
        return -1
    }
    return total
}
 
func calculate(_ arg: String) -> Double {
    let args = (arg.split(separator: " ")).map({ (substring) in
        return String(substring)
    })
    return calculate(args)
}

calculate(["2.0", "+", "2.0"]) == 4.0
calculate([".5", "+", "1.5"]) == 2.0
calculate(["12.0", "-", "12.0"]) == 0.0
calculate(["2.5", "*", "2.5"]) == 6.25
calculate(["2.0", "/", "2.0"]) == 1.0
calculate(["2.0", "%", "2.0"]) == 0.0
calculate("1.0 2.0 3.0 4.0 5.0 count") == 5
*/
