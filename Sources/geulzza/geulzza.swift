public typealias Hex = UInt16

public typealias Hangeul = String
public typealias Jamo = Character

public enum Jaeum: Jamo {
    case ㄱ      = "ᄀ"
    case ㄲ      = "ᄁ"
    case ㄴ      = "ᄂ"
    case ㄷ      = "ᄃ"
    case ㄸ      = "ᄄ"
    case ㄹ      = "ᄅ"
    case ㅁ      = "ᄆ"
    case ㅂ      = "ᄇ"
    case ㅃ      = "ᄈ"
    case ㅅ      = "ᄉ"
    case ㅆ      = "ᄊ"
    case ㅇ      = "ᄋ"
    case ㅈ      = "ᄌ"
    case ㅉ      = "ᄍ"
    case ㅊ      = "ᄎ"
    case ㅋ      = "ᄏ"
    case ㅌ      = "ᄐ"
    case ㅍ      = "ᄑ"
    case ㅎ      = "ᄒ"
    case __      = " "
}

public enum Moeum: Jamo {
    case ㅏ      = "ᅡ"
    case ㅐ      = "ᅢ"
    case ㅑ      = "ᅣ"
    case ㅒ      = "ᅤ"
    case ㅓ      = "ᅥ"
    case ㅔ      = "ᅦ"
    case ㅕ      = "ᅧ"
    case ㅖ      = "ᅨ"
    case ㅗ      = "ᅩ"
    case ㅘ      = "ᅪ"
    case ㅙ      = "ᅫ"
    case ㅚ      = "ᅬ"
    case ㅛ      = "ᅭ"
    case ㅜ      = "ᅮ"
    case ㅝ      = "ᅯ"
    case ㅞ      = "ᅰ"
    case ㅟ      = "ᅱ"
    case ㅠ      = "ᅲ"
    case ㅡ      = "ᅳ"
    case ㅢ      = "ᅴ"
    case ㅣ      = "ᅵ"
    case __      = " "
}

public enum Badchim: Jamo {
    case ㄱ      = "ᆨ"
    case ㄲ      = "ᆩ"
    case ㄱㅅ    = "ᆪ"
    case ㄴ      = "ᆫ"
    case ㄴㅈ    = "ᆬ"
    case ㄴㅎ    = "ᆭ"
    case ㄷ      = "ᆮ"
    case ㄹ      = "ᆯ"
    case ㄹㄱ    = "ᆰ"
    case ㄹㅁ    = "ᆱ"
    case ㄹㅂ    = "ᆲ"
    case ㄹㅅ    = "ᆳ"
    case ㄹㅌ    = "ᆴ"
    case ㄹㅍ    = "ᆵ"
    case ㄹㅎ    = "ᆶ"
    case ㅁ      = "ᆷ"
    case ㅂ      = "ᆸ"
    case ㅂㅅ    = "ᆹ"
    case ㅅ      = "ᆺ"
    case ㅆ      = "ᆻ"
    case ㅇ      = "ᆼ"
    case ㅈ      = "ᆽ"
    case ㅊ      = "ᆾ"
    case ㅋ      = "ᆿ"
    case ㅌ      = "ᇀ"
    case ㅍ      = "ᇁ"
    case ㅎ      = "ᇂ"
    case __      = " "
}

