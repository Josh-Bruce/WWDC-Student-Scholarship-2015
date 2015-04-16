//: Playground - noun: a place where people can play

import UIKit

enum WWDCCategory {
    case Projects, Education, Work, TechnicalSkills, Interests
}

protocol CategoryProtocol {
    func title()
    var type: WWDCCategory { get }
}

class Work : CategoryProtocol {
    
    var type: WWDCCategory {
        get {
           return .Work
        }
    }
    
    func title() {
        
    }
    
}

class TechicalSkill : CategoryProtocol {
    
    var levelOfSkill: Double {
        get {
            return 0.0
        }
        set {
            
        }
    }
    
    var type: WWDCCategory {
        get {
            return .TechnicalSkills
        }
    }
    
    func title() {
        
    }
    
    func level() {
        
    }
    
}

var a = [CategoryProtocol]()

var work = Work()
var skill = TechicalSkill()

a.append(work)
a.append(skill)

for x in a {
    if let skill = x as? TechicalSkill {
        skill
        skill.level()
        skill.type
    } else if let work = x as? Work {
        println(work)
    }
}