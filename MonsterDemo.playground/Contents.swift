//class Monster : CustomStringConvertible, CustomDebugStringConvertible {
//    private var numHeads: Int = 1
//    private var name: String = ""
//    private var weapons: [String] = []
//    private var undead: Bool = false
//    
//    var description: String{ "Name: \(name), Number of Heads \(numHeads)" }
//    var debugDescription: String { "Name: \(name), Number of Heads \(numHeads), Weapons: \(weapons), undead: \(undead)" }
//    
//    init(numHeads: Int, name: String, weapons: [String], undead: Bool){
//        
//        self.undead = undead
//        setNumHeads(numHeads)
//        set(name: name)
//        set(weapons: weapons)
//        
//    }//initializing the variables
//    
//    convenience init(){
//        self.init(numHeads: 1, name: "Orc", weapons: [], undead: false)
//    }
//    
//    func getNumHeads() -> Int {numHeads}
//    func setNumHeads(_ _numHeads: Int){
//        if _numHeads < 0 || _numHeads > 1000{
//            numHeads = 500
//        }else{
//            numHeads = _numHeads
//        }
//    }
//    
//    func getName() -> String {name}
//    func set(name: String){
//        self.name = name
//    }
//    
//    func getWeapons() -> [String] {weapons}
//    func set(weapons: [String]){
//        self.weapons = weapons
//    }
//    
//    func fearSomeRoar(){
//        print("ROAR!!!!")
//    }
//    
//} //Monster
//
//let m1 = Monster()
//print(m1)
//print(m1.debugDescription)//Either one will work
//debugPrint(m1)//Either one will work
//m1.fearSomeRoar()
//print("The monsters name is \(m1.getName())")
//
//m1.set(name: "Dog")
//m1.setNumHeads(4)
//debugPrint(m1)
//
//let m2 = Monster(numHeads: 5000, name: "Dwarf", weapons: ["Bad Breath", "Hard Head"], undead: true)
//debugPrint(m2)
//


// For struct, remove any initialization, and add mutating to the set properties of anything immutable
struct Monster : CustomStringConvertible, CustomDebugStringConvertible {
     var numHeads: Int
    var name: String
     var weapons: [String]
     var undead: Bool
    
    var description: String{ "Name: \(name), Number of Heads \(numHeads)" }
    var debugDescription: String { "Name: \(name), Number of Heads \(numHeads), Weapons: \(weapons), undead: \(undead)" }
    
    func getNumHeads() -> Int {numHeads}
   mutating func setNumHeads(_ _numHeads: Int){
        if _numHeads < 0 || _numHeads > 1000{
            numHeads = 500
        }else{
            numHeads = _numHeads
        }
    }
    
    func getName() -> String {name}
    mutating func set(name: String){
        self.name = name
    }
    
    func getWeapons() -> [String] {weapons}
    mutating func set(weapons: [String]){
        self.weapons = weapons
    }
    
    func fearSomeRoar(){
        print("ROAR!!!!")
    }
    
} //Monster

extension Monster{
    init(){
        undead = false
        numHeads = 1
        name = "Orc"
        weapons = []
    }
}

var m1 = Monster()
print(m1)
print(m1.debugDescription)//Either one will work
debugPrint(m1)//Either one will work
m1.fearSomeRoar()
print("The monsters name is \(m1.getName())")

m1.set(name: "Dog")
m1.setNumHeads(4)
debugPrint(m1)

let m2 = Monster(numHeads: 5000, name: "Dwarf", weapons: ["Bad Breath", "Hard Head"], undead: true)
debugPrint(m2)

