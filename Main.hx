import hxd.Key;


class Main extends hxd.App {
<<<<<<< Updated upstream:Main.hx
    var bmp : h2d.Bitmap;
    override function init() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "Penis!";

        var tile = h2d.Tile.fromColor(0xFF0000, 100, 100);

        bmp = new h2d.Bitmap(tile, s2d);

        bmp.x = s2d.width * 0.5;
        bmp.y = s2d.height * 0.5;

        bmp.tile.dx = -50;
        bmp.tile.dy = -50;

        function onEvent(event: hxd.Event) {
            switch(event.kind) {
                case EKeyDown: trace('DOWN keyCode: ${event.keyCode}, charCode: ${event.charCode}');
                case EKeyUp: trace('UP keyCode: ${event.keyCode}, charCode: ${event.charCode}');
                case _:
            }
        }
        hxd.Window.getInstance().addEventTarget(onEvent);
    }

    override function update(dt:Float) {
        if (hxd.Key.isDown(Key.A)) {
            bmp.rotation -= 0.1;
        }
        
        if (hxd.Key.isDown(Key.D)) {
            bmp.rotation += 0.1;
        }
=======
    var player : Player;
    var background : h2d.Bitmap;
    public static var layers : h2d.Layers;
    
    override function init() {
        
        drawBackground();
        layers = new h2d.Layers(s2d);

        player = new Player(3 * 32, 3 * 32, s2d);

        new Solid(3, 10, s2d);
        new Solid(5, 8, s2d);
        new Solid(7, 8, s2d);
        new Solid(6, 6, s2d);
        new Solid(3, 3, s2d);
        new Solid(4, 6, s2d);
        new Solid(4, 3, s2d);
        new Solid(2, 3, s2d);
    }

    override function update(dt:Float) {
>>>>>>> Stashed changes:src/Main.hx

        if (Key.isDown(Key.R)) {
            player.setCoordinates(s2d.width/2, s2d.height/2);
        }
        player.update(dt);
    }

<<<<<<< Updated upstream:Main.hx
    static function main() {
=======
    public static function main() {
        hxd.Res.initEmbed();
>>>>>>> Stashed changes:src/Main.hx
        new Main();
    }


    function drawBackground() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), s2d);
        tf.text = "Penis!";
        // this.solid = new Solid(100, 100, s2d);

        background = new h2d.Bitmap(h2d.Tile.fromColor(0xffffff, s2d.width, s2d.height), s2d);

        // for (col in 0...Std.int(s2d.width/32)) {
        //     for(row in 0...Std.int(s2d.height/32)) {
        //         if ((col + row) % 2 == 0 ) 
        //             continue;
        //         var tile = h2d.Tile.fromColor(0xcccccc, 32, 32);
        //         var bmp = new h2d.Bitmap(tile, s2d);
        //         bmp.x = col * 32;
        //         bmp.y = row * 32;
        //         trace(bmp.x);
        //         trace(bmp.y);
        //     }
        // }
    }
}