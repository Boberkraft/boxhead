import h2d.Bitmap;

class Bullet extends Entity {
    public static var ALL = new Array<Bullet>();
    var source : Entity;

    var sprite : h2d.Bitmap;

    var cdx : Float;
    var cdy : Float;

    public function new(e:Entity, ang: Float, ?speed=10.0) {
        super(e.xx, e.yy);
        source = e;

        sprite = new Bitmap(hxd.Res.player_bullet.toTile());

        sprite.tile.dx = -4;
        sprite.tile.dy = -4;
        Main.layers.add(sprite, 2);

        cdx = Math.sin(ang) * speed;
        cdy = -Math.cos(ang) * speed;

        Bullet.ALL.push(this);
    }

    override function update(dt:Float) {
        dx = cdx;
        dy = cdy;
 
        super.update(dt);
        sprite.x = xx;
        sprite.y = yy;
    }
}