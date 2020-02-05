import hxd.Key;


class Main extends hxd.App {
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

        if (hxd.Key.isDown(Key.W)) {
            var dir = bmp.rotation % (2 * hxd.Math.PI);
            trace(bmp.rotation);
            bmp.y -= Math.cos(dir) * 10;
            bmp.x += Math.sin(dir) * 10;
        }
    }

    static function main() {
        new Main();
    }
}