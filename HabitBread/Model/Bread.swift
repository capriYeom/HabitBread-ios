//
//  Bread.swift
//  HabitBread
//
//  Created by 염준우 on 2021/01/01.
//

import Foundation

struct Bread : Decodable {
    let itemId: Int
    let name: String
    let description: String
    let level: Int
    var img: String
}

struct BreadResponse: Decodable {
    let userItemId: Int
    let createdAt: String
    var item: Bread
}

struct BreadData {
    let level1Ids = [1,2,3,4,5], level2Ids = [6,7,8,9,10,11], level3Ids = [12,13,14,15], level4Ids = [16,17,18]
    
    var level1: [Bread] = [Bread(itemId: 1, name: "바게뜨", description: "어느 빵 가게에서나 손 쉽게 볼 수 있는 길쭉한 바게뜨 빵이다. \\n 잘못 씹으면 이빨이 매우 아플 수 있다..", level: 1, img: ""), Bread(itemId: 2, name: "식빵", description: "식빵(loaf bread)은 빵의 한 종류로, 밀가루, 물, 효모를 반죽해 틀에 넣어 구운 덩어리 빵이다", level: 1, img: ""), Bread(itemId: 3, name: "잉어빵", description: "길거리 노점상에서 파는 붕어 모양의 간식거리 풃빵이다", level: 1, img: ""), Bread(itemId: 4, name: "계란빵", description: "달걀을 통째로 넣고 구운 빵. 붕어빵과 쌍벽을 이루는 풀빵류 서민 음식 대표주자이다.", level: 1, img: ""), Bread(itemId: 5, name: "호빵", description: "현재는 호빵과 찐빵이 비슷하지만 다른 \"사촌\" 음식으로 여겨진다", level: 1, img: "")]
    var level2: [Bread] = [Bread(itemId: 6, name: "초코 도넛", description: "스프링클과 커버춰 초커렛이 듬뿍 묻혀진 도넛", level: 2, img: ""), Bread(itemId: 7, name: "팬케이크", description: "팬케이크(pancake)는 납작한 빵의 일종으로, 달게 만든 반죽물을 뜨거운 석쇠 위나 프라이팬으로 구워 만든 후 그 위에 작게 조각낸 버터를 올린 다음 메이플 시럽 등을 뿌려 먹으면 달콤함이 입안에 가득 돌게 된다." , level: 2, img: ""), Bread(itemId: 8, name: "앙버터", description: "빵에 팥앙금과 버터를 껴얹거나 곁들이는 일본 요리. \\n 곁들일 경우 도톰하게 샌드한 버터가 비슷한 두께의 팥앙금과 함께 조합된다.", level: 2, img: ""), Bread(itemId: 9, name: "크루아상", description: "크루아상(프랑스어: croissant)은 버터질의 파삭파삭한 페이스트리로, 이름은 그 특유의 초승달(crescent) 모양에서 유래되었다.", level: 2, img: ""), Bread(itemId: 10, name: "프레첼", description: "서구권에서 먹는 빵 또는 과자로, 원산지는 독일이고, 독일어로는 브레첼(Brezel) 이라 부른다.", level: 2, img: ""), Bread(itemId: 11, name: "홍또우빙", description: "대만의 간식이라고도 불리는 홍또우빙은 눌러서 납작해진 깡통이란 의미를 가지고 있다.", level: 2, img: "")]
    var level3: [Bread] = [Bread(itemId: 12, name: "밀푀유", description: "'밀푀유'라는 단어는 \"천겹의 잎사귀\"를 뜻한다.", level: 3, img: ""), Bread(itemId: 13, name: "크레페", description: "프랑스 요리로 얊게 구운 팬케이크의 일종", level: 3, img: ""), Bread(itemId: 14, name: "에클레르", description: "에클레르는 길쭉한 모양의 빵 안에 크림을 가득 채워 퐁당 아이싱을 입혀 만든 디저트로, 에클레르라는 이름은 프랑스어로 번개라는 뜻을 지니고 있다.", level: 3, img: ""),Bread(itemId: 14, name: "마카롱", description: "마카롱은 바삭한 식감과 쫄깃한 질감, 달콤한 맛까지 3가지 조화가 완벽한 디저트로, 과거에는 프랑스를 대표하는 디저트로 이름을 알렸지만 본래 탄생된 곳은 이탈리아어라고 한다.", level: 3, img: "")]
    var level4: [Bread] = [Bread(itemId: 16, name: "까눌레", description: "럼주의 달콤한 향과 귀여운 모양이 먹음직스럽다. \\n 쫄깃하고 부드러운 식감을 자랑한다.", level: 4, img: ""), Bread(itemId: 17, name: "화과자", description: "차와 함께 내오는 경우가 많으며, 찹쌀과 빵, 밀가루, 설탕, 한천 등을 재료로 사용한다 \\n 일본에서 발달해서 일본과자로 생각되는 경우가 많다.", level: 4, img: ""), Bread(itemId: 18, name: "뜨르들로", description: "겉은 바삭! 속은 촉촉! 적당한 시나몬가루와 설탕가루! 체코의 국민산식, 우리나라로 치면 붕어빵이나 호떡 같은 뜨르들로입니다.", level: 4, img: "")]
}


