import h2d.Layers;
import h2d.Bitmap;

class Solid {
    public static var tile : h2d.Tile;
    public static var tile_top : h2d.Tile;

    public static var ALL : Array<Solid> = new Array<Solid>();
    public var sprite : Bitmap;
    public var sprite_top : Bitmap;

    public var cx : Int;
    public var cy : Int;

    public function new(x, y, parent) {
        
        cx = x;
        cy = y;
        
        if (Solid.tile == null) {
            Solid.tile = hxd.Res.barrel.toTile();
            Solid.tile_top = hxd.Res.barrel_top.toTile();
        }

        Solid.ALL.push(this);
        sprite = new Bitmap(Solid.tile);
        sprite_top = new Bitmap(Solid.tile_top);
        // var hitbox  = new Bitmap(h2d.Tile.fromColor(0x00ff00, 32, 32, 0.3));
        // Main.layers.add(hitbox, 4);
        Main.layers.add(sprite, 1);
        Main.layers.add(sprite_top, 3);
        sprite_top.x = cx * 32;
        sprite_top.y = cy * 32;
        sprite.x = cx * 32;
        sprite.y = cy * 32;
        // hitbox.x = cx * 32;
        // hitbox.y = (cy+1) * 32;
    }
}