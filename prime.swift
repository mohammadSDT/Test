import Foundation



func readData(filePath : String) {
    let file = filePath
    let path = URL(fileURLWithPath: file)
    do {
        let text = try String(contentsOf: path)

        text.enumerateLines { (numberString, _) in
            let number = Int(numberString)!
            print(isPrime(number))
        }
    } catch {
        print(error)
    }
    
}

func isPrime(_ number: Int) -> Int {
    if number <= 1 {
        return 0
    }
    
    if number == 2 || number == 3  {
        return 1
    }
    
    if number > 2 && number % 2 == 0 {
        return 0
    }
    
    let maxDivider = Int(sqrt(Double(number)))
    
    let result = !(2...maxDivider).contains { number % $0 == 0 } ? 1 : 0
    
    return result
    
}

for argument in CommandLine.arguments {
    switch argument {
    case "prime.swift":
        break
    default:
        readData(filePath : argument)
    }
}