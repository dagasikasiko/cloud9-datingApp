//enchantの初期化
enchant();

window.onload = function(){
    //ゲームオブジェクトの生成
    var game = new Game(360, 480);
    game.fps = 10;
    
    var isTouch = false;    // タッチフラグ(タッチ中のみ true にする)
    var touchX  = null;     // タッチX座標
    var touchY  = null;     // タッチY座標
    var move   = 0;        // 移動域
    var touchStart = false;
    var nextFlag = false;
    var down = 2;
    
    //画像を配列に収納
    var _img = [];
    _img[0] = 'http://jsrun.it/assets/3/t/p/7/3tp7g.png';
    _img[1] = 'http://jsrun.it/assets/9/S/V/Q/9SVQh.png';
    _img[2] = 'http://jsrun.it/assets/3/o/r/3/3or3I.png';
    _img[3] = 'http://apptable.org/app/gacha/tamago.png';
    _img[4] = 'http://jsrun.it/assets/i/j/x/I/ijxIb.png';
    _img[5] = 'http://jsrun.it/assets/t/b/b/e/tbbei.gif';
    _img[6] = 'http://apptable.org/app/gacha/dou.png';
    _img[7] = 'http://apptable.org/app/gacha/gin.png';
    _img[8] = 'http://apptable.org/app/gacha/kin.png';
    _img[9] = 'http://apptable.org/app/gacha/gacha_bg.png';
    _img[10] = 'http://jsrun.it/assets/o/K/Y/X/oKYXV.png';    
    
    //画像の読み込み
    game.preload(
            _img[0],
            _img[1],
            _img[2],
            _img[3],
            _img[4],
            _img[5],
            _img[6],
            _img[7],
            _img[8],
            _img[9],
            _img[10]
    );
    
    //画像の読み込み完了時に実行する処理
    game.onload = function(){
        //背景の生成
        game.rootScene.backgroundColor = "white";
        
        var bg = new Sprite(360, 480);
        bg.image= game.assets[_img[9]];
        bg.x = 0;
        bg.y = 0;
        bg._style.zIndex = 9;
        this.rootScene.addChild(bg);
        
        var shade = new Sprite(300, 50);
        shade.image= game.assets[_img[10]];
        shade.x = 58;
        shade.y = 299;
        shade.scaleX = 0.55;
        shade.scaleY = 0.55;
        shade.opacity = 0.5;
        shade._style.zIndex = 11;
        this.rootScene.addChild(shade);
        
        var dragon = new Sprite(300, 294);
        dragon.image= game.assets[_img[0]];
        dragon.x = 40;
        dragon.y = 50;
        dragon._style.zIndex = 12;
        this.rootScene.addChild(dragon);
        
        var arm = new Sprite(157, 157);
        arm.image= game.assets[_img[1]];
        arm.x = 137;
        arm.y = 145;
        arm._style.zIndex = 13;
        arm.rotation = 0;
        this.rootScene.addChild(arm);

        var yajirushi = new Sprite(100, 60);
        yajirushi.image= game.assets[_img[4]];
        yajirushi.x = 124;
        yajirushi.y = 153;
        yajirushi.scaleX = 0.70;
        yajirushi.scaleY = 0.70;
        this.rootScene.addChild(yajirushi);
        
        //dragon2
        var dragon2 = new Sprite(300, 294);
        dragon2.image= game.assets[_img[2]];
        dragon2.x = 50;
        dragon2.y = 999;
        dragon2.frame = 0;
        this.rootScene.addChild(dragon2);
        
        //dragon3
        var dragon3 = new Sprite(350, 343);
        dragon3.image= game.assets[_img[3]];
        dragon3.x = 0;
        dragon3.y = 999;
        dragon3.frame = 0;
        this.rootScene.addChild(dragon3);
        
        
        // タッチイベントを登録
        this.rootScene.addEventListener("touchstart", function(e) { isTouch = true; if(e.localY < 265) touchStart = true;}); // タッチ開始
        this.rootScene.addEventListener("touchend", function(e) {
            isTouch = false;
            arm.rotation = 0;
            touchStart = false;
        });  // タッチ終了
        this.rootScene.addEventListener("touchmove", function(e) {
            // タッチ位置をセット
            touchX = e.localX;
            touchY = e.localY;
            
            if( touchStart === true){
                armMove(touchY);
            }
        });
        
        
        // エンターフレーム処理を登録(毎フレームよばれるやつ)
        this.rootScene.addEventListener("enterframe", function(){
            animeGacha1();
            animeGacha2();
            sagetene();

            if (isTouch === true) {
                if(arm.rotation <= -40){
                    nextFlag = true;
                }
            }
            if(nextFlag === true && dragon.rotation === 0){
                setTimeout(function(){
                    dragon.y = 999;
                    dragon.opacity = 0;
                    arm.y = 999;
                    arm.opacity = 0;
                    yajirushi.y = 999;
                    yajirushi.opacity = 0;
                    nextFlag = false;
                    startGacha1();
                }, 300);

            }
            if(dragon2.frame == 16){
                dragon2.y = 999;
                dragon2.opacity = 0;
                dragon2.flag = false;
                dragon2.frame = 0;
                shade.opacity = 0;
                shade.y = 999;
                startGacha2();
            }
            
            if(dragon3.frame == 13){
                dragon3.flag = false;
                // 徐々に透過
                dragon3.onenterframe = function() {
                    this.opacity -= 0.1;
                    if(this.opacity < 0.1){
                        dragon3.y = 999;
                        game.replaceScene(game.makeScene1());
                    }
                };
            }

            
            function sagetene(){
                var reverseFlag = false;
                yajirushi.y = yajirushi.y + down;
                if(yajirushi.y > 156 || yajirushi.y < 150) reverseFlag = true;
                if (reverseFlag){
                    down = -down;
                }
            }
            // ■ガチャ1アニメーション開始
            function startGacha1(){
                    dragon2.flag = true;
                    dragon2.y = 50;
            };
            // ■ガチャ1アニメーション処理
            function animeGacha1(){
                if (!dragon2.flag){ return; }
                dragon2.frame = dragon2.frame + 1;
            };
            
            // ■ガチャ2アニメーション開始
            function startGacha2(){
                    dragon3.flag = true;
                    dragon3.y = 0;
            };
            // ■ガチャ1アニメーション処理
            function animeGacha2(){
                if (!dragon3.flag){ return; }
                dragon3.frame = dragon3.frame + 1;
            };

        });
        
        function armMove(touchY){
            var _R = dragon.rotation;
                if(touchY > 100 && touchY <= 110) move = 0;
                else if(touchY > 110 && touchY <= 120) move = -5;
                else if(touchY > 120 && touchY <= 130) move = -10;
                else if(touchY > 130 && touchY <= 140) move = -15;
                else if(touchY > 140 && touchY <= 150) move = -20;
                else if(touchY > 150 && touchY <= 160) move = -25;
                else if(touchY > 160 && touchY <= 170) move = -30;
                else if(touchY > 170 && touchY <= 180) move = -35;
                else if(touchY > 180 && touchY <= 190) move = -40;
                else if(touchY > 190) move = -45;
            if(_R > -45 && _R >= move) arm.rotation = move;
        }


    };
    
    //シーン1
    game.makeScene1 = function() {
        var scene = new Scene();
        
        var bgImage;
        var rand = Math.floor( Math.random() * 100 );
        if(rand < 10){
            location.href = "http://apptable.org/app/xcode/invader/user_check/kin.html";
        }else if(rand >= 10 && rand < 30){
            bgImage = _img[7];
        }else{
            location.href = "http://apptable.org/app/xcode/invader/user_check/dou.html";
        }
            location.href = "http://apptable.org/app/xcode/invader/user_check/kin.html";
       
        var egg = new Sprite(360, 480);
        egg.image= game.assets[bgImage];
        egg.x = 0;
        egg.y = 0;
        egg.opacity = 0;
        egg._style.zIndex = 14;
        scene.addChild(egg);
        
        if(rand >= 10 && rand < 30){
        var btn1 = new Sprite(360, 124);
        btn1.image= game.assets[_img[5]];
        btn1.scaleX = 0.7;
        btn1.scaleY = 0.6;
        btn1.x = 0;
        btn1.y = 380;
        btn1._style.zIndex = 15;
        scene.addChild(btn1);
        btn1.addEventListener(Event.TOUCH_START, function(e) {
            btn1.opacity = 0.7;
        });
        btn1.addEventListener(Event.TOUCH_END, function(e) {
            btn1.opacity = 1.0;
            location.reload();
        });
        }

                // 徐々に透過を解除
                egg.onenterframe = function() {
                    this.opacity += 0.2;
                };
        return scene;
    };
    
    game.start();

    
};
