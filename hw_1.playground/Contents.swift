//---Swift Optional Types

//When this code is displayed, it says that the variable is an optional
var optionalVar = Optional("Hi this is an optional")

//Output is: Optional("Hi this is an optional")
print(optionalVar)

//Output is: Optional<String>
print(optionalVar.dynamicType)

//could also create an optional like this
print("Line 13")
var zipCode : Optional<Int>
print(zipCode)
print(zipCode.dynamicType)
print("Line 17")
//zipCode = 92887
print(zipCode)
print(zipCode.dynamicType)

var number : Int = 100
var number_2 : Optional<Int>
var number_3 : ImplicitlyUnwrappedOptional<Int>

//ImplicitlyUnwrappedOptional
var number_4 : Int!

//conditional unwrapping
var number_5 : Int?
func seeWhatHappens(res : Int?)
{
    //don't want to unwrap if checknig for nil
    //if we unwrap, then defeats the purpose of Optional
    //optional types help protect against nullReference  errors
    if res == nil
    {
        print("Found a nil")
    }
    else
    {
        //can unwrap res here b/c it won't be nil
        print("Using the ! operator to unwrap the parameter \(res!)")
    }
}

func seeWhatHappens_2(res : Int?)
{
    //don't want to unwrap if checknig for nil
    //if we unwrap, then defeats the purpose of Optional
    //optional types help protect against nullReference  errors
    if res == nil
    {
        print("Found a nil")
    }
    else
    {
        //can unwrap res here b/c it won't be nil
        print("Implicit optional \(res)")
    }
}
seeWhatHappens(8)
seeWhatHappens(number)
seeWhatHappens(number_2)
seeWhatHappens(number_3)
seeWhatHappens_2(number_3)
number_3 = 200
seeWhatHappens_2(number_3)
seeWhatHappens_2(number_4)
number_4 = 500
seeWhatHappens_2(number_4)

//optional chaining
var movieTitle : String?

var whatMovie = movieTitle?.endIndex
print(whatMovie)

movieTitle = "Mean Girls"
whatMovie = movieTitle?.endIndex
print(whatMovie)

//comparing optionals
var age : Int?
var age_2 : Int?
print(age==nil)
age = 5
print(age==5)
print(age == age_2)
age_2 = 5
print(age == age_2)
//================================================================
//================================================================

//---Swift Object Types

//------Enums
enum Genre : String
{
    case Classical
    case Pop
    case Rock
    case Country
    case Rap
    
    //enum method
    func showAllValues()
    {
        print("Classical, Pop, Rock, Country, Rap")
    }
}
//------Enum with raw type
enum AreaCode: Int
{
    case NorCal =  408
    case SoCal = 714
}

//------Class
class Music
{
    var genre : Genre = Genre.Classical
    var artist : String
    
    //failable initializer
    init?(genre : Genre, artist : String)
    {
        self.genre = genre
        self.artist = artist
        
        if artist == ""
        {
            return nil
        }
        
        //class method
        self.aboutMusic()
    }
    
    //instance method
    func getArtist() -> String
    {
        return artist
    }
    
    func aboutMusic(){
        print("Music is art!")
    }
    
    //subscript
    subscript(yearArtistPremiered : Int) -> Int {
        get{
            return 2016-yearArtistPremiered
        }
    }
}

var music_1 = Music(genre: Genre.Classical, artist: "Bond")
var music_2 = Music(genre: Genre.Rock, artist: "")
music_1?.aboutMusic()
music_2?.aboutMusic()

//------Structs
struct Skater
{
    var boardType : String
    var yearsExperience : Int
    
    mutating func setBoardType(type : String)
    {
        boardType = type
    }
}

//inheritance
class WaterMammal
{
    var liveBirth : Bool
    //in minutes
    var lengthHoldBreathUnderWater : Int
    //in miles
    var depth : Int
    
    init(liveBirth : Bool = true, lengthHoldBreathUnderWater : Int = 15, depth : Int = 1)
    {
        self.liveBirth = liveBirth
        self.lengthHoldBreathUnderWater = lengthHoldBreathUnderWater
        self.depth = depth
        
    }
    
    func swimDepth() -> Int
    {
        return depth
    }
    
    func size(s : Int)
    {
        switch s
        {
        case 1: print("Small water mammal")
        case 2: print("Medium water mammal")
        case 3: print("Whale")
        default: print("Invalid entry.")
        }
    }
}

class Whale : WaterMammal
{
    var teeth : String
    static var waterType : String = "Salt"
    
    required init(teeth : String)
    {
        self.teeth = teeth
    }
    
