import h2d.Graphics;
import h2d.Bitmap;
import hxd.Key;

class Player extends Entity {
    var bmp : h2d.Bitmap;
    var anim : h2d.Anim;
    var hitbox : h2d.Bitmap;
    public function new(x, y, parent) {
        super(x, y);
        trace(xx);
        trace(yy);
        
        // bmp = new h2d.Bitmap(hxd.Res.down.toTile(), parent);
        bmp = new h2d.Bitmap(h2d.Tile.fromColor(0xff0000,32,32));
        bmp = new Bitmap(hxd.Res.gracz_stoi.toTile());
        // hitbox = new h2d.Bitmap(h2d.Tile.fromColor(0x00ff00, 32, 32, 0,6));
        bmp.tile.dx = -16;
        bmp.tile.dy = -16;


        var frames = [
            hxd.Res.gracz1.toTile(),
            hxd.Res.gracz2.toTile(),
            hxd.Res.gracz3.toTile(),
            hxd.Res.gracz4.toTile()];
        
        for(frame in frames) {
            frame.dx = -16;
            frame.dy = -16;
        }
        anim = new h2d.Anim(frames, 5);

        anim.loop = true;

        Main.layers.add(bmp, 2);
        Main.layers.add(anim, 2);
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
        
        var speed = 4;
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
            trace(dir);

            if (0 < dir &&  dir < 180)
                anim.scaleX = 1;
            if (180 < dir && dir < 360)
                anim.scaleX = -1;
            angle = hxd.Math.degToRad(dir);
            dx = Math.sin(angle) * speed;
            dy = -Math.cos(angle) * speed;
            // dy = -Math.sin(dir) * speed;
        } 

        var old_dx = dx;
        var old_dy = dy;

        super.update(dt);

        trace('${old_dx} ${dx}');
        trace('${old_dy} ${dy}');
        trace('');
        if (Std.int(old_dx*10) >= Std.int(dx*10) && Std.int(old_dy*10) >= Std.int(10*dy)) {
            trace('stoi');
            anim.x = 1000;
            anim.y = 1000;
            bmp.x = xx;
            bmp.y = yy;
        } else {
            anim.x = xx;
            anim.y = yy;
            bmp.x = 1000;
            bmp.y = 1000;
        }

        
    }
}