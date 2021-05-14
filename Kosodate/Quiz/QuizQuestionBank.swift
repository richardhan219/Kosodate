//
//  QuizQuestionBank.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/6/20.
//  Copyright © 2018年 Richard Han. All rights reserved.
//

import Foundation
import Foundation
class QuestionBank{
    
    var list = [Question]()
    
    init() {
        list.append(Question(num:1, image: "babycar", questionText: "このマークは?",questionInfomation:"ベビーカー使用者が安心して利用できる場所や設備（エレベーター、鉄道やバスの車両スペース等）を表したマークです。", choiceA: "A.ベビーカーマーク", choiceB: "B. ショッピングカートマーク",  answer: 1))
        
        list.append(Question(num:2, image: "seatbelt", questionText: "ベビーカーにお子さんを乗せる時は、シートベルトを装着しなければならない",questionInfomation:"思わぬ動きでベビーカーから子供が転落することがあるので、シートベルトを着用しましょう。", choiceA: "A. はい", choiceB: "B. いいえ",  answer: 1))
        
        list.append(Question(num:3,image: "seat", questionText: "バスの車内でベビーカーを固定する時の向きは？",questionInfomation:"バスの車内では固定ベルトを使い、進行方向後ろ向きに固定するようにしましょう。傾斜や走行中の反動で動き出すことがあります。", choiceA: "A. 前向き", choiceB: "B. 後ろ向き", answer: 2))
        
        list.append(Question(num:4,image: "007" ,  questionText: "電車の車内やホーム等でベビーカーを止めている間はストッパーをかける",questionInfomation:"鉄道のホームや車内等でベビーカーを止めている間はストッパーをかけ、しっかり手も添えているようにしましょう。", choiceA: "A.はい" , choiceB: "B. いいえ", answer: 1))
        
        list.append(Question(num:5,image: "011" , questionText: "6歳未満のお子さんを自動車に乗せる時は、チャイルドシートに乗せなければならない",questionInfomation:"自動車の運転者は、チャイルドシートを使用せずに6歳未満の幼児を乗せて、運転してはならないことが決められています（道路交通法第71条の3第3項）。", choiceA: "A. はい" , choiceB: "B. いいえ", answer: 1))
        
        list.append(Question(num:6,image: "009" , questionText: "6歳未満のお子さんをタクシーに乗せる時も、チャイルドシートに乗せなければならない",questionInfomation:"タクシーやバス等の公共交通に乗せる時は、チャイルドシートの使用は義務付けられていません（道路交通法施行令第26条の3の2第3項）。", choiceA: "A. はい" , choiceB: "B. いいえ", answer: 2))

        list.append(Question(num:7,image: "012" ,  questionText: "このマークは？",questionInfomation:"（一社）自転車協会が定めた自転車安全基準に適合し、幼児を2人乗せられる自転車だけに貼付されるマークです。", choiceA: "A. 幼児2人乗せ自転車マーク" , choiceB: "B. 電動アシスト自転車マーク", answer: 1))

        
        list.append(Question(num:8,image: "013" , questionText: "お子さんを自転車のチャイルドシートに乗せていて、自転車から離れる時は？",questionInfomation:"自転車から離れる時には、必ずお子さんを降ろしましょう。またチャイルドシートの安全性も確認しましょう。", choiceA: "A. 必ずお子さんを降ろしてから離れる" , choiceB: "B. お子さんを自転車に乗せたまま離れる", answer: 1))
        
        list.append(Question(num:9,image: "015" , questionText: "お子さんを自転車に乗せて歩道を通行する時は？",questionInfomation:"歩道は歩行者優先なので、車道寄りを徐行しなければなりません（道路交通法第63条の4第2項）。", choiceA: "A. 歩道は自転車優先なので、どこを通行しても良い" , choiceB: "B. 歩道は歩行者優先のため車道寄りを徐行する", answer: 2))
        list.append(Question(num:10,image: "016" , questionText: "お子さんを連れて外出していて困った時は？",questionInfomation:"困った時は遠慮せず、周囲の方に手助けを求めましょう！", choiceA: "A. 一人でがんばる" , choiceB: "B. 周囲の方に手助けを求める", answer: 2))
        list.append(Question(num:0,image: "end" , questionText: "クイズ終了\n左上ボタンを戻る",questionInfomation:"", choiceA: "" , choiceB: "もう一回やる" ,  answer: 2))
        
        
        
        /*
        list.append(Question(image: "babycar", questionText: "何のマーク",questionInfomation:"国土交通省が2014年3月に定めた、ベビーカー利用の安全性・快適性向上を目的としたピクトグラムである。", choiceA: "A.ベビーカーマーク", choiceB: "B. ベビーカー禁止マーク", choiceC: "C. 自転車マーク",  answer: 1))
        
        list.append(Question(image: "seatbelt", questionText: "シートベルト着用しますか",questionInfomation:"ベビーカーを固定するためのベルトが付いていますから、しっかりと固定しておけば安全です。", choiceA: "A. 自由", choiceB: "B. 不要", choiceC: "C. 必要",  answer: 3))
        
        list.append(Question(image: "geton", questionText: "乗り降りの際は",questionInfomation:"駆け込み乗車はやめましょう。ドアに挟まれたり転倒したりすることがあります。ホームや車内等で止めている間は、向きに注意し、ストッパーをかけ、しっかり手も添えているようにしましょう。", choiceA: "A. 混雑時のる", choiceB: "B. 駆け込み乗車", choiceC: "C. 次の電車乗る",  answer: 3))
        
        list.append(Question(image: "seat", questionText: "車内固定は、",questionInfomation:"車内では固定ベルトを使い進行方向後ろ向きに固定するようにしましょう。傾斜や走行中の反動で動き出すことがあります。", choiceA: "A. 前向き", choiceB: "B. 後ろ向き", choiceC: "C. 横向き", answer: 2))
        
        list.append(Question(image: "maternity" , questionText: "周囲の方は、バスの乗降時など",questionInfomation:"「今、ここ」がお互いに居心地がよい空間になるように、どんどん声をかけあっていきましょう!", choiceA: "A. 手助けを申し出てみましょう" , choiceB: "B. ただ見る" , choiceC: "C. 迷惑になるほか" , answer: 1))
        
        list.append(Question(image: "stair" , questionText: "乗り降りの際は",questionInfomation:"電車やバス等の乗せ降ろし時、段差や隙間に注意して操作しましょう。段差につまずいたり車輪が挟まったりすることがあります。", choiceA: "A. 段差注意" , choiceB: "B. ストッパーをかけ" , choiceC: "C. 折りただまず" ,  answer: 1))
        list.append(Question(image: "007" , questionText: "バスに乗車する時には",questionInfomation:"バス停や車内等で止めている間は、ストッパーをかけ、しっかり手も添えているようにしましょう。", choiceA: "A.ストッパーをかけない" , choiceB: "B. ストッパーをかけ" , choiceC: "C. 自由" ,  answer: 2))
        list.append(Question(image: "008" , questionText: "タクシーに子供も同乗する時には",questionInfomation:"だっこひもなどで親の体と密着した状態で子供を抱っこして座りましょう。安全面などを考えると大人だけがシートベルトをした状態は危険です", choiceA: "A.大人がシートベルト締めない" , choiceB: "B. 大人がシートベルト締める" , choiceC: "C. どちらとも言えない" ,  answer: 2))
        list.append(Question(image: "009" , questionText: "タクシーに乗る際のチャイルドシート装着は義務はありますか",questionInfomation:"日本の法律では、タクシーに乗る際のチャイルドシート装着は義務付けられていません。", choiceA: "A.あります" , choiceB: "B. どちらとも言えない" , choiceC: "C. ありません" ,  answer: 3))
        list.append(Question(image: "010" , questionText: "路線バスに乗る際のチャイルドシート装着は義務はありますか",questionInfomation:"日本の法律では、路線バスに乗る際も、チャイルドシートの使用は免除されています。", choiceA: "A.あります" , choiceB: "B. どちらとも言えない" , choiceC: "C. ありません" ,  answer: 3))
        list.append(Question(image: "011" , questionText: "幼児を自動車に乗せて運転する時チャイルドシート義務はありますか",questionInfomation:"自動車の運転者は、チャイルドシートを使用しない6歳未満の幼児を乗せて、 運転してはならないことが決められています(道路交通法第71条の3第3項)。", choiceA: "A.あります" , choiceB: "B. どちらとも言えない" , choiceC: "C. ありません" ,  answer: 1))
        list.append(Question(image: "012" , questionText: "BAAマークとは",questionInfomation:"BAA マークは（一社）自転車協会が定めた自転車安全基準に適合した自転車だけに貼付されるマークです", choiceA: "A. 自転車安全基準に適合した自転車" , choiceB: "B. 電動アシスト自転車" , choiceC: "C. 幼児向けの自転車" , answer: 1))
        list.append(Question(image: "013" , questionText: "自転車から離れる時",questionInfomation:"自転車から離れる場合は、必ず子どもを降ろしましょう。またチャイルドシートの安全性も確認しましょう。", choiceA: "A. 必ずおります" , choiceB: "B. お子さんを自転車に乗せたまま" , choiceC: "C. どちらとも言えない" ,  answer: 1))
        list.append(Question(image: "014", questionText: "前抱っこは、",questionInfomation:"前抱っこは、視界が妨げられバランスを崩しやすいので大変危険です！", choiceA: "A. 前抱っこは安全です", choiceB: "B.どちらとも言えない", choiceC: "C.視界が妨げられる", answer: 3))
        list.append(Question(image: "015" , questionText: "歩道で運転するとき",questionInfomation:"道路の状況、交通量などを考慮して自分で「どの道を通るのか選ぶ」意識を持ちましょう。", choiceA: "A. 車道で運転する" , choiceB: "B. 歩道は歩行者優先で、車道寄りを徐行" , choiceC: "C. 自転車優先" , answer: 2))
        list.append(Question(image: "end" , questionText: "クイズ終了",questionInfomation:"", choiceA: "" , choiceB: "もう一回やります" , choiceC: "" ,  answer: 2))*/
    }
}