    //deinitializer
    deinit
    {
        self.teeth = ""
    }
    
}

class Orca : Whale
{
    override func size(n : Int)
    {
        super.size(2)
        print("Orcas are neither huge nor small. It is \(n) feet long")
    }
}

//class can't be subclassed
final class Dolphin
{
    var animal : String
    
    init(animal : String)
    {
        self.animal = animal
    }
    
    //convenience
    convenience init()
    {
        self.init(animal : "Dolphin")
        print("Hi I'm a dolphin!")
    }
}



//---Swift Protocols & Extensions
protocol Swimmer
{
    var mammal : Bool {get}
    var timeUnderWater : Int {get set}
    
    func typesOfTeeth()
    func howLongUnderWater()
    func size()
}

class Shark : Swimmer
{
    var mammal = false
    var timeUnderWater = 100
    func typesOfTeeth()
    {
        print("Sharp")
    }
    
    func howLongUnderWater()
    {
        print("Very Long")
    }
    
    func size()
    {
        print("Big for a fish")
    }
}

//extension
extension Shark
{
    func otherSharks()
    {print("Sharks can be small too!")}
}


var flower : Int = 2

switch flower
{
case 1: print("Daisy")
case 2: print("Rose")
    fallthrough
case 3: print("Thorny")
default: print("All flowers are pretty.")
}

for var i = 0; i < 5; ++i
{
    if(i == 2)
    {continue}
    else
    {print(i)}
}

for number in 90...100
{
    if(number == 95)
    {break}
    else{print(number)}
}

func getEverything(everything : AnyObject)
{
    print("I got a \(everything.dynamicType)")
}

var _shark =  Shark()
getEverything(_shark)

func whatever(b : Any){print(b.dynamicType)}
whatever(1)
//anyclass also umbrella type


//Swift Collection Types

//----Dictionary
var Armenian = [String:String]()
Armenian["Barev"] = "Hello"
Armenian["Paneer"] = "Cheese"
Armenian["Jour"] = "Water"


let sayHi = Armenian["Barev"]
print(sayHi)

Armenian.removeValueForKey("Jour")

if(Armenian.isEmpty)
{
    print("You don't know how to speak Armenian")
}
else
{
    print("You can speak some Armenian")
}

for (k, v) in Armenian
{
    print("\(k) means \(v)")
}

for k in Armenian.keys
{
    print("Keys:  \(k)")
}

for v in Armenian.values
{
    print("Values: \(v)")
}

//arrays
var pets = [String](count: 1, repeatedValue: "Tiger")
pets.append("Dog")
pets.append("Cat")
pets.append("Gold Fish")
pets.append("Owl")
pets.append("Frog")

pets[4]

pets.insert("Elephant", atIndex: 2)
pets.removeAtIndex(1)
pets.removeFirst()
pets.removeLast()

for p in pets
{
    print(p)
}
pets.append("Parrot")
pets.append("Snake")
pets.append("Hamster")

for (idx, val) in pets.enumerate()
{
    print("Pet is \(val) at index \(idx)")
}
pets.removeAll()




//Swift Flow Control
var i = 5
//like a do while  loop
repeat
{
    print(i)
    i = i - 1
}while i > 0

var _age = 18
while(_age < 22)
{
    print("You're an undergrad!")
    _age = _age + 1
    
}

func tern() -> Bool
{
    let n = 5
    return n == 5
}
print(tern())


//Swift Error Handling

//throwable types

//for this I was following lecture code but I can't figure out why the playground doesn't like this code
//let error = NSError(code:0, domain: "com.target", userInfo: "Website Sucks!")

enum Issue : ErrorType
{
    case InvalidResponse
    case NoResponse
    case BadDB
}

func issue() throws
{
    throw Issue.BadDB
}

do {
    try issue()
}
catch Issue.NoResponse {
    print("Nothing entered")
}
catch let error {
    print("Warning the following error has occured: \(error)")
}
catch Issue.BadDB {
    print("You must be on Target's website. Its pretty bad. I suggest you try shopping on amazon instead.")
}
catch {
    print("Some error occurred")
}

try?issue()


//casting
class Skateboard
{
    var wheels : String = "Standard"
    var color : String = "Clear grip tape"
    var manf : String = "Arbor"
    
    func ride()
    {print("Fun to ride")}
}
class LongBoard : Skateboard
{
    func type()
    {
        print("Get drop-through deck for stability")
    }
}

func skating(lb : Skateboard)
{
    let myBoard = lb as? LongBoard
    myBoard?.ride()
}

var sktbrd = Skateboard()
skating(sktbrd)

//---will crash app
//---fatalError()
