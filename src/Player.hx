import h2d.Tile;
import h2d.Graphics;
import h2d.Bitmap;
import hxd.Key;

class Player extends Entity {
    var sprite : h2d.Bitmap;
    var bmp : h2d.Tile;
    var anim : h2d.Anim;
    var hitbox : h2d.Bitmap;

    var moving_frames : Array<Tile>;
    var standing_frames : Array<Tile>;
    public function new(x, y, parent) {
        super(x, y);
        trace(xx);
        trace(yy);
        sprite = new h2d.Bitmap();
        // bmp = new h2d.Bitmap(hxd.Res.down.toTile(), parent);
        bmp = hxd.Res.gracz_stoi.toTile();
        // hitbox = new h2d.Bitmap(h2d.Tile.fromColor(0x00ff00, 32, 32, 0,6));
        bmp.dx = -16;
        bmp.dy = -16;


        moving_frames = [
            hxd.Res.gracz1.toTile(),
            hxd.Res.gracz2.toTile(),
            hxd.Res.gracz3.toTile(),
            hxd.Res.gracz4.toTile()];
        
        for(frame in moving_frames) {
            frame.dx = -16;
            frame.dy = -16;
        }

        standing_frames = [
            hxd.Res.gracz_stoi.toTile()
        ];
        
        for(frame in standing_frames) {
            frame.dx = -16;
            frame.dy = -16;
        }

        anim = new h2d.Anim(standing_frames, 5);
        anim.loop = true;

        sprite.tile = bmp;
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
        
        var was_moving = moving;
        if (dir == null) {
            moving = false;
        } else {
            moving = true;

            if (0 < dir &&  dir < 180)
                anim.scaleX = 1;
            if (180 < dir && dir < 360)
                anim.scaleX = -1;
            angle = hxd.Math.degToRad(dir);
            dx = Math.sin(angle) * speed;
            dy = -Math.cos(angle) * speed;
            // dy = -Math.sin(dir) * speed;
        } 
        
        if (moving) {
            if (!was_moving)
                anim.play(moving_frames);
        } else {
            if (was_moving)
                anim.play(standing_frames);
        }
        
        var old_dx = dx;
        var old_dy = dy;

        super.update(dt);

        anim.x = xx;
        anim.y = yy;
    }
}