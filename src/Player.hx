import h2d.Graphics;
import h2d.Bitmap;
import hxd.Key;

class Player extends Entity {
    var bmp : h2d.Bitmap;
    var hitbox : h2d.Bitmap;
    public function new(x, y, parent) {
        super(x, y);
        trace(xx);
        trace(yy);
        
        // bmp = new h2d.Bitmap(hxd.Res.down.toTile(), parent);
        bmp = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000,32,32));
        // hitbox = new h2d.Bitmap(h2d.Tile.fromColor(0x00ff00, 32, 32, 0,6));
        bmp.tile.dx = -16;
        bmp.tile.dy = -16;

        Main.layers.add(bmp, 2);
        // Main.layers.add(hitbox, 4)
        
        function onEvent(event : hxd.Event) {
            switch(event.kind) {
                case EKeyDown: if (event.keyCode == Key.SPACE) onSpace();
                case _:
            }
        }
        hxd.Stage.getInstance().addEventTarget(onEvent);
    }

    function onSpace() {
        new Bullet(this, angle);
        trace('shoow!');
    }
    override public function update(dt:Float) {
        
        var speed = 3;
        var dir : Int = null;
        
        if (Key.isDown(Key.W)) {
            dir = 0;
        }
        
        if (Key.isDown(Key.S)) {
            dir = 180;
        }
        if (Key.isDown(Key.A)) {
            if (dir == 180) {
                dir = dir + 45;
            } else if (dir == 0) {
                dir = 270 + 45;
            } else {
                dir = 270;
            }
        }  

        if (Key.isDown(Key.D)) {
            if (dir == 180) {
                dir = 90 + 45;
            } else if (dir == 0) {
                dir = 90 - 45;
            } else {
                dir = 90;
            }
        }

        if (dir != null) {
            angle = hxd.Math.degToRad(dir);
            dx = Math.sin(angle) * speed;
            dy = -Math.cos(angle) * speed;
            // dy = -Math.sin(dir) * speed;
        } 

        super.update(dt);
        bmp.x = xx;
        bmp.y = yy;
        
    }
}