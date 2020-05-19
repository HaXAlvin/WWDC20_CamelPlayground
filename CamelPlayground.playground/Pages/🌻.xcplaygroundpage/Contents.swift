/*:
# How🤷‍♂️
Just click on the view!

You should expand the screen to get a better gaming experience!
 
You can go around in the house after you finish all the jobs.
 - - -
# Notice⚠️
Please remember to switch the **Enable Results** off.

And **DON'T** use Step mode to run code.
 - - -
 # About this work💻
Hello, I am a student from Taiwan. You can call me Camel🐫.

I think in today's world people are less and less concerned with nature, the earth🌎 is our mother, but we are always greedy for it.
We take things in everyday life for granted, but the truth is that water💧 is not inexhaustible and electricity🔋 is not either.

For example, now that oil🛢 prices are plummeting, we are always concerned about how expensive💵 or how cheap it is to extract oil, but in fact oil itself is a priceless treasure on earth.
 
For example, now that people are starting to go out less because of the epidemic😷, and making less garbage, we're actually giving nature a breathing space, and there appears a lot of animals on the road🦌, on the beach🐢, this is a sight we've never seen before.

I made this little game🎮 in the hope that while people can quarantine their homes and care about the epidemic all the time, we can also think about how precious the world we live in is, and hope to awaken people to care about nature🌳.


If everyone could value nature and resources as much as they do in the game, then we could **look around in this wonderful world** just like the game ends!❤️
 - - -
 */
import Foundation
import SpriteKit
import UIKit
import PlaygroundSupport

class mygameScene:SKScene{
    var house:SKSpriteNode!
    var heater:SKSpriteNode!
    var shower:SKSpriteNode!
    var water:SKSpriteNode!
    var fire:SKSpriteNode!
    var box:SKSpriteNode!
    var ok:SKSpriteNode!
    var fan:SKSpriteNode!
    var desk:SKSpriteNode!
    var light:SKSpriteNode!
    var aircon:SKSpriteNode!
    var freezer:SKSpriteNode!
    var faucet:SKSpriteNode!
    var wind:SKSpriteNode!
    var time:SKSpriteNode!
    var window:SKSpriteNode!
    var greenBed:SKSpriteNode!
    var yellowBed:SKSpriteNode!
    var chandelier:SKSpriteNode!
    var watering:SKSpriteNode!
    var mirror:SKSpriteNode!
    var chair:SKSpriteNode!
    var toliet:SKSpriteNode!
    var antenna:SKSpriteNode!
    var washstand:SKSpriteNode!
    var dinnerTable:SKSpriteNode!
    var appleDraw:SKSpriteNode!
    var cabinet:SKSpriteNode!
    var table:SKSpriteNode!
    var camel:SKSpriteNode!
    var smoke:SKSpriteNode!
    var sofa:SKSpriteNode!
    var tree:SKSpriteNode!
    var oven:SKSpriteNode!
    var lamp:SKSpriteNode!
    var cameraNode = SKCameraNode()
    let label = SKLabelNode(fontNamed: "label")
    var gameScene:Int = 0
    let pos:[Int:[CGFloat]] = [1:[-140,20,0.3],2:[0,20,0.25],3:[150,20,0.3],4:[90,-70,0.35],5:[-120,-70,0.25]]
    var username = "Camel"
    
