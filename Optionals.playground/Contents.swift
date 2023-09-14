let name: String? = "nil"
print(name)

//let score: Int = nil //will be compiler error becsause its not optional

class Vehicle{
    var owner: Person?
    var wheels: Int = 4
    var name: String?
}

let car = Vehicle()
print(car.wheels)
print(car.name)

car.name = "Maserati"
print(car.name)

//let email: String? = "johndoe@example.com"

//forced unwrapping - check to make sure it has a value first, otherwise a crash will occur

//if email != nil{
//    print(email!)
//}

//optional binding
let  username: String? = "bob42"

if let user = username {
    print(user)
}

let firstName: String? = "o"
let lastName: String? = "bryan"//make sure they have values, not nil
let email: String? = "Porsche"

if let fName_ = firstName,
let lName_ = lastName,
let email_ = email{
    print("got it all")
}
if let score = Int("42"){
    print(score)
}

func testGuard(userName: String?){
    guard let uName = userName else{
        return
}
    print("logged in as \(uName)")
}

testGuard(userName: nil)
testGuard(userName: "bob42")


class DriversLicense{
    var points = 0
    
    func isValidFor(vehicle: Vehicle) -> Bool {
        true
    }
}

class Person {
    var license: DriversLicense?
    
}

let andy = Person()
andy.license = DriversLicense()
let clownCar = Vehicle()
clownCar.owner = andy

if let canDriveVehicle = andy.license?.isValidFor(vehicle: clownCar){
    if canDriveVehicle{
        print("Andy can drive the Clown Car")
    }else{
        print("Andy can't drive the Clown Car")
    }
}else{
    print("Andy Doesn't have a license")
}


if let license = andy.license{
    print("Andy has \(license.points) points")
}else{
    print("Andy doesn't have a license")
}

//optional chaining - pointsOnLicense is nil or value wrapped in an optional
let pointsOnLicense = andy.license?.points

if let points = pointsOnLicense{
    print("Andy has \(points) points")
}else{
    print("Andy doesn't have a license")
}

if let points = clownCar.owner?.license?.points{
    print("The car's owner has \(points) points")
}

var points = 3
andy.license?.points = points //will fail becasue andy doiesnt have alicense

andy.license = DriversLicense()

if let _ = andy.license?.points += points{
    print("Andy now has \(andy.license!.points) points")
}

var catalog = ["Honda": (minPrice: 10, maxPrice: 100)]
//accessing a dictionary using a subscript returns an optional
var honda = catalog["Honda"]
print(honda)

if let price = catalog["Honda"]?.minPrice{
    print("the min price is \(price)")
}

if let _ = catalog["Honda"]?.maxPrice = 30{
    print(catalog)
}
var otherCatalog: Dictionary? = ["Lotus": (minPrice: 50, maxPrice: 200)]

var lotus = otherCatalog?["Lotus"]
if let price = otherCatalog?["Lotus"]?.minPrice{
    print("the min price \(price)")
}


var minPrice = catalog["Lotus"]?.minPrice ?? 0
print("Min price of Lotus: \(minPrice)")
minPrice = catalog["Honda"]?.minPrice ?? 0
print("Min price of Honda: \(minPrice)")
