# geulzza
# about
**geulzza** is a super-lightweight swift library that helps dealing with korean string by decomposing each letter into jamos.  
**글짜**는 자모를 분리해 한글 스트링을 다루는 데 도움을 주는 무지 가벼운 스위프트 라이브러리입니다.  

# usage
```swift
import geulzza

let cent = "윤석열"
let chicken = "박근혜"
let rat = "이명박"
let ashdragon = "leejaeyong"
let joogija = "JOOJINWOO"
print(cent.이가 + chicken.을를 + "때렸다.")
//윤석열이 박근혜를 때렸다.
print(ashdragon.은는 + "바보.")
//leejaeyong은 바보.
print(rat.이가 + "울었다.")
//이명박이 울었다.
print(joogija.은는 + "웃었다.")
//JOOJINWOO는 웃었다.
```
eun/neun ee/ga eul/reul will be appended depending on the last consonant.  
받침 유무, 혹은 마지막 글자에 따라 은/는 이/가 을/를 을 선택해 붙여줍니다.  

```swift
import geulzza

let c: Character = "앏"
let 앏 = Geulzza("앏")
print(앏 == c.geulzza)
print(앏 == c)
print("햟" == 앏)
//true
//true
//false
let 받침 = 앏.종성
print(받침.rawValue)
//ᆲ
print("\(받침.앞)\(c.geulzza.받침.뒤)")
//ㄹㅂ
let cho = 앏.초성
let jung = 앏.중성
let zong = 앏.종성
print("\(cho)\(jung)\(zong.rawValue)")
//ㅇㅏᆲ
print(Character(.ㄱ, jung, .ㄹㅁ))
//갊
print(앏.char)
//앏
앏.초성 = .ㅆ
print(앏.char)
//쌃
```
composing, decomposing and editing are supported for `Geulzza` class.  
글짜 클래스는 조합, 해체, 수정이 가능합니다.  

`Jaeum`, `Moeum` and `Badchim` are all `enum` of `Character` type.  
자음, 모음, 받침은 모두 `Character` 타입의 `enum`입니다.  

# structure
```swift
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
```
it's made of only one file, but here is the core of this library anyway.  
고작 파일 하나로 만들어졌긴 해도, 어쨌든 이게 본 라이브러리의 핵심입니다.  

# integration
### SPM
just use Swift Package Manager to install **geulzza** by adding this repository.
스위프트 패키지 매니저를 사용해 이 리포지토리를 추가하는 것으로 **geulzza**를 설치하세요.
### copy && paste
or just copy and paste `geulzza.swift` to your project.  
아니면 `geulzza.swift` 파일을 복사해 당신의 프로젝트에 붙여넣으세요.

# support
support me through kakaopay, so i can at least eat.  
카카오페이로 후원해 제가 밥은 먹고 다니도록 도와주세요.  

![kakaopay qr code](https://github.com/eastriverlee/support/blob/main/kakaopay.png?raw=true)