    override init(size:CGSize) {
        super.init(size:size)
        backgroundColor = #colorLiteral(red: 0.8132325215, green: 0.8248955655, blue: 1, alpha: 1)
        label.preferredMaxLayoutWidth = 220
        label.verticalAlignmentMode = .baseline
        label.horizontalAlignmentMode = .center
        label.lineBreakMode = .byClipping
        label.name = "label"
        label.numberOfLines = 0
        label.text = "What's your name?"
        label.fontColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        setHouse()
        boxIN(text: label.text!)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init error")
    }
    //camera
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        cameraNode.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(cameraNode)
        camera = cameraNode
    }
    func distance(_ a:CGPoint, _ b:CGPoint) -> CGFloat{
        let dx = a.x - b.x
        let dy = a.y - b.y
        let d = sqrt((dx * dx) + dy * dy)
        return CGFloat(d)
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touchs = event?.allTouches else {
            return
        }
        guard gameScene >= 6 else {
            return
        }
        let arr = Array(touchs)
        guard let p1 = arr.first else {
            return
        }
        let p1_n = p1.location(in: self)
        let p1_p = p1.previousLocation(in: self)
        if arr.count > 1{
            
            let p2_n = arr[1].location(in: self)
            let p2_p = arr[1].previousLocation(in: self)
            
            let oldDistance = distance(p1_p, p2_p)
            let newDistance = distance(p1_n, p2_n)
            let diff = oldDistance / newDistance
            if diff.isNormal && diff != 1{
                let scaleAction = SKAction.scale(by: diff, duration: 0)
                cameraNode.run(scaleAction)
            }
        }
        let translation = CGPoint(x: p1_n.x - p1_p.x, y: p1_n.y - p1_p.y)
        let panAction = SKAction.moveBy(x: -translation.x, y: -translation.y, duration: 0)
        cameraNode.run(panAction)
    }
    func setHouse(){
        
        //house0
        house = SKSpriteNode(imageNamed: "house.png")
        house.name = "house"
        house.position = CGPoint(x: 375, y: 334)
        house.size = CGSize(width: house.size.width*0.5, height: house.size.height*0.5)
        addChild(house)

        //desk1
        desk = SKSpriteNode(imageNamed: "desk.png")
        desk.name = "desk"
        desk.size = CGSize(width: desk.size.width*0.5, height: desk.size.height*0.5)
        desk.position = CGPoint(x: 280, y: 325)
        addChild(desk)

        //yellowBed1
        yellowBed = SKSpriteNode(imageNamed: "yellowBed.png")
        yellowBed.name = "yellowBed"
        yellowBed.size = CGSize(width: yellowBed.size.width*0.5, height: yellowBed.size.height*0.5)
        yellowBed.position = CGPoint(x: 210, y: 330)
        addChild(yellowBed)

        //chair1
        chair = SKSpriteNode(imageNamed: "chair.png")
        chair.name = "chair"
        chair.size = CGSize(width: chair.size.width*0.5, height: chair.size.height*0.5)
        chair.position = CGPoint(x: 255, y: 323)
        addChild(chair)

        //light1
        light = SKSpriteNode(imageNamed: "light/light01.png")
        light.normalTexture = SKTexture(imageNamed: "light/light02.png")
        light.name = "light"
        light.size = CGSize(width: light.size.width*0.5, height: light.size.height*0.5)
        light.position = CGPoint(x: 280, y: 347)
        addChild(light)

        //time1
        time = SKSpriteNode(imageNamed: "time.png")
        time.name = "time"
        time.size = CGSize(width: time.size.width*0.5, height: time.size.height*0.5)
        time.position = CGPoint(x: 230, y: 370)
        addChild(time)

        //aircon2
        aircon = SKSpriteNode(imageNamed: "aircon/aircon01.png")
        aircon.normalTexture = SKTexture(imageNamed: "aircon/aircon02.png")
        aircon.name = "aircon"
        aircon.size = CGSize(width: aircon.size.width*0.6, height: aircon.size.height*0.6)
        aircon.position = CGPoint(x: 375, y: 387)
        addChild(aircon)

        //wind2
        var windFrame:[SKTexture] = []
        for i in 1...3{
            windFrame.append(SKTexture(imageNamed: "wind/wind0\(i).png"))
        }
        wind = SKSpriteNode(imageNamed:  "wind/wind01.png")
        wind.name = "wind"
        wind.size = CGSize(width: wind.size.width*0.6, height: wind.size.height*0.6)
        wind.position = CGPoint(x: 375, y: 365)
        addChild(wind)
        wind.run(SKAction.repeatForever(SKAction.animate(with: windFrame, timePerFrame: 0.2)), withKey: "windRunning")

        //greenBed2
        greenBed = SKSpriteNode(imageNamed: "greenBed.png")
        greenBed.name = "greenBed"
        greenBed.size = CGSize(width: greenBed.size.width*0.5, height: greenBed.size.height*0.5)
        greenBed.position = CGPoint(x: 375, y: 330)
        addChild(greenBed)

        //appleDraw2
        appleDraw = SKSpriteNode(imageNamed: "appleDraw.png")
        appleDraw.name = "appleDraw"
        appleDraw.size = CGSize(width: appleDraw.size.width*0.5, height: appleDraw.size.height*0.5)
        appleDraw.position = CGPoint(x: 423, y: 372)
        addChild(appleDraw)

        //cabinet2
        cabinet = SKSpriteNode(imageNamed: "cabinet/cabinet01.png")
        cabinet.normalTexture = SKTexture(imageNamed: "cabinet/cabinet02.png")
        cabinet.name = "cabinet"
        cabinet.size = CGSize(width: cabinet.size.width*0.3, height: cabinet.size.height*0.3)
        cabinet.position = CGPoint(x: 430, y: 325)
        addChild(cabinet)

        //tree2
        tree = SKSpriteNode(imageNamed: "tree.png")
        tree.name = "tree"
        tree.size = CGSize(width: tree.size.width*0.4, height: tree.size.height*0.4)
        tree.position = CGPoint(x: 330, y: 325)
        addChild(tree)

        //watering2
        var wateringFrame:[SKTexture] = []
        for i in 1...10{
            wateringFrame.append(SKTexture(imageNamed: String(format: "watering/澆水%02d.png", arguments: [i])))
        }
        watering = SKSpriteNode(texture: wateringFrame[0])
        watering.name = "watering"
        watering.size = CGSize(width: watering.size.width*0.5, height: watering.size.height*0.5)
        watering.position = CGPoint(x: 345, y: 352)
        watering.isHidden = true
        addChild(watering)
        watering.run(SKAction.repeatForever(SKAction.animate(with: wateringFrame, timePerFrame: 0.2)), withKey: "wateringRunning")

        //heater3
        heater = SKSpriteNode(imageNamed: "heater.png")
        heater.name = "heater"
        heater.size = CGSize(width: heater.size.width*0.5, height: heater.size.height*0.5)
        heater.position = CGPoint(x: 591, y: 374)
        addChild(heater)

        //smoke3
        var smokeFrame:[SKTexture] = []
        for i in 1...2{
            smokeFrame.append(SKTexture(imageNamed:"smoke/smoke0\(i).png"))
        }
        smoke = SKSpriteNode(texture: smokeFrame[0])
        smoke.name = "smoke"
        smoke.size = CGSize(width: smoke.size.width*0.55, height: smoke.size.height*0.55)
        smoke.position = CGPoint(x: 550, y: 352)
        addChild(smoke)
        smoke.run(SKAction.repeatForever(SKAction.animate(with: smokeFrame, timePerFrame: 0.2)), withKey: "smokeRunning")

        //shower3
        shower = SKSpriteNode(imageNamed: "shower.png")
        shower.name = "shower"
        shower.size = CGSize(width: shower.size.width*0.5, height: shower.size.height*0.5)
        shower.position = CGPoint(x: 561, y: 379)
        addChild(shower)

        //water3
        var waterFrame:[SKTexture] = []
        for i in 1...3{
            waterFrame.append(SKTexture(imageNamed: "water/water0\(i).png"))
        }
        water = SKSpriteNode(texture: SKTexture(imageNamed: "water/water01.png"))
        water.name = "water"
        water.size = CGSize(width: water.size.width*0.5, height: water.size.height*0.5)
        water.position = CGPoint(x: 556, y: 344)
        addChild(water)
        water.run(SKAction.repeatForever(SKAction.animate(with: waterFrame, timePerFrame: 0.2)), withKey: "waterRunning")

        //fire3
        var fireFrame:[SKTexture] = []
        for i in 1...7{
            fireFrame.append(SKTexture(imageNamed: "fire/fire0\(i).png"))
        }
        fire = SKSpriteNode(texture: SKTexture(imageNamed: "fire/fire01.png"))
        fire.name = "fire"
        fire.size = CGSize(width: fire.size.width*0.5, height: fire.size.height*0.5)
        fire.position = CGPoint(x: 589, y: 365)
        addChild(fire)
        fire.run(SKAction.repeatForever(SKAction.animate(with: fireFrame, timePerFrame: 0.2)), withKey: "fireRunning")

        //toliet3
        toliet = SKSpriteNode(imageNamed: "toliet/toliet01.png")
        toliet.normalTexture = SKTexture(imageNamed: "toliet/toliet02.png")
        toliet.name = "toliet"
        toliet.size = CGSize(width: toliet.size.width*0.5, height: toliet.size.height*0.5)
        toliet.position = CGPoint(x: 477, y: 332)
        addChild(toliet)

        //mirror3
        mirror = SKSpriteNode(imageNamed: "mirror.png")
        mirror.name = "mirror"
        mirror.size = CGSize(width: mirror.size.width*0.5, height: mirror.size.height*0.5)
        mirror.position = CGPoint(x: 513, y: 358)
        addChild(mirror)

        //washstand3
        washstand = SKSpriteNode(imageNamed: "washstand.png")
        washstand.name = "washstand"
        washstand.size = CGSize(width: washstand.size.width*0.6, height: washstand.size.height*0.6)
        washstand.position = CGPoint(x: 513, y: 329)
        addChild(washstand)

        //freezer4
        freezer = SKSpriteNode(imageNamed: "freezer/freezer01.png")
        freezer.normalTexture = SKTexture(imageNamed: "freezer/freezer02.png")
        freezer.name = "freezer"
        freezer.position = CGPoint(x: 561, y: 254)
        freezer.size = CGSize(width: freezer.size.width*0.5, height: freezer.size.height*0.5)
        addChild(freezer)

        //window4
        window = SKSpriteNode(imageNamed: "window.png")
        window.name = "window"
        window.size = CGSize(width: window.size.width*0.5, height: window.size.height*0.5)
        window.position = CGPoint(x: 499, y: 259)
        addChild(window)

        //table4
        table = SKSpriteNode(imageNamed: "table.png")
        table.name = "table"
        table.size = CGSize(width: table.size.width*0.5, height: table.size.height*0.5)
        table.position = CGPoint(x: 479, y: 231)
        addChild(table)

        //oven4
        oven = SKSpriteNode(imageNamed: "oven/oven01.png")
        oven.normalTexture = SKTexture(imageNamed: "oven/oven02.png")
        oven.name = "oven"
        oven.size = CGSize(width: oven.size.width*0.5, height: oven.size.height*0.5)
        oven.position = CGPoint(x: 455, y: 237)
        addChild(oven)

        //faucet4
        faucet = SKSpriteNode(imageNamed: "faucet.png")
        faucet.name = "faucet"
        faucet.size = CGSize(width: faucet.size.width*0.5, height: faucet.size.height*0.5)
        faucet.position = CGPoint(x: 499, y: 254)
        addChild(faucet)

        //antenna4
        antenna = SKSpriteNode(imageNamed: "antenna.png")
        antenna.name = "antenna"
        antenna.size = CGSize(width: antenna.size.width*0.5, height: antenna.size.height*0.5)
        antenna.position = CGPoint(x: 530, y: 465)
        addChild(antenna)

        //dinnerTable4
        dinnerTable = SKSpriteNode(imageNamed: "dinnerTable.png")
        dinnerTable.name = "dinnerTable"
        dinnerTable.size = CGSize(width: dinnerTable.size.width*0.5, height: dinnerTable.size.height*0.5)
        dinnerTable.position = CGPoint(x: 390, y: 228)
        addChild(dinnerTable)

        //chandelier4
        chandelier = SKSpriteNode(imageNamed: "chandelier/chandelier01.png")
        chandelier.normalTexture = SKTexture(imageNamed: "chandelier/chandelier02.png")
        chandelier.name = "chandelier"
        chandelier.size = CGSize(width: chandelier.size.width*0.5, height: chandelier.size.height*0.5)
        chandelier.position = CGPoint(x: 390, y: 288)
        addChild(chandelier)

        //lamp5
        lamp = SKSpriteNode(imageNamed: "lamp/lamp01.png")
        lamp.normalTexture = SKTexture(imageNamed: "lamp/lamp02.png")
        lamp.name = "lamp"
        lamp.size = CGSize(width: lamp.size.width*0.5, height: lamp.size.height*0.5)
        lamp.position = CGPoint(x: 185, y: 237)
        addChild(lamp)

        //camel5
        camel = SKSpriteNode(imageNamed: "camel.png")
        camel.name = "camel"
        camel.size = CGSize(width: camel.size.width*0.7, height: camel.size.height*0.7)
        camel.position = CGPoint(x: 247, y: 255)
        addChild(camel)

        //sofa5
        sofa = SKSpriteNode(imageNamed: "sofa.png")
        sofa.name = "sofa"
        sofa.size = CGSize(width: sofa.size.width*0.5, height: sofa.size.height*0.5)
        sofa.position = CGPoint(x: 318, y: 230)
        addChild(sofa)

        //fan5
        var fanFrame:[SKTexture] = []
        for i in 1...3{
            fanFrame.append(SKTexture(imageNamed: "fan/fan0\(i).png"))
        }
        fan = SKSpriteNode(texture: fanFrame[0])
        fan.name = "fan"
        fan.size = CGSize(width: fan.size.width*0.5, height: fan.size.height*0.5)
        fan.position = CGPoint(x: 250, y: 294)
        addChild(fan)
        fan.run(SKAction.repeatForever(SKAction.animate(with: fanFrame, timePerFrame: 0.2)), withKey: "fanRunning")

        //box0
        box = SKSpriteNode(texture: SKTexture(imageNamed: "box.png"))
        box.name = "box"
        box.size = CGSize(width: box.size.width*0.6, height: box.size.height*0.6)
        box.position = CGPoint(x: -100, y: 334)
        addChild(box)
        
        
        //ok0
        ok = SKSpriteNode(texture: SKTexture(imageNamed: "OK.png"))
        ok.name = "ok"
        ok.size = CGSize(width: ok.size.width*0.6, height: ok.size.height*0.6)
        ok.position = CGPoint(x: -100, y: 274)
        addChild(ok)
        
        //label0
        label.fontSize = 20
        addChild(label)
    }
   
    func switchTexture(node:SKSpriteNode){
        let temp:SKTexture = node.normalTexture!
        node.normalTexture = node.texture
        node.texture = temp
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view!.endEditing(true)
        if let location = touches.first?.location(in: self) {
            if self.atPoint(location).name != nil {
                print(self.atPoint(location).name!)
                nodeTapped(name: self.atPoint(location).name!)
            }
        }
    }
    func nodeTapped(name : String) {
        print(gameScene)
        var text = ""
        if name == "ok" {
            self.boxOut()
            if gameScene != 0 && gameScene < 6{
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {timer in
                    self.moveCamera(x: self.pos[self.gameScene]![0], y: self.pos[self.gameScene]![1], by: self.pos[self.gameScene]![2])
                })
            }
        }
        if(gameScene == 0){
            text = scene_0(name:name)
        }else if gameScene == 1 {
            text = scene_1(name:name)
        }else if gameScene == 2 {
            text = scene_2(name:name)
        }else if gameScene == 3 {
            text = scene_3(name:name)
        }else if gameScene == 4 {
            text = scene_4(name:name)
        }else if gameScene == 5 {
            text = scene_5(name:name)
        }else if gameScene >= 6 {
            scene_1(name:name)
            scene_2(name:name)
            scene_3(name:name)
            scene_4(name:name)
            scene_5(name:name)
            //winView
        }
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {timer in
            if text != "" {
                self.boxIN(text: text)
            }
            
        })
    }
    func scene_0(name:String) -> String{
        if(name == "ok"){
            gameScene += 1
            
            textField.isHidden = true
            if textField.text != ""{
                username = textField.text!
            }
            textField.removeFromSuperview()
            return "Good morning," + username + ".\nYou just get up from bed.You need to turn off the lamp and get the phone call in next room."
        }
        return ""
    }
    
    func scene_1(name:String) -> String{
        if(name == "light"){
            switchTexture(node: light)
            gameScene += 1
            return "Mom told you to help her turn the aircon off and water the flower in the room."
        }
        return ""
    }
    func scene_2(name:String) -> String{
        if (name == "wind" || name == "aircon"){
            switchTexture(node: aircon)
            wind.isHidden = !wind.isHidden
            wind.isPaused = !wind.isPaused
            if gameScene == 2{
                gameScene += 1
                return "After that,you found someone forgot to switch the water off"
            }
        }else if(name == "tree"){
            watering.isHidden = !watering.isHidden
            Timer.scheduledTimer(withTimeInterval: 2.5, repeats: false, block: {timer in
                self.watering.isHidden = !self.watering.isHidden
            })
        }else if(name == "cabinet"){
            switchTexture(node: cabinet)
        }
        return ""
    }
    func scene_3(name:String) -> String{
        if (name == "shower" || name == "water"){
            water.isHidden = !water.isHidden
            water.isPaused = !water.isPaused
        }
        else if (name == "fire" || name == "heater"){
            fire.isHidden = !fire.isHidden
            fire.isPaused = !fire.isPaused
        }else if(name == "toliet"){
            switchTexture(node: toliet)
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false, block: {timer in
                self.switchTexture(node: self.toliet)
            })
        }
        smoke.isHidden = fire.isHidden || water.isHidden
        smoke.isPaused = smoke.isHidden
        if (fire.isHidden && water.isHidden && gameScene==3){
            gameScene += 1
            return "You are hungry now, let's go to the kitchen to see what we have there."
        }
        return ""
    }
    func scene_4(name:String) -> String{
        var detect:Bool!
        if (name == "freezer"){
            switchTexture(node: freezer)
        }else if(name == "oven"){
            switchTexture(node: oven)
        }else if(name == "chandelier"){
            switchTexture(node: chandelier)
        }
        detect = (freezer.texture?.description.contains("02"))! && (oven.texture?.description.contains("02"))! && (chandelier.texture?.description.contains("02"))!
        if detect && gameScene == 4{
            gameScene += 1
            return "\"" + username + "! Come out to play!\" Your friend yelled outside. But you have one last thing to do!"
        }
        return ""
        
    }
    func scene_5(name:String) -> String{
        if name == "fan"{
            fan.isPaused = !fan.isPaused
        }else if(name == "lamp"){
            switchTexture(node: lamp)
        }
        if (lamp.texture?.description.contains("02"))! && fan.isPaused && gameScene == 5{
            gameScene += 1
            return "Congratulations! You solve all the tasks! Now you can feel free to look around in this wonderful world!"
        }
        return ""
    }
    func moveCamera(x:CGFloat,y:CGFloat,by:CGFloat){
        let move = SKAction.moveBy(x: x, y: y, duration: 3)
        let rome = SKAction.scale(by: by, duration: 3)
        let group = SKAction.group([move,rome])
        cameraNode.run(group)
    }
    func boxIN(text:String){
        if 7 > gameScene && gameScene > 1 {
            moveCamera(x: -pos[gameScene-1]![0], y: -pos[gameScene-1]![1], by: 1/pos[gameScene-1]![2])
        }
        label.text = text
        box.position = CGPoint(x: -100, y: 334)
        ok.position = CGPoint(x: -100, y: 274)
        if gameScene == 0{
            label.position = CGPoint(x: -100, y: 360)
        }else{
            label.position = CGPoint(x: -100, y: 290)
        }
        box.alpha = 0
        ok.alpha = 0
        label.alpha = 0
        let moveIN = SKAction.moveTo(x: 375, duration: 0.7)
        let fadeIN = SKAction.fadeAlpha(to: 1, duration: 0.5)
        let group = SKAction.group([moveIN,fadeIN])
        box.run(group)
        ok.run(group)
        label.run(group)
    }
    func boxOut(){
        let moveOut = SKAction.moveTo(x: 850, duration: 1)
        let fadeOut = SKAction.fadeAlpha(to: 0, duration: 1)
        let group = SKAction.group([moveOut,fadeOut])
        box.run(group)
        ok.run(group)
        label.run(group)
    }
}

var textField:UITextField!
textField = UITextField(frame: CGRect(x: 360, y: 300, width: 200, height: 30))
textField.borderStyle = .roundedRect
//textField.isHidden = true
textField.alpha = 0
textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
textField.text = ""
textField.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
textField.attributedPlaceholder = NSAttributedString(string: "Enter your name here", attributes:[NSAttributedString.Key.foregroundColor: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)])
textField.translatesAutoresizingMaskIntoConstraints = true
let gameView = SKView(frame: .init(x: 0, y: 0, width: 750, height: 668))
let gameScene = mygameScene(size:gameView.frame.size)

gameScene.scaleMode = .aspectFill
gameView.addSubview(textField)
textField.center = CGPoint(x: gameView.bounds.midX, y: gameView.bounds.midY)
textField.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, 
                              UIView.AutoresizingMask.flexibleRightMargin, 
                              UIView.AutoresizingMask.flexibleTopMargin, 
                              UIView.AutoresizingMask.flexibleBottomMargin]



gameView.presentScene(gameScene)
PlaygroundPage.current.liveView = gameView
PlaygroundPage.current.needsIndefiniteExecution = true
Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false, block: {
    timer in
    UIView.animate(withDuration: 0.5, animations: {
        textField.alpha = 1
    })
})

