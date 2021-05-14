//
//  UOverMapVC.swift
//  Kosodate
//
//  Created by Rienhardt on 2018/12/05.
//  Copyright © 2018 Richard Han. All rights reserved.
//

import UIKit
import MapKit

class UOverMapVC: UIViewController ,CLLocationManagerDelegate{

    @IBOutlet weak var mapView: MKMapView!
    var locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createoverAnnotations(locations: overannotationlocations)
        mapView.showsScale = true
        mapView.showsCompass = true
        mapView.showsUserLocation = true
        mapView.showsBuildings = true
        mapView.showsTraffic = true
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        // Do any additional setup after loading the view.
    }
    
    
    func createoverAnnotations(locations:[[String : Any]]){
        for location in locations{
            let annotations = MKPointAnnotation()
            annotations.title = location["FIELD3"] as? String
            annotations.subtitle = location["FIELD5"] as? String
            annotations.coordinate = CLLocationCoordinate2D(latitude: location["longitude"] as! CLLocationDegrees , longitude: location["latitude"] as! CLLocationDegrees)
            
            mapView.addAnnotation(annotations)
        }
    }
    
    let overannotationlocations = [
        [
            "FIELD3": "中央生涯学習センター",
            "FIELD5": "宇都宮市中央1丁目1-13",
            "latitude": 139.8859792,
            "longitude": 36.5562892
            ],
         [
            "FIELD3": "宇都宮市教育センター",
            "FIELD5": "宇都宮市天神1丁目1-24",
            "latitude": 139.8923771,
            "longitude": 36.5515494
            ],
         [
            "FIELD3": "宇都宮市役所",
            "FIELD5": "宇都宮市旭1丁目1-5",
            "latitude": 139.8860811,
            "longitude": 36.5518636
            ],
         [
            "FIELD3": "総合コミュニティセンター・男女共同参画推進センター",
            "FIELD5": "宇都宮市明保野町7-1",
            "latitude": 139.8705364,
            "longitude": 36.5451204
            ],
         [
            "FIELD3": "宇都宮市上下水道局",
            "FIELD5": "宇都宮市河原町1-41",
            "latitude": 139.8867187,
            "longitude": 36.5473201
            ],
         [
            "FIELD3": "オリオンスクエア（オリオン市民広場）",
            "FIELD5": "宇都宮市江野町8-3",
            "latitude": 139.8856095,
            "longitude": 36.556861
            ],
         [
            "FIELD3": "西原地域コミュニティセンター",
            "FIELD5": "宇都宮市西原2丁目5-42　西原小学校内",
            "latitude": 139.8756613,
            "longitude": 36.5513969
            ],
         [
            "FIELD3": "西地域コミュニティセンター",
            "FIELD5": "宇都宮市西1丁目2-13　西小学校内",
            "latitude": 139.8810817,
            "longitude": 36.5561234
            ],
         [
            "FIELD3": "簗瀬地域コミュニティセンター",
            "FIELD5": "宇都宮市南大通り2丁目6-6　簗瀬小学校内",
            "latitude": 139.8961601,
            "longitude": 36.5513311
            ],
         [
            "FIELD3": "今泉地域コミュニティセンター",
            "FIELD5": "宇都宮市元今泉1丁目7-29　今泉小学校内",
            "latitude": 139.9057784,
            "longitude": 36.5573324
            ],
         [
            "FIELD3": "錦地域コミュニティセンター",
            "FIELD5": "宇都宮市今泉町143-6",
            "latitude": 139.9023544,
            "longitude": 36.5649877
            ],
         [
            "FIELD3": "中央地域コミュニティセンター",
            "FIELD5": "宇都宮市中央本町1-29　中央小学校内",
            "latitude": 139.8878547,
            "longitude": 36.5561714
            ],
         [
            "FIELD3": "峰地域コミュニティセンター",
            "FIELD5": "宇都宮市峰3丁目20-17　峰小学校内",
            "latitude": 139.922609,
            "longitude": 36.5492798
            ],
         [
            "FIELD3": "西市民活動センター",
            "FIELD5": "宇都宮市西一の沢町17-32",
            "latitude": 139.864776,
            "longitude": 36.5645128
            ],
         [
            "FIELD3": "ゆうあいひろば",
            "FIELD5": "宇都宮市馬場通り4丁目1-1　うつのみや表参道スクエア6階　宇都宮市民プラザ内",
            "latitude": 139.8897355,
            "longitude": 36.5584148
            ],
         [
            "FIELD3": "あそぼの家",
            "FIELD5": "宇都宮市今泉町3007",
            "latitude": 139.9180946,
            "longitude": 36.5706638
            ],
         [
            "FIELD3": "宇都宮市文化会館",
            "FIELD5": "宇都宮市明保野町7-66",
            "latitude": 139.8714843,
            "longitude": 36.5441164
            ],
         [
            "FIELD3": "中央図書館",
            "FIELD5": "宇都宮市明保野町7-57",
            "latitude": 139.8708204,
            "longitude": 36.5431957
            ],
         [
            "FIELD3": "明保野体育館",
            "FIELD5": "宇都宮市明保野町7-9",
            "latitude": 139.8712652,
            "longitude": 36.545199
            ],
         [
            "FIELD3": "栃木県本町合同ビル（栃木県庁南庁舎2号館）",
            "FIELD5": "宇都宮市本町3-9",
            "latitude": 139.8858721,
            "longitude": 36.5592833
            ],
         [
            "FIELD3": "栃木県庁本庁舎",
            "FIELD5": "宇都宮市塙田1丁目1-20",
            "latitude": 139.8868741,
            "longitude": 36.5627575
            ],
         [
            "FIELD3": "宇都宮市総合福祉センター",
            "FIELD5": "宇都宮市中央1丁目1-15",
            "latitude": 139.8854541,
            "longitude": 36.5560448
            ],
         [
            "FIELD3": "宇都宮市保健センター",
            "FIELD5": "宇都宮市駅前通り1丁目4-6　ララスクエア宇都宮9階",
            "latitude": 139.9003718,
            "longitude": 36.5571316
            ],
         [
            "FIELD3": "ブレックスアリーナ宇都宮（宇都宮市体育館）",
            "FIELD5": "宇都宮市元今泉5丁目6-18",
            "latitude": 139.914041,
            "longitude": 36.5580787
            ],
         [
            "FIELD3": "東図書館",
            "FIELD5": "宇都宮市中今泉3丁目5-1",
            "latitude": 139.9121442,
            "longitude": 36.5653718
            ],
         [
            "FIELD3": "栃木県立宇都宮産業展示館（マロニエプラザ）",
            "FIELD5": "宇都宮市元今泉6丁目1-37",
            "latitude": 139.9160022,
            "longitude": 36.5581878
            ],
         [
            "FIELD3": "栃木県総合文化センター",
            "FIELD5": "宇都宮市本町1-8",
            "latitude": 139.8859007,
            "longitude": 36.5601203
            ],
         [
            "FIELD3": "栃木県立博物館",
            "FIELD5": "宇都宮市睦町2-2",
            "latitude": 139.8637902,
            "longitude": 36.556023
            ],
         [
            "FIELD3": "まちの保育園 キッズアンジェリー",
            "FIELD5": "宇都宮市松が峰1丁目2-3 シティロイヤルコート201・301・302・303",
            "latitude": 139.8836023,
            "longitude": 36.5543043
            ],
         [
            "FIELD3": "宇都宮中央郵便局",
            "FIELD5": "宇都宮市中央本町4-17",
            "latitude": 139.8880529,
            "longitude": 36.5547398
            ],
         [
            "FIELD3": "栃木銀行　馬場町支店",
            "FIELD5": "宇都宮市馬場通り1丁目1-1 シティタワー宇都宮2階",
            "latitude": 139.888712,
            "longitude": 36.5582751
            ],
         [
            "FIELD3": "栃木銀行　大曽支店",
            "FIELD5": "宇都宮市大曽4丁目8-14",
            "latitude": 139.8934007,
            "longitude": 36.5658824
            ],
         [
            "FIELD3": "たいらや　今泉新町店",
            "FIELD5": "宇都宮市今泉町2998-1",
            "latitude": 139.9183505,
            "longitude": 36.5687923
            ],
         [
            "FIELD3": "フードオアシスオータニ　宇都宮駅東店",
            "FIELD5": "宇都宮市元今泉4丁目1-14",
            "latitude": 139.9090577,
            "longitude": 36.5590869
            ],
         [
            "FIELD3": "ヨークベニマル　泉が丘店",
            "FIELD5": "宇都宮市泉が丘6丁目1-44",
            "latitude": 139.9224429,
            "longitude": 36.565254
            ],
         [
            "FIELD3": "ヨークベニマル　簗瀬店",
            "FIELD5": "宇都宮市城東1丁目8-13",
            "latitude": 139.9041977,
            "longitude": 36.5467833
            ],
         [
            "FIELD3": "東武百貨店　宇都宮店",
            "FIELD5": "宇都宮市宮園町5-4",
            "latitude": 139.8836216,
            "longitude": 36.5567868
            ],
         [
            "FIELD3": "宇都宮パルコ",
            "FIELD5": "宇都宮市馬場通り3丁目1-1",
            "latitude": 139.8897676,
            "longitude": 36.5577252
            ],
         [
            "FIELD3": "宇都宮アンテナショップ　宮カフェ",
            "FIELD5": "宇都宮市江野町2-11",
            "latitude": 139.8857917,
            "longitude": 36.5572101
            ],
         [
            "FIELD3": "子育てサロンやよい",
            "FIELD5": "宇都宮市弥生1丁目6-3（弥生保育園内）",
            "latitude": 139.8722955,
            "longitude": 36.5413058
            ],
         [
            "FIELD3": "ララスクエア宇都宮",
            "FIELD5": "宇都宮市駅前通り1丁目4-6",
            "latitude": 139.9002164,
            "longitude": 36.5573498
            ],
         [
            "FIELD3": "ＦＫＤ　宇都宮店",
            "FIELD5": "宇都宮市今泉町237",
            "latitude": 139.9036297,
            "longitude": 36.570618
            ],
         [
            "FIELD3": "デニーズ　宇都宮元今泉店",
            "FIELD5": "宇都宮市元今泉3丁目3-17",
            "latitude": 139.9096101,
            "longitude": 36.5595379
            ],
         [
            "FIELD3": "（株）スズキ自販栃木　スズキアリーナ戸祭",
            "FIELD5": "宇都宮市下戸祭2丁目14-20",
            "latitude": 139.8801548,
            "longitude": 36.5709152
            ],
         [
            "FIELD3": "フライングガーデン　下戸祭店",
            "FIELD5": "宇都宮市下戸祭2丁目14-2",
            "latitude": 139.8795492,
            "longitude": 36.5711112
            ],
         [
            "FIELD3": "（株）TOTO　宇都宮ショールーム",
            "FIELD5": "宇都宮市元今泉2丁目22-22",
            "latitude": 139.9076431,
            "longitude": 36.5615136
            ],
         [
            "FIELD3": "フライングガーデン　東簗瀬店",
            "FIELD5": "宇都宮市東簗瀬1丁目28-9",
            "latitude": 139.9032396,
            "longitude": 36.5403906
            ],
         [
            "FIELD3": "栃木ミサワホーム（株）",
            "FIELD5": "宇都宮市一条2丁目7-24",
            "latitude": 139.8831061,
            "longitude": 36.5490847
            ],
         [
            "FIELD3": "ホテル丸治",
            "FIELD5": "宇都宮市泉町1-22",
            "latitude": 139.883777,
            "longitude": 36.5589298
            ],
         [
            "FIELD3": "ホテル・ザ・セントレ宇都宮",
            "FIELD5": "宇都宮市本町4-11",
            "latitude": 139.8861454,
            "longitude": 36.5587377
            ],
         [
            "FIELD3": "東横ＩＮＮ東武宇都宮駅西口",
            "FIELD5": "宇都宮市西1丁目1-9",
            "latitude": 139.8826999,
            "longitude": 36.5571447
            ],
         [
            "FIELD3": "ホテルニューイタヤ",
            "FIELD5": "宇都宮市大通り2丁目4-6",
            "latitude": 139.8955975,
            "longitude": 36.5565249
            ],
         [
            "FIELD3": "東横ＩＮＮ宇都宮駅前",
            "FIELD5": "宇都宮市今泉1丁目4-29",
            "latitude": 139.9005004,
            "longitude": 36.558633
            ],
         [
            "FIELD3": "ホテルマイステイズ宇都宮",
            "FIELD5": "宇都宮市東宿郷2丁目4-1",
            "latitude": 139.9045551,
            "longitude": 36.5550498
            ],
         [
            "FIELD3": "ホテル東日本宇都宮",
            "FIELD5": "宇都宮市上大曽町492-1",
            "latitude": 139.8968567,
            "longitude": 36.5726606
            ],
         [
            "FIELD3": "アイエルワイ国際幼児園・附属保育園",
            "FIELD5": "宇都宮市元今泉6丁目7-16",
            "latitude": 139.9173632,
            "longitude": 36.557651
            ],
         [
            "FIELD3": "栃木トヨペット（株）　本社テクノショップ",
            "FIELD5": "宇都宮市不動前5丁目1-26",
            "latitude": 139.8826946,
            "longitude": 36.538997
            ],
         [
            "FIELD3": "ネッツトヨタ栃木（株）　宇都宮不動前店",
            "FIELD5": "宇都宮市不動前4丁目2-48",
            "latitude": 139.8839323,
            "longitude": 36.5393898
            ],
         [
            "FIELD3": "ネッツトヨタ栃木（株）　フォルクスワーゲンサザン宇都宮",
            "FIELD5": "宇都宮市不動前5丁目1-18",
            "latitude": 139.883359,
            "longitude": 36.5399746
            ],
         [
            "FIELD3": "ネッツトヨタ栃木（株）　宇都宮競輪場通り店",
            "FIELD5": "宇都宮市八幡台2-12",
            "latitude": 139.8902016,
            "longitude": 36.571888
            ],
         [
            "FIELD3": "とちぎボランティアNPOセンター　ぽ・ぽ・ら",
            "FIELD5": "宇都宮市昭和2丁目2-7",
            "latitude": 139.8856577,
            "longitude": 36.5638486
            ],
         [
            "FIELD3": "子育てサロンとまつり",
            "FIELD5": "宇都宮市戸祭1丁目4-12（ナーサリースク-ルとまつり内）",
            "latitude": 139.8709008,
            "longitude": 36.5680778
            ],
         [
            "FIELD3": "ケージクラス・ピチカ",
            "FIELD5": "宇都宮市簗瀬町1935-2",
            "latitude": 139.8915126,
            "longitude": 36.5452404
            ],
         [
            "FIELD3": "豊郷地区市民センター",
            "FIELD5": "宇都宮市岩曽町825-1",
            "latitude": 139.9063035,
            "longitude": 36.584567
            ],
         [
            "FIELD3": "とりせん　岡本店",
            "FIELD5": "宇都宮市下岡本町2123-1",
            "latitude": 139.9425636,
            "longitude": 36.5989306
            ],
         [
            "FIELD3": "Honda Cars 栃木中　競輪場通り店",
            "FIELD5": "宇都宮市戸祭町2093-1",
            "latitude": 139.8768647,
            "longitude": 36.57184
            ],
         [
            "FIELD3": "そうごう薬局　宇都宮店",
            "FIELD5": "宇都宮市中戸祭1丁目8-21",
            "latitude": 139.8716456,
            "longitude": 36.5764053
            ],
         [
            "FIELD3": "子育てサロン宝木",
            "FIELD5": "宇都宮市若草2丁目3-31　宝木保育園内",
            "latitude": 139.8657186,
            "longitude": 36.5807335
            ],
         [
            "FIELD3": "とちぎ福祉プラザ",
            "FIELD5": "宇都宮市若草1丁目10-6",
            "latitude": 139.8664801,
            "longitude": 36.5817955
            ],
         [
            "FIELD3": "宝木出張所",
            "FIELD5": "宇都宮市若草3丁目13-13",
            "latitude": 139.8642832,
            "longitude": 36.5838294
            ],
         [
            "FIELD3": "北市民活動センター",
            "FIELD5": "宇都宮市若草3丁目12-25",
            "latitude": 139.8648405,
            "longitude": 36.5842615
            ],
         [
            "FIELD3": "細谷地域コミュニティセンター",
            "FIELD5": "宇都宮市細谷1丁目4-38　細谷小学校内",
            "latitude": 139.8584439,
            "longitude": 36.5878724
            ],
         [
            "FIELD3": "とりせん　細谷店",
            "FIELD5": "宇都宮市細谷町380",
            "latitude": 139.855892,
            "longitude": 36.5875261
            ],
         [
            "FIELD3": "ヨークベニマル　細谷店",
            "FIELD5": "宇都宮市細谷町375-2",
            "latitude": 139.8568404,
            "longitude": 36.5858763
            ],
         [
            "FIELD3": "Honda Cars 栃木東　細谷店",
            "FIELD5": "宇都宮市細谷町698-6",
            "latitude": 139.8555652,
            "longitude": 36.5834322
            ],
         [
            "FIELD3": "CRTハウジング宇都宮総合住宅展示場西会場",
            "FIELD5": "宇都宮市細谷町753-3",
            "latitude": 139.8537004,
            "longitude": 36.582376
            ],
         [
            "FIELD3": "ケイアイスター不動産（株）　宇都宮ショールーム",
            "FIELD5": "宇都宮市宿郷3丁目9-5",
            "latitude": 139.9095225,
            "longitude": 36.5523281
            ],
         [
            "FIELD3": "トヨタウッドユーホーム（株）本社",
            "FIELD5": "宇都宮市一ノ沢町256-7",
            "latitude": 139.8632544,
            "longitude": 36.5746639
            ],
         [
            "FIELD3": "東日本三菱自動車販売（株）　宇都宮今泉町店",
            "FIELD5": "宇都宮市今泉町538-1",
            "latitude": 139.9055587,
            "longitude": 36.5670696
            ],
         [
            "FIELD3": "ネッツトヨタ栃木（株）　宇都宮駅東店",
            "FIELD5": "宇都宮市泉が丘1丁目15-33",
            "latitude": 139.9190779,
            "longitude": 36.5588076
            ],
         [
            "FIELD3": "東日本三菱自動車販売（株）　宇都宮簗瀬店",
            "FIELD5": "宇都宮市簗瀬町211",
            "latitude": 139.9049639,
            "longitude": 36.5440817
            ],
         [
            "FIELD3": "細谷写真館",
            "FIELD5": "宇都宮市今宮3丁目2-7",
            "latitude": 139.8673107,
            "longitude": 36.51353
            ],
         [
            "FIELD3": "ケージクラス",
            "FIELD5": "宇都宮市二番町1-7",
            "latitude": 139.8925325,
            "longitude": 36.5555865
            ],
         [
            "FIELD3": "ケージクラス・クルー",
            "FIELD5": "宇都宮市上戸祭3丁目2-8",
            "latitude": 139.8653656,
            "longitude": 36.5891323
            ],
         [
            "FIELD3": "（有）山形建築工業",
            "FIELD5": "宇都宮市大通り4丁目3-7",
            "latitude": 139.8982392,
            "longitude": 36.5576597
            ],
         [
            "FIELD3": "ほっと！Station",
            "FIELD5": "宇都宮市伝馬町3-20",
            "latitude": 139.8808513,
            "longitude": 36.5575549
            ],
         [
            "FIELD3": "ＮＨＫ宇都宮放送局",
            "FIELD5": "宇都宮市中央3丁目1-2",
            "latitude": 139.8877533,
            "longitude": 36.5538662
            ],
         [
            "FIELD3": "二荒山会館",
            "FIELD5": "宇都宮市馬場通り1丁目1-1",
            "latitude": 139.8882783,
            "longitude": 36.5593027
            ],
         [
            "FIELD3": "ビッグ･ビー　スクエア",
            "FIELD5": "宇都宮市東宿郷2丁目2-1",
            "latitude": 139.9038762,
            "longitude": 36.55467
            ],
         [
            "FIELD3": "宇都宮共和大学",
            "FIELD5": "宇都宮市大通り1丁目3-18",
            "latitude": 139.8942363,
            "longitude": 36.5575144
            ],
         [
            "FIELD3": "宇都宮大学ＵＵプラザ",
            "FIELD5": "宇都宮市峰町350",
            "latitude": 139.9159379,
            "longitude": 36.5478221
            ],
         [
            "FIELD3": "大和ハウス工業（株）　宇都宮支店",
            "FIELD5": "宇都宮市平松本町1111-2",
            "latitude": 139.9070323,
            "longitude": 36.5435797
            ],
         [
            "FIELD3": "ラウンドワンスタジアム　宇都宮店",
            "FIELD5": "宇都宮市江曽島町2072-1",
            "latitude": 139.8902177,
            "longitude": 36.5374388
            ],
         [
            "FIELD3": "たいらや　川田店",
            "FIELD5": "宇都宮市川田町819",
            "latitude": 139.8981014,
            "longitude": 36.5318991
            ],
         [
            "FIELD3": "フードオアシスオータニ　平松店",
            "FIELD5": "宇都宮市平松本町1141-2",
            "latitude": 139.9083076,
            "longitude": 36.5385693
            ],
         [
            "FIELD3": "スーパーオータニ　江曽島店",
            "FIELD5": "宇都宮市江曽島町1062-1",
            "latitude": 139.8749303,
            "longitude": 36.5254844
            ],
         [
            "FIELD3": "アピタ　宇都宮店",
            "FIELD5": "宇都宮市江曽島本町22-7",
            "latitude": 139.8702149,
            "longitude": 36.5286094
            ],
         [
            "FIELD3": "たいらや　緑店",
            "FIELD5": "宇都宮市緑1丁目11-32",
            "latitude": 139.8646315,
            "longitude": 36.5194526
            ],
         [
            "FIELD3": "Dip`s　今宮店",
            "FIELD5": "宇都宮市江曽島5丁目1-7",
            "latitude": 139.8717663,
            "longitude": 36.518828
            ],
         [
            "FIELD3": "栃木銀行　陽南支店",
            "FIELD5": "宇都宮市宮本町17-7",
            "latitude": 139.8657032,
            "longitude": 36.5254931
            ],
         [
            "FIELD3": "栃木県立がんセンター",
            "FIELD5": "宇都宮市陽南4丁目9-13",
            "latitude": 139.8725083,
            "longitude": 36.5308571
            ],
         [
            "FIELD3": "宮原運動公園",
            "FIELD5": "宇都宮市陽南4丁目5-6",
            "latitude": 139.8706114,
            "longitude": 36.5349292
            ],
         [
            "FIELD3": "南市民活動センター",
            "FIELD5": "宇都宮市江曽島2丁目4-23",
            "latitude": 139.8678037,
            "longitude": 36.5200288
            ],
         [
            "FIELD3": "栃木県動物愛護指導センター",
            "FIELD5": "宇都宮市今宮4丁目7-8",
            "latitude": 139.8711113,
            "longitude": 36.5066368
            ],
         [
            "FIELD3": "子育てサロン石井",
            "FIELD5": "宇都宮市石井町2989　石井保育園内",
            "latitude": 139.9301215,
            "longitude": 36.5434008
            ],
         [
            "FIELD3": "たいらや　石井店",
            "FIELD5": "宇都宮市石井町2800-57",
            "latitude": 139.930668,
            "longitude": 36.5440642
            ],
         [
            "FIELD3": "ヨークベニマル　石井店",
            "FIELD5": "宇都宮市石井町3351-1",
            "latitude": 139.9251168,
            "longitude": 36.5259296
            ],
         [
            "FIELD3": "栃木SC宇都宮フィールド（宇都宮市サッカー場）",
            "FIELD5": "宇都宮市中久保2丁目1-25",
            "latitude": 139.9287337,
            "longitude": 36.5593793
            ],
         [
            "FIELD3": "平石地区市民センター",
            "FIELD5": "宇都宮市下平出町158-1",
            "latitude": 139.9491383,
            "longitude": 36.5558179
            ],
         [
            "FIELD3": "ショッピングモール　ベルモール",
            "FIELD5": "宇都宮市陽東6丁目2-1",
            "latitude": 139.9316754,
            "longitude": 36.552431
            ],
         [
            "FIELD3": "イトーヨーカドー　宇都宮店（ベルモール内）",
            "FIELD5": "宇都宮市陽東6丁目2-1",
            "latitude": 139.9316272,
            "longitude": 36.5516585
            ],
         [
            "FIELD3": "TBSハウジング　宇都宮ベルモール会場",
            "FIELD5": "宇都宮市陽東6丁目2-2",
            "latitude": 139.9317343,
            "longitude": 36.5535134
            ],
         [
            "FIELD3": "栃木トヨペット　宇都宮平出店",
            "FIELD5": "宇都宮市陽東8丁目1-3",
            "latitude": 139.9374946,
            "longitude": 36.5532603
            ],
         [
            "FIELD3": "フライングガーデン　下平出店",
            "FIELD5": "宇都宮市下平出町160-2",
            "latitude": 139.9499099,
            "longitude": 36.555556
            ],
         [
            "FIELD3": "サトーカメラスーパーカメラセンター　宇都宮本店",
            "FIELD5": "宇都宮市陽東3丁目27-15",
            "latitude": 139.928948,
            "longitude": 36.553688
            ],
         [
            "FIELD3": "清原地区市民センター",
            "FIELD5": "宇都宮市清原工業団地15-4",
            "latitude": 139.9856288,
            "longitude": 36.5434182
            ],
         [
            "FIELD3": "清原管理事務所（清原体育館）",
            "FIELD5": "宇都宮市清原工業団地14",
            "latitude": 139.9867058,
            "longitude": 36.5417641
            ],
         [
            "FIELD3": "とびやま歴史体験館",
            "FIELD5": "宇都宮市竹下町380-1",
            "latitude": 139.9714559,
            "longitude": 36.5531555
            ],
         [
            "FIELD3": "栃木銀行　テクノポリス支店",
            "FIELD5": "宇都宮市ゆいの杜3丁目2-20",
            "latitude": 139.9906192,
            "longitude": 36.5676914
            ],
         [
            "FIELD3": "宇都宮市サン・アビリティーズ",
            "FIELD5": "宇都宮市屋板町251-1",
            "latitude": 139.8971568,
            "longitude": 36.5184401
            ],
         [
            "FIELD3": "宇都宮市弓道場",
            "FIELD5": "宇都宮市屋板町231-1",
            "latitude": 139.8984964,
            "longitude": 36.5190511
            ],
         [
            "FIELD3": "屋板運動場",
            "FIELD5": "宇都宮市屋板町231-1",
            "latitude": 139.8974569,
            "longitude": 36.5178247
            ],
         [
            "FIELD3": "横川地区市民センター",
            "FIELD5": "宇都宮市屋板町576-1",
            "latitude": 139.9022955,
            "longitude": 36.513674
            ],
         [
            "FIELD3": "宇都宮市スケートセンター",
            "FIELD5": "宇都宮市城南3丁目15-32",
            "latitude": 139.8855934,
            "longitude": 36.5080569
            ],
         [
            "FIELD3": "ツクイ　宇都宮いちり",
            "FIELD5": "宇都宮市上横田町800",
            "latitude": 139.8825552,
            "longitude": 36.5205874
            ],
         [
            "FIELD3": "ネッツトヨタ栃木（株）　台新田町店",
            "FIELD5": "宇都宮市台新田町126-1",
            "latitude": 139.880219,
            "longitude": 36.5145076
            ],
         [
            "FIELD3": "（株）TAインポート　アウディ宇都宮",
            "FIELD5": "宇都宮市横田新町1-48",
            "latitude": 139.8805619,
            "longitude": 36.51116
            ],
         [
            "FIELD3": "フライングガーデン　宇都宮インターパーク店",
            "FIELD5": "宇都宮市インターパーク1丁目2-3",
            "latitude": 139.9082701,
            "longitude": 36.4980359
            ],
         [
            "FIELD3": "瑞穂野地区市民センター",
            "FIELD5": "宇都宮市下桑島町1030-1",
            "latitude": 139.9354584,
            "longitude": 36.5035134
            ],
         [
            "FIELD3": "子育てサロンみずほの",
            "FIELD5": "宇都宮市上桑島町1311-25",
            "latitude": 139.9312414,
            "longitude": 36.5141192
            ],
         [
            "FIELD3": "フードオアシスオータニ　みずほの店",
            "FIELD5": "宇都宮市西刑部町桑島台2450-4",
            "latitude": 139.928021,
            "longitude": 36.50752
            ],
         [
            "FIELD3": "和　たけい",
            "FIELD5": "宇都宮市東刑部町1592-2",
            "latitude": 139.9474719,
            "longitude": 36.5002706
            ],
         [
            "FIELD3": "子育てサロン竹林",
            "FIELD5": "宇都宮市竹林町226　竹林保育園内",
            "latitude": 139.9144429,
            "longitude": 36.574725
            ],
         [
            "FIELD3": "ヨークベニマル　御幸ヶ原店",
            "FIELD5": "宇都宮市御幸ヶ原町50-1",
            "latitude": 139.9313218,
            "longitude": 36.5894727
            ],
         [
            "FIELD3": "栃木銀行　宇都宮北支店",
            "FIELD5": "宇都宮市岩曽町1354",
            "latitude": 139.9150002,
            "longitude": 36.5802548
            ],
         [
            "FIELD3": "子育てサロンとよさと　なかよし広場",
            "FIELD5": "宇都宮市関堀町53-5",
            "latitude": 139.8974729,
            "longitude": 36.5891323
            ],
         [
            "FIELD3": "かしわぶち産婦人科",
            "FIELD5": "宇都宮市海道町70-8",
            "latitude": 139.9292641,
            "longitude": 36.6006328
            ],
         [
            "FIELD3": "ネッツトヨタ　宇都宮みゆきが原店",
            "FIELD5": "宇都宮市下川俣町206-29",
            "latitude": 139.9244255,
            "longitude": 36.589787
            ],
         [
            "FIELD3": "栃木トヨペット　宇都宮岩曽店",
            "FIELD5": "宇都宮市岩曽町1355-30",
            "latitude": 139.9160014,
            "longitude": 36.582105
            ],
         [
            "FIELD3": "谷田部石材販売（株）　北山本部",
            "FIELD5": "宇都宮市岩本町348",
            "latitude": 139.9036467,
            "longitude": 36.6081909
            ],
         [
            "FIELD3": "宇都宮美術館",
            "FIELD5": "宇都宮市長岡町1077",
            "latitude": 139.877288,
            "longitude": 36.6034741
            ],
         [
            "FIELD3": "宇都宮市保健所",
            "FIELD5": "宇都宮市竹林町972",
            "latitude": 139.8987322,
            "longitude": 36.5743147
            ],
         [
            "FIELD3": "アカチャンホンポ　宇都宮店",
            "FIELD5": "宇都宮市豊郷台2丁目87　豊郷台ショッピングセンター　ミュゼ2階",
            "latitude": 139.8879136,
            "longitude": 36.6014664
            ],
         [
            "FIELD3": "フライングガーデン　豊郷台店",
            "FIELD5": "宇都宮市長岡町46-1",
            "latitude": 139.8917448,
            "longitude": 36.594601
            ],
         [
            "FIELD3": "（株）サンリード",
            "FIELD5": "宇都宮市長岡町443-1",
            "latitude": 139.8826946,
            "longitude": 36.5924362
            ],
         [
            "FIELD3": "かっぱ寿司　宇都宮竹林店",
            "FIELD5": "宇都宮市竹林町893-3",
            "latitude": 139.9039441,
            "longitude": 36.5717935
            ],
         [
            "FIELD3": "トヨタウッドユーホーム　すまいるプラザ宇都宮",
            "FIELD5": "宇都宮市竹林町1063-3",
            "latitude": 139.9007255,
            "longitude": 36.5726387
            ],
         [
            "FIELD3": "国本地区市民センター",
            "FIELD5": "宇都宮市宝木本町1868-1",
            "latitude": 139.8428444,
            "longitude": 36.6120722
            ],
         [
            "FIELD3": "道の駅 うつのみや ろまんちっく村",
            "FIELD5": "宇都宮市新里町丙254",
            "latitude": 139.8338423,
            "longitude": 36.6310099
            ],
         [
            "FIELD3": "富屋地区市民センター",
            "FIELD5": "宇都宮市徳次郎町80-2",
            "latitude": 139.8508176,
            "longitude": 36.6416943
            ],
         [
            "FIELD3": "篠井地区市民センター",
            "FIELD5": "宇都宮市下小池町466-1",
            "latitude": 139.8142789,
            "longitude": 36.6771473
            ],
         [
            "FIELD3": "スーパーオータニ　野沢店",
            "FIELD5": "宇都宮市野沢町40-1",
            "latitude": 139.8612182,
            "longitude": 36.6021429
            ],
         [
            "FIELD3": "とちぎ男女共同参画センター（パルティ）",
            "FIELD5": "宇都宮市野沢町4-1",
            "latitude": 139.8629774,
            "longitude": 36.5982021
            ],
         [
            "FIELD3": "とちぎ青少年センター",
            "FIELD5": "宇都宮市駒生1丁目1-6",
            "latitude": 139.8579603,
            "longitude": 36.569601
            ],
         [
            "FIELD3": "フードオアシスオータニ　明保店",
            "FIELD5": "宇都宮市下荒針町3473-5",
            "latitude": 139.842422,
            "longitude": 36.561329
            ],
         [
            "FIELD3": "城山地区市民センター",
            "FIELD5": "宇都宮市大谷町1059-5",
            "latitude": 139.8290305,
            "longitude": 36.5860422
            ],
         [
            "FIELD3": "子ども発達センター",
            "FIELD5": "宇都宮市鶴田町970-1",
            "latitude": 139.8567011,
            "longitude": 36.555185
            ],
         [
            "FIELD3": "子育てサロン西部",
            "FIELD5": "宇都宮市鶴田町970-1　子ども発達センター・西部保育園内",
            "latitude": 139.85631,
            "longitude": 36.555185
            ],
         [
            "FIELD3": "うつのみや遺跡の広場",
            "FIELD5": "宇都宮市上欠町151-1",
            "latitude": 139.8353802,
            "longitude": 36.5323018
            ],
         [
            "FIELD3": "姿川地区市民センター",
            "FIELD5": "宇都宮市西川田町805-1",
            "latitude": 139.8523794,
            "longitude": 36.5264737
            ],
         [
            "FIELD3": "栃木県子ども総合科学館",
            "FIELD5": "宇都宮市西川田町567",
            "latitude": 139.8404867,
            "longitude": 36.5104661
            ],
         [
            "FIELD3": "栃木県総合運動公園管理事務所",
            "FIELD5": "宇都宮市西川田4丁目1-1",
            "latitude": 139.8627454,
            "longitude": 36.507616
            ],
         [
            "FIELD3": "栃木県総合運動公園",
            "FIELD5": "宇都宮市西川田4丁目1-1",
            "latitude": 139.864235,
            "longitude": 36.5082227
            ],
         [
            "FIELD3": "とちのきファミリーランド",
            "FIELD5": "宇都宮市西川田4丁目1-1",
            "latitude": 139.8615987,
            "longitude": 36.5095583
            ],
         [
            "FIELD3": "フードオアシスオータニ　鶴田店",
            "FIELD5": "宇都宮市鶴田町513-4",
            "latitude": 139.8624078,
            "longitude": 36.5476606
            ],
         [
            "FIELD3": "ヨークベニマル　西川田店",
            "FIELD5": "宇都宮市西川田町920-2",
            "latitude": 139.8545096,
            "longitude": 36.5225776
            ],
         [
            "FIELD3": "トイザらス・ベビーザらス　宇都宮店",
            "FIELD5": "宇都宮市鶴田町208-1",
            "latitude": 139.8574781,
            "longitude": 36.5454696
            ],
         [
            "FIELD3": "ドコモショップ　宇都宮鶴田店",
            "FIELD5": "宇都宮市鶴田町221-1",
            "latitude": 139.8591499,
            "longitude": 36.5463556
            ],
         [
            "FIELD3": "東日本三菱自動車販売（株）　宇都宮総合グラウンド店",
            "FIELD5": "宇都宮市西川田南2丁目2-1",
            "latitude": 139.8576388,
            "longitude": 36.5058702
            ],
         [
            "FIELD3": "すぎのや本陣　宇都宮南店",
            "FIELD5": "宇都宮市西川田町434-1",
            "latitude": 139.8444297,
            "longitude": 36.5147463
            ],
         [
            "FIELD3": "下野新聞ハウジングセンター　フェアリィ・スクエア　西川田総合住宅展示場",
            "FIELD5": "宇都宮市西川田町245-1",
            "latitude": 139.8457272,
            "longitude": 36.5127575
            ],
         [
            "FIELD3": "雀宮地区市民センター",
            "FIELD5": "宇都宮市新富町9-4",
            "latitude": 139.87657,
            "longitude": 36.4830394
            ],
         [
            "FIELD3": "子育てサロン北雀宮",
            "FIELD5": "宇都宮市若松原2丁目18-30　北雀宮保育園内",
            "latitude": 139.8709383,
            "longitude": 36.4949764
            ],
         [
            "FIELD3": "南図書館",
            "FIELD5": "宇都宮市雀宮町56-1",
            "latitude": 139.8831093,
            "longitude": 36.4918157
            ],
         [
            "FIELD3": "雀宮体育館",
            "FIELD5": "宇都宮市南町6-3",
            "latitude": 139.8681836,
            "longitude": 36.4789525
            ],
         [
            "FIELD3": "フードオアシスオータニ　五代店",
            "FIELD5": "宇都宮市五代1丁目3-8",
            "latitude": 139.8644547,
            "longitude": 36.4885954
            ],
         [
            "FIELD3": "ヨークベニマル　若松原店",
            "FIELD5": "宇都宮市北若松原1丁目13-15",
            "latitude": 139.8695246,
            "longitude": 36.5041771
            ],
         [
            "FIELD3": "ＦＫＤ　インターパーク店",
            "FIELD5": "宇都宮市インタ-パ-ク6丁目1-1",
            "latitude": 139.9100973,
            "longitude": 36.4875916
            ],
         [
            "FIELD3": "インターパークショッピングビレッジ",
            "FIELD5": "宇都宮市インタ-パ-ク4丁目1-3",
            "latitude": 139.9104134,
            "longitude": 36.4904722
            ],
         [
            "FIELD3": "インターパークスタジアム",
            "FIELD5": "宇都宮市インタ-パ-ク4丁目2-3",
            "latitude": 139.9135373,
            "longitude": 36.4909086
            ],
         [
            "FIELD3": "ペットフォレスト　宇都宮インターパーク店",
            "FIELD5": "宇都宮市インタ-パ-ク4丁目1-2",
            "latitude": 139.9100062,
            "longitude": 36.4918339
            ],
         [
            "FIELD3": "レクサス　宇都宮南",
            "FIELD5": "宇都宮市宮の内1丁目174-1",
            "latitude": 139.8792009,
            "longitude": 36.5034348
            ],
         [
            "FIELD3": "Honda Cars 栃木東　宮の内店",
            "FIELD5": "宇都宮市宮の内2丁目184",
            "latitude": 139.8778292,
            "longitude": 36.4994107
            ],
         [
            "FIELD3": "フライングガーデン　若松原店",
            "FIELD5": "宇都宮市若松原1丁目2-27",
            "latitude": 139.8689796,
            "longitude": 36.5020708
            ],
         [
            "FIELD3": "東京オート　宇都宮若松原店",
            "FIELD5": "宇都宮市若松原1丁目3-15",
            "latitude": 139.8706972,
            "longitude": 36.5018938
            ],
         [
            "FIELD3": "MOVIX宇都宮",
            "FIELD5": "宇都宮市インタ-パ-ク6丁目1-1",
            "latitude": 139.9108421,
            "longitude": 36.48877
            ],
         [
            "FIELD3": "Sports arena INTER PARK ＋１ 宇都宮店",
            "FIELD5": "宇都宮市インタ-パ-ク6丁目5-1",
            "latitude": 139.9088434,
            "longitude": 36.4849947
            ],
         [
            "FIELD3": "上河内地域自治センター",
            "FIELD5": "宇都宮市中里町181-3",
            "latitude": 139.9045192,
            "longitude": 36.6799362
            ],
         [
            "FIELD3": "子育てサロンゆずのこ",
            "FIELD5": "宇都宮市松田新田町483　ゆずのこ保育園内",
            "latitude": 139.9025098,
            "longitude": 36.6801152
            ],
         [
            "FIELD3": "上河内図書館",
            "FIELD5": "宇都宮市中里町182-1",
            "latitude": 139.9043745,
            "longitude": 36.6793165
            ],
         [
            "FIELD3": "上河内保健センター",
            "FIELD5": "宇都宮市上田町1060-3",
            "latitude": 139.9096418,
            "longitude": 36.681586
            ],
         [
            "FIELD3": "上河内地域交流館　ほたるの里　梵天の湯",
            "FIELD5": "宇都宮市今里町18-4",
            "latitude": 139.9087296,
            "longitude": 36.6827362
            ],
         [
            "FIELD3": "河内生涯学習センター",
            "FIELD5": "宇都宮市中岡本町3225",
            "latitude": 139.9467324,
            "longitude": 36.6136435
            ],
         [
            "FIELD3": "河内農業構造改善センター",
            "FIELD5": "宇都宮市上田原町249",
            "latitude": 139.9118548,
            "longitude": 36.6385169
            ],
         [
            "FIELD3": "田原コミュニティプラザ",
            "FIELD5": "宇都宮市上田原町1",
            "latitude": 139.9120477,
            "longitude": 36.6328474
            ],
         [
            "FIELD3": "河内地域自治センター",
            "FIELD5": "宇都宮市白沢町500",
            "latitude": 139.9426172,
            "longitude": 36.625755
            ],
         [
            "FIELD3": "子育てサロンなかよし",
            "FIELD5": "宇都宮市白沢町396-2　なかよし保育園内",
            "latitude": 139.9448356,
            "longitude": 36.6228875
            ],
         [
            "FIELD3": "岡本児童館",
            "FIELD5": "宇都宮市下岡本町1954-10　岡本コミュニティプラザ内",
            "latitude": 139.9470539,
            "longitude": 36.5944832
            ],
         [
            "FIELD3": "白沢児童館",
            "FIELD5": "宇都宮市白沢町385　河内総合福祉センター内",
            "latitude": 139.9449213,
            "longitude": 36.6244151
            ],
         [
            "FIELD3": "田原児童館",
            "FIELD5": "宇都宮市上田原町1　田原コミュニティプラザ内",
            "latitude": 139.9117369,
            "longitude": 36.6328474
            ],
         [
            "FIELD3": "河内図書館",
            "FIELD5": "宇都宮市中岡本町3397",
            "latitude": 139.9400934,
            "longitude": 36.6113521
            ],
         [
            "FIELD3": "ドリームプールかわち（河内総合運動公園）",
            "FIELD5": "宇都宮市白沢町1791-3",
            "latitude": 139.9409722,
            "longitude": 36.6282733
            ],
         [
            "FIELD3": "河内保健センター",
            "FIELD5": "宇都宮市白沢町386-2",
            "latitude": 139.9447391,
            "longitude": 36.6249694
            ],
         [
            "FIELD3": "スーパーオータニ　宝井店",
            "FIELD5": "宇都宮市下田原町3230-29",
            "latitude": 139.9227644,
            "longitude": 36.6301195
            ],
         [
            "FIELD3": "フードオアシスオータニ　岡本店",
            "FIELD5": "宇都宮市下岡本町4278",
            "latitude": 139.9501832,
            "longitude": 36.5955219
            ],
         [
            "FIELD3": "タノシム クラシノ 家ノミセ　casa di cafe 楽暮 labo",
            "FIELD5": "宇都宮市下川俣町14-3",
            "latitude": 139.9167309,
            "longitude": 36.5868976
            ],
         [
            "FIELD3": "hair+cafe KouHaku（ヘアプラスカフェ　コウハク）",
            "FIELD5": "宇都宮市長岡町1189-11",
            "latitude": 139.8879243,
            "longitude": 36.5983545
            ],
         [
            "FIELD3": "宇都宮西ミュージックセンター",
            "FIELD5": "宇都宮市鶴田町965-1",
            "latitude": 139.8563421,
            "longitude": 36.5557568
            ],
         [
            "FIELD3": "Collabo Mall（コラボモール）",
            "FIELD5": "宇都宮市西川田本町2丁目6-18",
            "latitude": 139.849896,
            "longitude": 36.5115136
            ],
         [
            "FIELD3": "宇都宮駅ビル パセオ",
            "FIELD5": "宇都宮市川向町1-23",
            "latitude": 139.9015292,
            "longitude": 36.5575244
            ],
         [
            "FIELD3": "コパン　カフェ　デコボコ",
            "FIELD5": "宇都宮市鶴田町3343　井上ビル1階",
            "latitude": 139.8642939,
            "longitude": 36.537692
            ],
         [
            "FIELD3": "Angel Line（エンジェル ライン）",
            "FIELD5": "宇都宮市江曽島町1453-6",
            "latitude": 139.8789672,
            "longitude": 36.5206364
            ]
        ]
    
    
    

   
}
