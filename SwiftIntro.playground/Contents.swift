class TipCalculator {
    let total: Double
    let taxPct: Double
    let subtotal: Double
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
        subtotal = total / (taxPct + 1)
    }
    
    func calcTipWith(tipPct: Double) -> Double {
        subtotal * tipPct //implicit return from single expression
    }//calcTipWith
    
    func printPossibleTips(){
//        print ("15%: \(calcTipWith(tipPct: 0.15))")
//        print ("18%: \(calcTipWith(tipPct: 0.18))")
//        print ("20%: \(calcTipWith(tipPct: 0.20))")
        let possibleTip = [0.15, 0.18, 0.20]
        
        for tip in possibleTip {
            print ("\(tip * 100)%: \(calcTipWith(tipPct: tip))")
        }
        
        for i in 0..<possibleTip.count{
            print ("\(possibleTip[i] * 100)%: \(calcTipWith(tipPct: possibleTip[i]))")
        }
        
    }//printPossibleTips
    
    func returnPossibleTips() -> [Int: Double]{
        let posibleTip = [0.15, 0.18, 0.20]
        
        var retVal = Dictionary<Int,Double>() // or [Int: Double]
        
        
        for tip in posibleTip{
            let intPct = Int(tip * 100)
            retVal[intPct] = calcTipWith(tipPct: tip)
        }
        return retVal
    }
    
}//TipCalculator


let tipCalc = TipCalculator(total: 33.25, taxPct: 0.06)
tipCalc.printPossibleTips()
tipCalc.returnPossibleTips()






//let tutorialTeam: Int = 56
//let editorialTeam = 23
//var totalteam = tutorialTeam + editorialTeam
//
//totalteam += 1
//
//let price = 19.99
//let onSale = false
//
//let name = "Porsche"
//
//let str = """
//
//    This is another string.\
//     It spans multiple lines.
//    """
//
//if onSale {
//    print("\(name) on sale for \(price)")
//}else{
//    print("\(name) at regular price \(price)")
//}

