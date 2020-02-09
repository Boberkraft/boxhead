import h2d.Graphics;
import h2d.Bitmap;
import hxd.Key;

class Player extends Entity {

    var bmp : h2d.Bitmap;
    public function new(x, y, parent) {
        super(x, y);
        trace(xx);
        trace(yy);
        
        // bmp = new h2d.Bitmap(hxd.Res.down.toTile(), parent);
        bmp = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000,16,32));

        bmp.tile.dx = -8;
        bmp.tile.dy = -32;

        Main.layers.add(bmp, 2);
    }

    override public function update(dt:Float) {
        
        var speed = 2;
        if (Key.isDown(Key.W)) {
            dy += -speed;
        }
        
        if (Key.isDown(Key.S)) {
            dy += speed;
        }
        if (Key.isDown(Key.A)) {
            dx += -speed;
        }  

        if (Key.isDown(Key.D)) {
            dx += speed;
            
        }
        super.update(dt);
        bmp.x = xx;
        bmp.y = yy;
    }
}