# calculatorSpec.coffee

describe 'Calculator', ->

    it 'can add two positive numbers', ->
        calculator = new Calculator()
        result = calculator.add 2, 3
        expect(result).toBe 5

    it 'can handle negative number addition', ->
        calculator = new Calculator()
        result = calculator.add -10, 5
        expect(result).toBe -5

    it 'can subtract two positive numbers', ->
        calculator = new Calculator()
        result = calculator.subtract 10, 6
        expect(result).toBe 4

    it 'can handle negative number subtraction', ->
        calculator = new Calculator()
        result = calculator.subtract 4, -6
        expect(result).toBe 10