public extension Badchim {
    var 앞: Badchim {
        switch self {
        case .ㄲ   : return .ㄱ
        case .ㄱㅅ : return .ㄱ
        case .ㄴㅈ : return .ㄴ
        case .ㄴㅎ : return .ㄴ
        case .ㄹㄱ : return .ㄹ
        case .ㄹㅁ : return .ㄹ
        case .ㄹㅂ : return .ㄹ
        case .ㄹㅅ : return .ㄹ
        case .ㄹㅌ : return .ㄹ
        case .ㄹㅍ : return .ㄹ
        case .ㄹㅎ : return .ㄹ
        case .ㅂㅅ : return .ㅂ
        case .ㅆ   : return .ㅅ
        default    : return .__
        }
    }
    var 뒤: Badchim {
        switch self {
        case .ㄲ   : return .ㄱ
        case .ㄱㅅ : return .ㅅ
        case .ㄴㅈ : return .ㅈ
        case .ㄴㅎ : return .ㅎ
        case .ㄹㄱ : return .ㄱ
        case .ㄹㅁ : return .ㅁ
        case .ㄹㅂ : return .ㅂ
        case .ㄹㅅ : return .ㅅ
        case .ㄹㅌ : return .ㅌ
        case .ㄹㅍ : return .ㅍ
        case .ㄹㅎ : return .ㅎ
        case .ㅂㅅ : return .ㅅ
        case .ㅆ   : return .ㅅ
        default    : return self
        }
    }
}

public extension Character {
    var unicode: Hex {
        String(self).utf16.first!
    }
}

let hangeulStart   : Hex = 0xAC00
let hangeulEnd     : Hex = 0xD7AF
public extension Hex {
    var char: Character {
        Character(UnicodeScalar(self)!)
    }
    static func isHangeul(_ unicode: Hex) -> Bool {
        hangeulStart <= unicode && unicode <= hangeulEnd
    }
}

let jaeumStart   : Hex = 0x1100
let moeumStart   : Hex = 0x1161
let badchimStart : Hex = 0x11A7
public extension Character {
    init(_ 초성: Jaeum, _ 중성: Moeum, _ 종성: Badchim) {
        guard 중성 != .__ && 종성 != .__ else { self = 초성.rawValue; return }
        let cho = 초성.rawValue.unicode - jaeumStart
        let jung = 중성.rawValue.unicode - moeumStart
        let zong = 종성.rawValue.unicode - badchimStart
        var unicode: Hex

        unicode = hangeulStart + (cho * 21 + jung) * 28
        if 종성 != .__ { unicode += zong }
        self = unicode.char
    }
    var geulzza: Geulzza {
        Geulzza(self)
    }
}

public extension Hangeul {
    var endsWithBadchim: Bool {
        switch last { 
            case "b", "c", "d", "g", "k", "l", "m", "n", "p", "q", "t": return true
            case "B", "C", "D", "G", "K", "L", "M", "N", "P", "Q", "T": return true
            default: return last != nil && last!.geulzza.받침 != .__
        }
    }
    var 은는: Hangeul {
        self + (self.endsWithBadchim ? "은" : "는")
    }
    var 이가: Hangeul {
        self + (self.endsWithBadchim ? "이" : "가")
    }
    var 을를: Hangeul {
        self + (self.endsWithBadchim ? "을" : "를")
    }
}

public class Geulzza {
    init(_ c: Character) {
        unicode = c.unicode
        guard Hex.isHangeul(unicode) else { nonHangeul = c; return }
        let offset = unicode - hangeulStart
        초성 = Jaeum(rawValue: ((offset / 28) / 21 + jaeumStart).char)!
        중성 = Moeum(rawValue: ((offset / 28) % 21 + moeumStart).char)!
        종성 = Badchim(rawValue: ((offset % 28) + badchimStart).char) ?? .__
        char = Character(초성, 중성, 종성)
    }
    var unicode: Hex
    var nonHangeul: Character?
    var char: Character = " "
    var 초성: Jaeum = .__ {
        didSet { char = Character(초성, 중성, 종성) }
    }
    var 중성: Moeum = .__ {
        didSet { char = Character(초성, 중성, 종성) }
    }
    var 종성: Badchim = .__ {
        didSet { char = Character(초성, 중성, 종성) }
    }
    var 받침: Badchim {
        종성
    }
}

extension Geulzza: Equatable {
    public static func == (lhs: Geulzza, rhs: Geulzza) -> Bool {
        lhs.char == rhs.char
    }
    public static func == (lhs: Geulzza, rhs: Character) -> Bool {
        lhs.char == rhs
    }
    public static func == (lhs: Character, rhs: Geulzza) -> Bool {
        lhs == rhs.char 
    }
}
